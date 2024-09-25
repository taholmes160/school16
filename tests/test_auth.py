# tests/test_auth.py

import pytest
import sys
import os

# Add the parent directory to the sys.path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from app import app, db
from app.models import User

@pytest.fixture
def client():
	app.config['TESTING'] = True
	app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///:memory:'  # Use an in-memory database for testing
	with app.test_client() as client:
		with app.app_context():
			db.create_all()
			yield client
			db.drop_all()

def test_login(client):
	# Create a test user
	user = User(username='testuser', email='test@example.com', first_name='Test', last_name='User',role_id='17')
	user.set_password('testpassword')
	db.session.add(user)
	db.session.commit()

	# Attempt to log in
	response = client.post('/login', data={
		'username': 'testuser',
		'password': 'testpassword'
	}, follow_redirects=True)

	assert response.status_code == 200
	assert b'Welcome, testuser' in response.data