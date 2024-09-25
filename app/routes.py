from app import app, db, login_manager
from app.models import User, Role, State, StudentProfile, admin_permission, teacher_permission, student_permission
from flask import render_template, request, redirect, url_for, flash
from flask_login import login_user, logout_user, login_required, current_user
from flask_principal import PermissionDenied
from app.forms import LoginForm
from datetime import datetime

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

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

@app.route('/students', methods=['GET', 'POST'])
@login_required
def student_list():
    students = StudentProfile.query.all()
    return render_template('student_list.html', students=students)

@app.route('/add', methods=['GET', 'POST'])
@login_required
def add_student():
    if request.method == 'POST':
        # Log form data
        print(request.form)

        first_name = request.form.get('first_name')
        last_name = request.form.get('last_name')
        grade = request.form.get('grade')
        address1 = request.form.get('address1')
        address2 = request.form.get('address2')
        city = request.form.get('city')
        state_id = request.form.get('state_id')
        zip_code = request.form.get('zip_code')
        birth_date = request.form.get('birth_date')
        role_id = request.form.get('role_id')

        # Validate form data
        if not all([first_name, last_name, grade, address1, city, state_id, zip_code, birth_date, role_id]):
            flash('All fields except address2 are required!', 'danger')
            return redirect(url_for('add_student'))

        # Generate username and email
        username = generate_username()
        email = f'{username}@school.edu'  # This should be configurable

        # Set default password
        default_password = 'defaultpassword'  # This should be configurable

        # Create User
        user = User(
            username=username,
            email=email,
            first_name=first_name,
            last_name=last_name,
            role_id=role_id
        )
        user.set_password(default_password)
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

        return redirect(url_for('student_list'))

    states = State.query.all()
    roles = Role.query.all()
    return render_template('add_student.html', states=states, roles=roles)

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