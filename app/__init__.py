from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
from flask_principal import Principal
from flask_migrate import Migrate

app = Flask(__name__)
app.config['SECRET_KEY'] = 'your_secret_key'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://server2:T3t0npack@192.168.1.28/school16?charset=utf8mb4&collation=utf8mb4_general_ci'
db = SQLAlchemy(app)

# Initialize Flask-Login
login_manager = LoginManager(app)
login_manager.login_view = 'login'

# Initialize Flask-Principal
principals = Principal(app)

# Initialize Flask-Migrate
migrate = Migrate(app, db)

from app import routes, models