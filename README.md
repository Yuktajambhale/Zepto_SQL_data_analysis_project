🛒 Zepto E-commerce SQL Data Analyst Portfolio Project








📌 Overview

A real-world SQL Data Analytics portfolio project built on an e-commerce inventory dataset scraped from Zepto, one of India’s leading quick-commerce platforms.

This project simulates a complete end-to-end Data Analyst workflow — from raw data ingestion to business-focused SQL analysis — closely reflecting how analysts work with production-like datasets in real companies.

🎯 Who This Project Is For

📊 Data Analyst / Business Analyst aspirants

📚 Beginners learning SQL through hands-on practice

💼 Candidates preparing for analytics interviews

🧠 Anyone showcasing practical SQL skills in a portfolio

🎯 Project Objective

Use SQL to:

Build a realistic e-commerce inventory database

Perform Exploratory Data Analysis (EDA)

Clean and standardize messy real-world data

Write business-driven SQL queries

Generate insights on pricing, inventory, stock & revenue

📁 Dataset Overview

Source: Kaggle

Originally scraped from: Zepto product listings

Row: Each row represents a unique SKU (Stock Keeping Unit)

Notes: Duplicate product names exist due to different weights, quantities, discounts, and categories

🛠 Tools & Technologies
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=sql&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![CSV](https://img.shields.io/badge/CSV-FF6C37?style=for-the-badge)
![pgAdmin](https://img.shields.io/badge/pgAdmin-336791?style=for-the-badge)

🔹 Column Description
Column Name	Description
sku_id	Unique product identifier (Primary Key)
name	Product name
category	Product category
mrp	Maximum Retail Price (₹)
discountPercent	Discount on MRP
discountedSellingPrice	Final selling price (₹)
availableQuantity	Inventory units available
weightInGms	Product weight
outOfStock	Stock availability flag
quantity	Units per package
🔧 Project Workflow
1️⃣ Database & Table Creation
CREATE TABLE zepto (
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8,2),
    discountPercent NUMERIC(5,2),
    availableQuantity INTEGER,
    discountedSellingPrice NUMERIC(8,2),
    weightInGms INTEGER,
    outOfStock BOOLEAN,
    quantity INTEGER
);

2️⃣ Data Import

Imported using pgAdmin CSV import

Alternative command:

\copy zepto(category,name,mrp,discountPercent,availableQuantity, discountedSellingPrice,weightInGms,outOfStock,quantity) 
FROM 'data/zepto_v2.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ENCODING 'UTF8');


⚠️ CSV encoding issues fixed by saving the file in UTF-8 format

3️⃣ 🔍 Exploratory Data Analysis (EDA)

Total record count

Sample data inspection

NULL value checks

Distinct category identification

In-stock vs out-of-stock comparison

Duplicate SKU detection

4️⃣ 🧹 Data Cleaning

Removed rows with invalid or zero prices

Converted paise → rupees

Standardized numeric columns for accuracy

5️⃣ 📊 Business Insights Using SQL

🔝 Top 10 products with highest discounts

🚫 High-MRP products out of stock

💰 Potential revenue by category

💸 Expensive products with low discounts

📉 Categories with highest average discounts

⚖️ Price-per-gram analysis

📦 Weight-based grouping (Low / Medium / Bulk)

🏷️ Total inventory weight per category

🛠 How to Run the Project
# Clone repository
git clone <repo-link>

# Create a PostgreSQL database
createdb zepto_db

# Run SQL script
psql -d zepto_db -f zepto_SQL_data_analysis.sql

# Import dataset (UTF-8 encoding)
\copy zepto(...) FROM 'data/zepto_v2.csv' WITH (FORMAT csv, HEADER true)

# Execute queries for analysis

📈 Skills Demonstrated

SQL (PostgreSQL)

Data Cleaning & Transformation

Exploratory Data Analysis (EDA)

Retail & E-commerce Analytics

Business-driven problem solving

👩‍💻 Author

Yukta Jambhale
Aspiring Data Analyst | SQL | Data Analytics

📫 Connect: LinkedIn
 | Email: yuktajambhale2000@gmail.com
