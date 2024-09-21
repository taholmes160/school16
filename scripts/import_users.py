import pandas as pd
import sqlalchemy
from sqlalchemy import create_engine

# Connection strings
source_db_connection_string = 'mysql+mysqlconnector://server2:T3t0npack@192.168.1.28/school15?charset=utf8mb4&collation=utf8mb4_general_ci'
target_db_connection_string = 'mysql+mysqlconnector://server2:T3t0npack@192.168.1.28/school16?charset=utf8mb4&collation=utf8mb4_general_ci'

# Create connections to the source and target databases
source_engine = create_engine(source_db_connection_string)
target_engine = create_engine(target_db_connection_string)

# Read roles from the source database
roles_query = "SELECT * FROM roles"
roles_df = pd.read_sql(roles_query, source_engine)

# Insert roles into the target database
roles_df.to_sql('role', target_engine, if_exists='append', index=False)

# Read users from the source database
users_query = "SELECT * FROM user"
users_df = pd.read_sql(users_query, source_engine)

# Insert users into the target database
users_df.to_sql('user', target_engine, if_exists='append', index=False)

print("Roles and users imported successfully.")