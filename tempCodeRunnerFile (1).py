
import pandas as pd
import mysql.connector

# Load data
df = pd.read_csv(r"D:\SQL (ALL)\classes notes\CoffeeShopSales.csv", encoding='ISO-8859-1')



# Preview data
print(df.head())

# Clean and convert data types
df['unit_price'] = df['unit_price'].astype(str).str.replace('[^0-9.\-]', '', regex=True)
df['unit_price'] = df['unit_price'].astype(float)

# ✅ Convert date & time formats properly
df['transaction_date'] = pd.to_datetime(df['transaction_date'], errors='coerce', dayfirst=True).dt.strftime('%Y-%m-%d')
df['transaction_time'] = pd.to_datetime(df['transaction_time'], errors='coerce').dt.strftime('%H:%M:%S')

# Connect to MySQL
conn = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="system",
    database="coffee_sales"
)
cursor = conn.cursor()

# Define the SQL query
sql = """
INSERT INTO transactions (
    transaction_id, transaction_date, transaction_time, transaction_qty,
    store_id, store_location, product_id, unit_price,
    product_category, product_type, product_detail
) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
"""

# Convert DataFrame to list of tuples
data = [tuple(row) for row in df.itertuples(index=False)]

# Use executemany for bulk insert
cursor.executemany(sql, data)

# Commit and close
conn.commit()
cursor.close()
conn.close()

print("Bulk insert completed successfully!")
