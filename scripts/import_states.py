import pandas as pd
import sqlalchemy
from sqlalchemy import create_engine

# Connection strings
source_db_connection_string = 'mysql+mysqlconnector://server2:T3t0npack@192.168.1.28/school10?charset=utf8mb4&collation=utf8mb4_general_ci'
target_db_connection_string = 'mysql+mysqlconnector://server2:T3t0npack@192.168.1.28/school16?charset=utf8mb4&collation=utf8mb4_general_ci'

# Create connections to the source and target databases
source_engine = create_engine(source_db_connection_string)
target_engine = create_engine(target_db_connection_string)

# Read data from the source database
source_query = "SELECT * FROM states"
source_df = pd.read_sql(source_query, source_engine)

# Insert data into the target database
source_df.to_sql('state', target_engine, if_exists='append', index=False)

print("Data imported successfully.")