
# ==========================================
# PYTHON DATA ANALYTICS - DAY 1
# Topic: Pandas and NumPy Fundamentals
# Objective: Explore and analyze sales data
# ==========================================

import pandas as pd
import numpy as np

# 1. Create a sample sales dataset

data = {
    "Order_ID": [101, 102, 103, 104, 105, 106, 107, 108],
    "Customer": ["Aarav", "Priya", "Riya", "Kabir",
                 "Ananya", "Rahul", "Meera", "Arjun"],
    "City": ["Delhi", "Mumbai", "Delhi", "Bengaluru",
             "Mumbai", "Delhi", "Pune", "Mumbai"],
    "Category": ["Electronics", "Fashion", "Electronics",
                 "Furniture", "Fashion", "Furniture",
                 "Electronics", "Fashion"],
    "Sales": [2500, 1800, 3200, 4500, 3500, 2100, 5800, 2700],
    "Quantity": [2, 1, 3, 2, 2, 1, 4, 2]
}

df = pd.DataFrame(data)

# 2. Explore the dataset

print("\n--- FIRST FIVE RECORDS ---")
print(df.head())

print("\n--- DATASET INFORMATION ---")
print(df.info())

print("\n--- STATISTICAL SUMMARY ---")
print(df.describe())

# 3. Check rows and columns

print("\n--- DATASET SHAPE ---")
print(df.shape)

print("\n--- COLUMN NAMES ---")
print(df.columns.tolist())

# 4. Check missing values

print("\n--- MISSING VALUES ---")
print(df.isnull().sum())

# 5. Check duplicate records

print("\n--- DUPLICATE RECORDS ---")
print(df.duplicated().sum())

# 6. Calculate total revenue

total_revenue = df["Sales"].sum()
print("\nTotal Revenue:", total_revenue)

# 7. Calculate average sales

average_sales = df["Sales"].mean()
print("Average Sales:", round(average_sales, 2))

# 8. Find highest and lowest sales

print("Highest Sales:", df["Sales"].max())
print("Lowest Sales:", df["Sales"].min())

# 9. Analyze city-wise sales

city_sales = df.groupby("City")["Sales"].sum()

print("\n--- CITY-WISE SALES ---")
print(city_sales.sort_values(ascending=False))

# 10. Analyze category-wise sales

category_sales = df.groupby("Category")["Sales"].sum()

print("\n--- CATEGORY-WISE SALES ---")
print(category_sales.sort_values(ascending=False))

# 11. Calculate total quantity sold

print("\nTotal Quantity Sold:", df["Quantity"].sum())

# 12. Create a new column: Revenue per unit

df["Revenue_Per_Unit"] = df["Sales"] / df["Quantity"]

print("\n--- UPDATED DATASET ---")
print(df)

# 13. Filter high-value orders

high_value_orders = df[df["Sales"] > 3000]

print("\n--- HIGH VALUE ORDERS ---")
print(high_value_orders)

# 14. Convert sales column into a NumPy array

sales_array = np.array(df["Sales"])

print("\n--- NUMPY ANALYSIS ---")
print("Array:", sales_array)
print("Mean:", np.mean(sales_array))
print("Median:", np.median(sales_array))
print("Standard Deviation:", round(np.std(sales_array), 2))

# ==========================================
# END OF ANALYSIS
# ==========================================
