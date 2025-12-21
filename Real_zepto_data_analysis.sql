drop table if exists zepto;

CREATE TABLE zepto(
sku_id SERIAL PRIMARY KEY ,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
ountOfStock BOOLEAN,
quantity INTEGER
);

-- Data exploration
-- Count of rows
SELECT COUNT(*) FROM zepto;

-- Sample data
SELECT * FROM zepto 
LIMIT 10;

-- NULL VALUES
SELECT * FROM zepto
WHERE name is null
OR
category is null
OR
mrp is NULL
OR
discountPercent is NULL
OR
discountedSellingPrice is NULL
OR
weightInGms is NULL
OR
availableQuantity is NULL
OR
ountofstock is NULL
OR
quantity is NULL;

-- different product category
SELECT distinct(category)
from zepto
order by category;

-- product in stock vs out of stocj
SELECT ountofstock,count(sku_id)
FROM zepto
GROUP BY ountofstock;

-- product names present multiple times
SELECT name ,count(sku_id) as "Number of Sku's"
FROM zepto
GROUP BY name
HAVING count(sku_id)>1
ORDER BY count(sku_id) desc;


-- data cleaning
-- product with price 0

SELECT * FROM zepto
WHERE mrp =0 OR discountedSellingPrice =0;

DELETE FROM zepto 
WHERE mrp = 0;

-- convert paise to rupees
UPDATE zepto
SET 
    mrp = mrp / 100.0,
    discountedSellingPrice = discountedSellingPrice / 100.0;

SELECT mrp,discountedSellingPrice FROM zepto;

-- Q1. find the top 10 bestvalue products based on the discount percentage
SELECT distinct name,mrp,discountPercent
from zepto
order by discountPercent desc
limit 10;


-- Q2 What are the products with high mrp but out of stock
SELECT DISTINCT name,mrp
from zepto
where ountofstock=TRUE and mrp>300
order by mrp desc;

-- Q3.calculate estimated the total revenue for each category
SELECT
    SUM(discountedsellingprice + availablequantity) AS total_revenue
FROM zepto;

-- Q4.find all the products where mrp is greater than 1500 and discount is less than 10%
SELECT distinct name,mrp,discountPercent 
from zepto
where mrp >500 and discountPercent < 10
order by mrp desc ,discountPercent desc;


-- Q5.IDENTIFY the top 5 categories offering the highest average discount prcentage
SELECT  category,
ROUND(AVG(discountPercent),2) AS avg_discount
from zepto
group by category
order by avg_discount desc
LIMIT 5;



-- Q6.Find the price per gram for product above 100 g and sort the best value
SELECT DISTINCT name,weightInGms,discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
from zepto
where weightInGms>=100
order by price_per_gram;

-- Q7 Group the products into category like low,medium and bulk
SELECT DISTINCT name,weightInGms,
CASE WHEN weightInGms<1000 THEN 'LOW'
     WHEN weightInGms<5000 THEN 'MEDIUM'
	 ELSE 'BULK'
	 END AS weight_category
from zepto;

-- Q8 WHAT is the total inventory weight per category
SELECT category,
sum(weightInGms* availableQuantity) AS total_weight
from zepto
group by category
order by total_weight;


