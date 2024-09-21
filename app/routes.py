from app import app, db, login_manager
from app.models import User, Role, State, StudentProfile, admin_permission, teacher_permission, student_permission
from flask import render_template, request, redirect, url_for, flash
from flask_login import login_user, logout_user, login_required, current_user
from flask_principal import PermissionDenied
from app.forms import LoginForm

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

@app.route('/')
def index():
    students = StudentProfile.query.all()
    return render_template('index.html', students=students)

@app.route('/add', methods=['GET', 'POST'])
@login_required
def add_student():
    if request.method == 'POST':
        first_name = request.form['first_name']
        last_name = request.form['last_name']
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']
        grade = request.form['grade']
        address1 = request.form['address1']
        address2 = request.form['address2']
        city = request.form['city']
        state_id = request.form['state_id']
        zip_code = request.form['zip_code']
        birth_date = request.form['birth_date']

        # Create User
        user = User(
            username=username,
            email=email,
            first_name=first_name,
            last_name=last_name,
            role_id=1  # Assuming 1 is the role ID for students
        )
        user.set_password(password)
        db.session.add(user)
        db.session.commit()

        # Create StudentProfile
        student_profile = StudentProfile(
            user_id=user.id,
            grade=grade,
            address1=address1,
            address2=address2,
            city=city,
            state_id=state_id,
            zip_code=zip_code,
            birth_date=birth_date
        )
        db.session.add(student_profile)
        db.session.commit()

        return redirect(url_for('index'))

    states = State.query.all()
    return render_template('add_student.html', states=states)

@app.route('/login', methods=['GET', 'POST'])
def login():
    if current_user.is_authenticated:
        return redirect(url_for('index'))
    form = LoginForm()
    if form.validate_on_submit():
        user = User.query.filter_by(username=form.username.data).first()
        if user is None or not user.check_password(form.password.data):
            flash('Invalid username or password')
            return redirect(url_for('login'))
        login_user(user, remember=form.remember_me.data)
        return redirect(url_for('index'))
    return render_template('login.html', form=form)

@app.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('index'))

@app.route('/user_list')
@login_required
@admin_permission.require(http_exception=403)
def user_list():
    users = User.query.all()
    return render_template('user_list.html', users=users)

@app.errorhandler(PermissionDenied)
def handle_permission_denied(error):
    return render_template('403.html'), 403