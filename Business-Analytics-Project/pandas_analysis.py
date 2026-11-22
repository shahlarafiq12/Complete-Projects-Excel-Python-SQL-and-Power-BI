
import pandas as pd

# Load dataset
df = pd.read_csv(
    "dataset/sample_superstore.csv",
    encoding="utf-8-sig"
)

df = df.head(1000)

# 1. Dataset structure
print("\n--- DATASET INFORMATION ---")
print(df.info())

# 2. Statistical summary
print("\n--- STATISTICAL SUMMARY ---")
print(df.describe())

# 3. Missing values
print("\n--- MISSING VALUES ---")
print(df.isnull().sum())

# 4. Duplicate records
print("\n--- DUPLICATE RECORDS ---")
print(df.duplicated().sum())

# 5. Total Sales and Profit
print("\n--- BUSINESS KPIs ---")
print("Total Sales:", round(df["Sales"].sum(), 2))
print("Total Profit:", round(df["Profit"].sum(), 2))
print("Total Quantity:", df["Quantity"].sum())

# 6. Category Analysis
print("\n--- CATEGORY ANALYSIS ---")
print(
    df.groupby("Category")[["Sales", "Profit"]]
    .sum()
    .round(2)
)

# 7. Region Analysis
print("\n--- REGION ANALYSIS ---")
print(
    df.groupby("Region")[["Sales", "Profit"]]
    .sum()
    .round(2)
)

from pathlib import Path

# Exact project folder location
output_path = Path(__file__).parent / "dataset" / "sample_superstore_1000.csv"

# Export CSV
df.to_csv(output_path, index=False)

print("Export successful!")
print("File location:", output_path.resolve())
print("File exists:", output_path.exists())