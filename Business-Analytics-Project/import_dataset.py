
import pandas as pd
import mysql.connector

# 1. Load CSV
df = pd.read_csv(
    "dataset/sample_superstore.csv",
    encoding="utf-8-sig"
)

df = df.head(1000)

# 2. Clean column names
df.columns = [
    "row_id", "order_id", "order_date", "ship_date",
    "ship_mode", "customer_id", "customer_name", "segment",
    "country_region", "city", "state_province", "postal_code",
    "region", "product_id", "category", "sub_category",
    "product_name", "sales", "quantity", "discount", "profit"
]

# 3. Convert dates
df["order_date"] = pd.to_datetime(
    df["order_date"]
).dt.date

df["ship_date"] = pd.to_datetime(
    df["ship_date"]
).dt.date

# Handle missing postal codes
df["postal_code"] = df["postal_code"].apply(
    lambda x: None if pd.isna(x) else str(x).replace(".0", "")
)

# Handle other missing values
df = df.astype(object).where(pd.notna(df), None)

# 4. Connect to MySQL
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="pss",
    database="retail_business_analytics"
)

cursor = connection.cursor()

# 5. Create raw table
cursor.execute("DROP TABLE IF EXISTS superstore_raw")

cursor.execute("""
CREATE TABLE superstore_raw (
    row_id INT PRIMARY KEY,
    order_id VARCHAR(30),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(30),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country_region VARCHAR(100),
    city VARCHAR(100),
    state_province VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(30),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales DECIMAL(12,4),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(12,4)
)
""")

# 6. Insert records
sql = """
INSERT INTO superstore_raw VALUES (
    %s, %s, %s, %s, %s, %s, %s,
    %s, %s, %s, %s, %s, %s, %s,
    %s, %s, %s, %s, %s, %s, %s
)
"""

data = [tuple(row) for row in df.itertuples(index=False, name=None)]

cursor.executemany(sql, data)
connection.commit()

print("Data imported successfully!")
print("Total records inserted:", cursor.rowcount)

cursor.close()
connection.close()
