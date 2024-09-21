import sys
import os

# Add the project directory to the Python path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
import pandas as pd
import sqlalchemy
from app import db, create_app
from app.models import User

# Example connection strings
source_db_connection_string = 'mysql+mysqlconnector://server2:T3t0npack@192.168.1.28/school10?charset=utf8mb4&collation=utf8mb4_general_ci'
target_db_connection_string = 'mysql+mysqlconnector://server2:T3t0npack@192.168.1.28/school15?charset=utf8mb4&collation=utf8mb4_general_ci'

# Create a connection to the source database
source_engine = sqlalchemy.create_engine(source_db_connection_string)

# Query to extract student data
query = """
SELECT 
    username, 
    email, 
    password_hash, 
    first_name, 
    last_name 
FROM users
WHERE role_id = 19 AND is_active = 1
"""

# Load data into a DataFrame
students_df = pd.read_sql(query, source_engine)

# Ensure the data matches the schema
students_df['role'] = 'student'

# Create a connection to the target database
target_engine = sqlalchemy.create_engine(target_db_connection_string)

# Initialize the Flask app context
app = create_app()
app.app_context().push()

# Function to import students
def import_students(students_df):
    for index, row in students_df.iterrows():
        user = User(
            username=row['username'],
            email=row['email'],
            password_hash=row['password_hash'],
            first_name=row['first_name'],
            last_name=row['last_name'],
            role=row['role']
        )
        db.session.add(user)
    db.session.commit()

# Import the students
import_students(students_df)
