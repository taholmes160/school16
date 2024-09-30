# routes.py

from flask import render_template, redirect, url_for, flash, current_app
from flask_login import login_user, logout_user, login_required, current_user
from flask_principal import (
    PermissionDenied,
    Identity,
    AnonymousIdentity,
    identity_changed,
    identity_loaded,
    UserNeed,
    RoleNeed,
)
from sqlalchemy.orm import joinedload
from app import app, db, login_manager
from app.models import User, StudentProfile, admin_permission
from app.forms import LoginForm, BulkUpdateForm, AddStudentForm
from datetime import datetime
import logging

# Configure logging
logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

@identity_loaded.connect_via(app)
def on_identity_loaded(sender, identity):
    # Set the identity user object
    identity.user = current_user

    # Add the UserNeed to the identity
    if hasattr(current_user, 'id'):
        identity.provides.add(UserNeed(current_user.id))

    # Add the roles that the user has
    if hasattr(current_user, 'role'):
        identity.provides.add(RoleNeed(current_user.role.name))

@app.route('/')
def index():
    return render_template('index.html')

def generate_username():
    current_year = datetime.now().year
    last_user = User.query.filter(User.username.like(f'stu{current_year}%')).order_by(User.id.desc()).first()
    if last_user:
        last_number = int(last_user.username[-4:])
        new_number = last_number + 1
    else:
        new_number = 1
    return f'stu{current_year}{new_number:04d}'

@app.route('/students', methods=['GET'])
@login_required
def student_list():
    users = User.query.options(joinedload(User.student_profile)).all()
    return render_template('student_list.html', users=users)

@app.route('/bulk_update', methods=['GET', 'POST'])
@login_required
@admin_permission.require(http_exception=403)
def bulk_update():
    form = BulkUpdateForm()
    if form.validate_on_submit():
        logger.debug("Form validation passed.")
        student_ids = form.student_ids.data
        updates = {
            'grade': form.grade.data,
            'address1': form.address1.data,
            'address2': form.address2.data,
            'city': form.city.data,
            'state_id': form.state_id.data,
            'zip_code': form.zip_code.data,
            'birth_date': form.birth_date.data,
            'phone_number': form.phone_number.data
        }
        updates = {k: v for k, v in updates.items() if v is not None and v != ''}
        logger.debug(f"Selected student IDs: {student_ids}")
        logger.debug(f"Updates to apply: {updates}")

        if not student_ids:
            flash('No students selected for update.', 'warning')
            return redirect(url_for('bulk_update'))

        try:
            for student_id in student_ids:
                student = StudentProfile.query.filter_by(user_id=student_id).first()
                if student:
                    for key, value in updates.items():
                        setattr(student, key, value)
                    logger.debug(f"Updated student profile for user_id {student_id}")
                else:
                    logger.warning(f"No StudentProfile found for user_id {student_id}")
            db.session.commit()
            flash('Students updated successfully!', 'success')
        except Exception as e:
            db.session.rollback()
            logger.error(f"Error updating students: {e}")
            flash('An error occurred while updating students.', 'error')

        return redirect(url_for('student_list'))
    else:
        logger.debug("Form validation failed.")
        logger.debug(f"Form errors: {form.errors}")

    return render_template('bulk_update.html', form=form)

@app.route('/add_student', methods=['GET', 'POST'])
@login_required
@admin_permission.require(http_exception=403)
def add_student():
    form = AddStudentForm()
    if form.validate_on_submit():
        username = generate_username()
        user = User(
            username=username,
            email=form.email.data,
            first_name=form.first_name.data,
            last_name=form.last_name.data,
            role_id=form.role_id.data
        )
        user.set_password(form.password.data)
        db.session.add(user)
        db.session.commit()

        student_profile = StudentProfile(
            user_id=user.id,
            grade=form.grade.data,
            address1=form.address1.data,
            address2=form.address2.data,
            city=form.city.data,
            state_id=form.state_id.data,
            zip_code=form.zip_code.data,
            birth_date=form.birth_date.data,
            phone_number=form.phone_number.data
        )
        db.session.add(student_profile)
        db.session.commit()

        flash('Student added successfully!', 'success')
        return redirect(url_for('student_list'))
    return render_template('add_student.html', form=form)

@app.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        user = User.query.filter_by(username=form.username.data).first()
        if user is None or not user.check_password(form.password.data):
            flash('Invalid username or password')
            return redirect(url_for('login'))
        login_user(user, remember=form.remember_me.data)
        # Set the identity
        identity_changed.send(
            current_app._get_current_object(),
            identity=Identity(user.id)
        )
        return redirect(url_for('index'))
    return render_template('login.html', form=form)

@app.route('/logout')
@login_required
def logout():
    logout_user()
    # Remove the identity
    identity_changed.send(
        current_app._get_current_object(),
        identity=AnonymousIdentity()
    )
    return redirect(url_for('index'))

@app.errorhandler(PermissionDenied)
def handle_permission_denied(error):
    flash('You do not have permission to access this page.', 'error')
    return redirect(url_for('index'))
