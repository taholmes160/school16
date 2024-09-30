# forms.py

from flask_wtf import FlaskForm
from wtforms import (
    StringField,
    PasswordField,
    BooleanField,
    SubmitField,
    SelectField,
    DateField,
    SelectMultipleField,
)
from wtforms.validators import DataRequired, Email, EqualTo, ValidationError, Optional
from app.models import User, Role, State
from wtforms.widgets import ListWidget, CheckboxInput

class LoginForm(FlaskForm):
    username = StringField('Username', validators=[DataRequired()])
    password = PasswordField('Password', validators=[DataRequired()])
    remember_me = BooleanField('Remember Me')
    submit = SubmitField('Sign In')

class BulkUpdateForm(FlaskForm):
    student_ids = SelectMultipleField(
        'Students',
        coerce=int,
        validators=[DataRequired()],
        option_widget=CheckboxInput(),
        widget=ListWidget(prefix_label=False)
    )
    grade = StringField('Grade')
    address1 = StringField('Address 1')
    address2 = StringField('Address 2')
    city = StringField('City')
    state_id = SelectField('State', coerce=int)
    zip_code = StringField('Zip Code')
    birth_date = DateField('Birth Date', validators=[Optional()])
    phone_number = StringField('Phone Number')
    submit = SubmitField('Update Students')

    def __init__(self, *args, **kwargs):
        super(BulkUpdateForm, self).__init__(*args, **kwargs)
        self.state_id.choices = [(state.id, state.name) for state in State.query.all()]
        self.student_ids.choices = [(user.id, f"{user.first_name} {user.last_name}") for user in User.query.all()]

class AddStudentForm(FlaskForm):
    first_name = StringField('First Name', validators=[DataRequired()])
    last_name = StringField('Last Name', validators=[DataRequired()])
    email = StringField('Email', validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired()])
    confirm_password = PasswordField(
        'Confirm Password', validators=[DataRequired(), EqualTo('password')]
    )
    role_id = SelectField('Role', coerce=int, validators=[DataRequired()])
    grade = StringField('Grade', validators=[DataRequired()])
    address1 = StringField('Address 1', validators=[DataRequired()])
    address2 = StringField('Address 2')
    city = StringField('City', validators=[DataRequired()])
    state_id = SelectField('State', coerce=int, validators=[DataRequired()])
    zip_code = StringField('Zip Code', validators=[DataRequired()])
    birth_date = DateField('Birth Date', validators=[DataRequired()])
    submit = SubmitField('Add Student')

    def __init__(self, *args, **kwargs):
        super(AddStudentForm, self).__init__(*args, **kwargs)
        self.role_id.choices = [(role.id, role.name) for role in Role.query.all()]
        self.state_id.choices = [(state.id, state.name) for state in State.query.all()]

    def validate_email(self, email):
        user = User.query.filter_by(email=email.data).first()
        if user is not None:
            raise ValidationError('Please use a different email address.')
