from app import db
from werkzeug.security import generate_password_hash, check_password_hash

class User(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	username = db.Column(db.String(64), unique=True)
	email = db.Column(db.String(120), unique=True)
	password_hash = db.Column(db.String(512))
	first_name = db.Column(db.String(64))
	last_name = db.Column(db.String(64))
	role_id = db.Column(db.Integer, db.ForeignKey('role.id'))

	role = db.relationship('Role', backref=db.backref('users', lazy=True))

	def set_password(self, password):
		self.password_hash = generate_password_hash(password)

	def check_password(self, password):
		return check_password_hash(self.password_hash, password)

	def __repr__(self):
		return f'<User {self.username}>'

class Role(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	name = db.Column(db.String(64), unique=True)

	def __repr__(self):
		return f'<Role {self.name}>'

class State(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	name = db.Column(db.String(64), unique=True)

	def __repr__(self):
		return f'<State {self.name}>'

class StudentProfile(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
	grade = db.Column(db.Integer, nullable=False)
	address1 = db.Column(db.String(100), nullable=False)
	address2 = db.Column(db.String(100))
	city = db.Column(db.String(50), nullable=False)
	state_id = db.Column(db.Integer, db.ForeignKey('state.id'), nullable=False)
	zip_code = db.Column(db.String(10), nullable=False)
	birth_date = db.Column(db.Date, nullable=False)

	user = db.relationship('User', backref=db.backref('student_profile', uselist=False))
	state = db.relationship('State', backref=db.backref('students', lazy=True))

	def __repr__(self):
		return f'<StudentProfile {self.user.first_name} {self.user.last_name}>'

