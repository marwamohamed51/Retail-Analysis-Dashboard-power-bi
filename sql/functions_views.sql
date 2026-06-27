CREATE VIEW vw_ProductSales AS
SELECT
    p.product_name,
    SUM(f.quantity) AS TotalSold
FROM sales f
JOIN Products p
ON f.product_id = p.product_id
GROUP BY p.product_name;

SELECT *
FROM vw_ProductSales;
---------------------------------------
CREATE VIEW vw_StorePerformance AS
SELECT
    s.store_name,
    SUM(f.quantity) AS TotalSales
FROM sales f
JOIN Stores s
ON f.store_id = s.store_id
GROUP BY s.store_name;

SELECT *
FROM vw_StorePerformance;

---------------------------------------
CREATE VIEW vw_RevenueAnalysis AS
SELECT
    p.product_name,
    SUM(f.quantity * p.product_retail_price) AS Revenue
FROM sales f
JOIN Products p
ON f.product_id = p.product_id
GROUP BY p.product_name;

SELECT *
FROM vw_RevenueAnalysis;

--------------------------------------------
CREATE VIEW vw_RegionalSales AS
SELECT
    r.sales_region,
    SUM(f.quantity) AS TotalSales
FROM sales f
JOIN Stores s
ON f.store_id = s.store_id
JOIN Region r
ON s.region_id = r.region_id
GROUP BY r.sales_region;

SELECT *
FROM vw_RegionalSales;

------------------------------------
CREATE VIEW vw_CustomerAnalysis AS
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(f.quantity) AS TotalPurchased
FROM sales f
JOIN Customers c
ON f.customer_id = c.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name

SELECT *
FROM vw_CustomerAnalysis ;

------------------------------------

CREATE VIEW vw_ReturnAnalysis AS
SELECT
    p.product_name,
    SUM(r.quantity) AS TotalReturns
FROM Returns r
JOIN Products p
ON r.product_id = p.product_id
GROUP BY p.product_name;

SELECT *
FROM vw_ReturnAnalysis ;


----------------------------------------------
CREATE VIEW vw_product_performance AS
SELECT
    p.product_name,
    p.product_brand,
    SUM(s.quantity) AS total_sales
FROM products p
JOIN sales s
ON p.product_id = s.product_id
GROUP BY
    p.product_name,
    p.product_brand;

select top 20 *
from vw_product_performance