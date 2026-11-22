import mysql.connector

# Connect to MySQL Database
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="pss",
    database="retail_sales"
)

# Create Cursor
cursor = connection.cursor()

# Fetch Customers Data
cursor.execute("SELECT * FROM customers")

# Display Results
for row in cursor.fetchall():
    print(row)

# Close Connection
cursor.close()
connection.close()