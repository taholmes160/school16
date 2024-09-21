import sys
import os

# Add the project directory to the sys.path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from app import app, db
from app.models import User
from werkzeug.security import generate_password_hash

# Define the new password
new_password = "school1234"

with app.app_context():
	users = User.query.all()
	for user in users:
		user.password_hash = generate_password_hash(new_password)
		db.session.add(user)
	db.session.commit()
	print("Password hashes updated successfully.")