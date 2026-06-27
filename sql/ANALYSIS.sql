 --Top Selling Products

SELECT TOP 10
    p.product_name,
    SUM(f.quantity) AS TotalSold
FROM sales f
JOIN Products p
ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY TotalSold DESC;

--Sales by Store
SELECT
    s.store_name,
    SUM(f.quantity) AS TotalSales
FROM sales f
JOIN Stores s
ON f.store_id = s.store_id
GROUP BY s.store_name
ORDER BY TotalSales DESC;

--Sales by Region

SELECT
    r.sales_region,
    SUM(f.quantity) AS TotalSales
FROM sales f
JOIN Stores s
ON f.store_id = s.store_id
JOIN Region r
ON s.region_id = r.region_id
GROUP BY r.sales_region
ORDER BY TotalSales DESC;


--Top Customers

SELECT TOP 10
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(f.quantity) AS TotalPurchased
FROM sales f
JOIN Customers c
ON f.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY TotalPurchased DESC;

--Return Analysis

SELECT TOP 10
    p.product_name,
    SUM(r.quantity) AS TotalReturns
FROM Returns r
JOIN Products p
ON r.product_id = p.product_id
GROUP BY p.product_name
ORDER BY TotalReturns DESC;

-- Total Return $ Sales

SELECT
(
    SELECT SUM(quantity)
    FROM Returns
) AS TotalReturns,

(
    SELECT SUM(quantity)
    FROM sales
) AS TotalSales;

--Return Rate
SELECT
(
    SELECT SUM(quantity)
    FROM Returns
) AS TotalReturns,

(
    SELECT SUM(quantity)
    FROM sales
) AS TotalSales,

CAST(
(
    SELECT SUM(quantity)
    FROM Returns
) * 100.0 /

(
    SELECT SUM(quantity)
    FROM sales
)
AS DECIMAL(5,2)
) AS ReturnRate;


-- Total Revenue 

SELECT
SUM(f.quantity * p.product_retail_price) AS TotalRevenue
FROM sales f
JOIN Products p
ON f.product_id = p.product_id;


--Revenue by Product

SELECT TOP 10
p.product_name,
SUM(f.quantity * p.product_retail_price) AS Revenue
FROM sales f
JOIN Products p
ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY Revenue DESC;


/* Store Performance */
SELECT
    st.store_name,
    r.sales_region,
    SUM(s.quantity) AS total_sales
FROM sales s
JOIN stores st
ON s.store_id = st.store_id
JOIN region r
ON st.region_id = r.region_id
GROUP BY st.store_name, r.sales_region
ORDER BY total_sales DESC;

/* Monthly Sales Trend */
SELECT
    YEAR(transaction_date) AS year,
    MONTH(transaction_date) AS month,
    SUM(quantity) AS total_sales
FROM sales
GROUP BY
    YEAR(transaction_date),
    MONTH(transaction_date)
ORDER BY year, month;


/* Sales by Year */
SELECT
    YEAR(transaction_date) AS year,
    SUM(quantity) AS total_sales
FROM sales
GROUP BY YEAR(transaction_date)
ORDER BY year;

