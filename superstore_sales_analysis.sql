SELECT * FROM public.superstore
DROP TABLE superstore;
CREATE TABLE superstore (
    ship_mode VARCHAR(50),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code INT,
    region VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    sales NUMERIC,
    quantity INT,
    discount NUMERIC,
    profit NUMERIC
);


--Total records--
SELECT COUNT (*) 
FROM superstore;

----SALES ANALYSIS----

---Total sales by category----
SELECT 
   category,
   SUM(sales)AS total_sales
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;


SELECT 
  category,
 ROUND(sum(profit),2) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_profit DESC;


--Total sales by region--

SELECT
  region,
  SUM(sales)AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;


SELECT region,
SUM(profit)AS total_profit
FROM superstore
GROUP BY region 
ORDER BY total_profit DESC;

---Total 10 Sub_category by sales---

SELECT sub_category,
SUM(sales)AS total_sales
FROM superstore
GROUP BY sub_category 
ORDER BY total_sales DESC
LIMIT 10;

--Total 10 sub_category by profit---
SELECT sub_category,
SUM(profit)AS total_profit
FROM superstore
GROUP BY sub_category
ORDER BY total_profit DESC
LIMIT 10;

---Total 10 state by sales---
SELECT state,
SUM(sales)AS total_sales 
FROM superstore
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;

--Total 10 states by profit---
SELECT state,
SUM(profit)AS total_profit
FROM superstore
GROUP BY state
ORDER BY total_profit DESC
LIMIT 10;

----DISCOUNT ANALYSIS----

---Total 10 avg discount by category---

SELECT category,
AVG(discount)AS avg_discount
FROM superstore
GROUP BY category 
ORDER BY avg_discount DESC
LIMIT 10;

---ADVAVCED SQL QUERIES----
--PROFIT MARGIN---

SELECT category,
SUM(profit)AS total_profit,
SUM(sales)AS total_sales,
SUM(profit)/SUM(sales)*100 AS profit_margin
FROM superstore
GROUP BY category 
ORDER BY profit_margin DESC;




SELECT state,
SUM(profit)AS total_profit
FROM superstore
GROUP BY state 
HAVING SUM(profit)>0
ORDER BY total_profit DESC
LIMIT 5;



SELECT category,
SUM(sales)AS total_sales,
SUM(sales)*100/(SELECT SUM (sales)FROM superstore)AS sales_percentage
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;

--WINDOW FUNCTON---

SELECT region,
SUM(profit)AS total_profit,
RANK()OVER(ORDER BY SUM(profit)DESC)AS profit_rank
FROM superstore
GROUP BY region;



SELECT category,
AVG(discount)AS avg_discount,
SUM(profit)AS total_profit
FROM superstore 
GROUP BY category
ORDER BY avg_discount DESC;

----CTE---

WITH category_profit AS (SELECT   
category,
SUM(profit)AS total_profit
FROM superstore 
GROUP BY category)
SELECT * FROM category_profit
WHERE total_profit > 50000
ORDER BY total_profit DESC;



/*
Key Insights:

1. Technology generated the highest sales.
2. Technology generated the highest profit.
3. West region generated the highest profit.
4. Phones were the top-selling sub-category.
5. Office Supplies and Technology were the most profitable categories.
*/



/*
=========================================
PROJECT SUMMARY
=========================================

Dataset: Superstore Sales Data

Columns Used:
- Ship Mode
- Segment
- Country
- City
- State
- Postal Code
- Region
- Category
- Sub Category
- Sales
- Quantity
- Discount
- Profit

Analysis Performed:
1. Total Records Count
2. Category-wise Sales Analysis
3. Region-wise Sales Analysis
4. Category-wise Profit Analysis
5. Region-wise Profit Analysis
6. Top Selling Sub-Categories
7. Top Profitable Sub-Categories
8. State-wise Sales Analysis
9. State-wise Profit Analysis
10. Discount Analysis
11. Profit Margin Analysis
12. Window Function (RANK)
13. Common Table Expression (CTE)

Tools Used:
- PostgreSQL
- pgAdmin 4

Author:
Kailas Chavan
*/