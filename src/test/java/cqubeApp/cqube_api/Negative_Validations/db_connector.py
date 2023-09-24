# db_connector.py
import sys
import psycopg2

def execute_query(query):
    # Database connection parameters
    db_params = {
        'host': 'localhost',
        'database': 'postgres',
        'user': 'postgres',
        'password': 'cQube@123',
    }
    connection = psycopg2.connect(**db_params)
    cursor = connection.cursor()
    cursor.execute(query)
    total_records = cursor.fetchone()[0]
    print(total_records)
    return total_records

if __name__ == "__main__":
    # Check if a query is provided as a command-line argument
    if len(sys.argv) != 2:
        print("Usage: python3 db_connector.py [query]")
        sys.exit(1)
    # Extract the query from the command-line arguments
    query = sys.argv[1]
    # Execute the query
    execute_query(query)
