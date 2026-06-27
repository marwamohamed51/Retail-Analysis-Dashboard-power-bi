use retailProject;

select top 20* from sales

SELECT COUNT(*) AS 'Sales raw number'
FROM sales;

/*check nulls*/
SELECT *
FROM sales
WHERE transaction_date IS NULL;


SELECT *
FROM sales
WHERE TRY_CAST(transaction_date AS DATE) IS NULL;

SELECT *
FROM sales
WHERE TRY_CAST(stock_date AS DATE) IS NULL;

/*check negative index*/
SELECT *
FROM sales
WHERE quantity < 0;

/****************************/

/*check duplicates*/
SELECT
	transaction_date,
	product_id,
	customer_id,
	store_id,
	quantity,
	COUNT(*) as 'duplicated raw num'
FROM sales
GROUP BY
	transaction_date,
	product_id,
	customer_id,
	store_id,
	quantity
HAVING COUNT(*) > 1;

/*************************/

SELECT *
FROM sales
WHERE product_id = 784 and customer_id= 6527;
/*******************************************/

select * from Customers


SELECT 
    transaction_date,
    product_id,
    customer_id,
    store_id,
    COUNT(*) AS cnt
FROM sales
GROUP BY 
    transaction_date,
    product_id,
    customer_id,
    store_id
HAVING COUNT(*) > 1;


SELECT *
FROM sales
WHERE product_id IS NULL
   OR customer_id IS NULL
   OR store_id IS NULL;


SELECT *,
ROW_NUMBER() OVER (
PARTITION BY transaction_date, product_id, customer_id, store_id
ORDER BY transaction_date
) AS rn
FROM sales


