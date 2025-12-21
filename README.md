🛒 Zepto E-commerce SQL Data Analyst Portfolio Project

This is a real-world SQL data analytics portfolio project based on an e-commerce inventory dataset scraped from Zepto, one of India’s leading quick-commerce platforms.

The project simulates an end-to-end Data Analyst workflow, starting from raw data ingestion to business-focused SQL analysis and insights. It closely reflects how data analysts work with real production-like data.

🎯 Who This Project Is For

📊 Data Analyst / Business Analyst aspirants

📚 Beginners learning SQL with hands-on practice

💼 Candidates preparing for analytics interviews in retail, e-commerce, or product-based companies

🧠 Anyone looking to showcase practical SQL skills through a strong portfolio project

📌 Project Overview

The goal of this project is to use SQL to:

Set up a realistic e-commerce inventory database

Perform Exploratory Data Analysis (EDA)

Clean and standardize messy real-world data

Write business-driven SQL queries

Generate insights related to pricing, inventory, stock availability, and revenue

📁 Dataset Overview

The dataset was sourced from Kaggle and was originally scraped from Zepto’s product listings.

Each row represents a unique SKU (Stock Keeping Unit). Duplicate product names exist because the same product may appear in different package sizes, weights, discounts, or categories — just like real e-commerce catalog data.

🧾 Columns Description

sku_id – Unique identifier for each product (Primary Key)

name – Product name as displayed on the app

category – Product category (Fruits, Snacks, Beverages, etc.)

mrp – Maximum Retail Price (converted from paise to ₹)

discountPercent – Discount percentage applied on MRP

discountedSellingPrice – Final selling price after discount (₹)

availableQuantity – Units available in inventory

weightInGms – Product weight in grams

outOfStock – Boolean flag indicating stock availability

quantity – Units per package (count or grams)

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

The dataset was imported using pgAdmin CSV import.

Alternative command:

\copy zepto(category,name,mrp,discountPercent,availableQuantity,
            discountedSellingPrice,weightInGms,outOfStock,quantity)
FROM 'data/zepto_v2.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ENCODING 'UTF8');


⚠️ CSV encoding issues were resolved by saving the file in UTF-8 format.

3️⃣ 🔍 Exploratory Data Analysis (EDA)

Counted total records

Reviewed sample rows

Checked for NULL values

Identified distinct product categories

Compared in-stock vs out-of-stock products

Detected duplicate product entries with different SKUs

4️⃣ 🧹 Data Cleaning

Removed rows with invalid or zero prices

Converted MRP and discounted prices from paise to rupees

Standardized numeric values for accurate analysis

5️⃣ 📊 Business Insights Using SQL

Identified top 10 products with highest discounts

Found high-MRP products currently out of stock

Estimated potential revenue per category

Filtered expensive products with minimal discounts

Ranked categories by average discount offered

Calculated price-per-gram for value analysis

Grouped products by weight (Low, Medium, Bulk)

Measured total inventory weight by category

🛠️ How to Run the Project

Clone the repository

Create a PostgreSQL database

Run zepto_SQL_data_analysis.sql

Import the dataset (ensure UTF-8 encoding)

Execute queries for EDA, cleaning, and analysis

📈 Skills Demonstrated

SQL (PostgreSQL)

Data Cleaning & Transformation

Exploratory Data Analysis

Retail & E-commerce Analytics

Business-driven SQL problem solving

👩‍💻 Author

Yukta Jambhale
Aspiring Data Analyst | SQL | Data Analytics
