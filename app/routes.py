from app import app, db
from app.models import User, Role, State, StudentProfile
from flask import render_template, request, redirect, url_for

@app.route('/')
def index():
	students = StudentProfile.query.all()
	return render_template('index.html', students=students)

@app.route('/add', methods=['GET', 'POST'])
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