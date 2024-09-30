# models.py

from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import UserMixin
from flask_principal import Permission, RoleNeed
from app import db

class User(UserMixin, db.Model):
    __tablename__ = 'user'
    __table_args__ = {'extend_existing': True}
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(64), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password_hash = db.Column(db.String(512), nullable=False)
    first_name = db.Column(db.String(64), nullable=False)
    last_name = db.Column(db.String(64), nullable=False)
    role_id = db.Column(db.Integer, db.ForeignKey('role.id'), nullable=False)
    role = db.relationship('Role', back_populates='users')  # Updated relationship
    student_profile = db.relationship('StudentProfile', backref='user', uselist=False)

    def set_password(self, password):
        self.password_hash = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password_hash, password)

class Role(db.Model):
    __tablename__ = 'role'
    __table_args__ = {'extend_existing': True}
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64), unique=True, nullable=False)
    users = db.relationship('User', back_populates='role')  # Updated relationship

class State(db.Model):
    __tablename__ = 'state'
    __table_args__ = {'extend_existing': True}
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64), unique=True, nullable=False)
    students = db.relationship('StudentProfile', backref='state', lazy=True)

class StudentProfile(db.Model):
    __tablename__ = 'student_profile'
    __table_args__ = {'extend_existing': True}
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    grade = db.Column(db.String(64), nullable=False)
    address1 = db.Column(db.String(128), nullable=False)
    address2 = db.Column(db.String(128))
    city = db.Column(db.String(64), nullable=False)
    state_id = db.Column(db.Integer, db.ForeignKey('state.id'), nullable=False)
    zip_code = db.Column(db.String(10), nullable=False)
    birth_date = db.Column(db.Date, nullable=False)
    phone_number = db.Column(db.String(20))

# Define permissions
class AdminPermission(Permission):
    def __init__(self):
        admin_roles = ['IT Support', 'OtherAdminRole1', 'OtherAdminRole2']  # Define your admin roles
        needs = [RoleNeed(role) for role in admin_roles]
        super(AdminPermission, self).__init__(*needs)

admin_permission = AdminPermission()
teacher_permission = Permission(RoleNeed('teacher'))
student_permission = Permission(RoleNeed('student'))
