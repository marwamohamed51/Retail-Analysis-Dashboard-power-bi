use retailProject;

select * from products;

/* check duplicates */
SELECT product_id, COUNT(*)
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;

/* check nulls */
SELECT *
FROM products
WHERE product_id IS NULL;


SELECT *
FROM products
WHERE product_name IS NULL;

SELECT *
FROM products
WHERE product_retail_price IS NULL;

SELECT *
FROM products
WHERE product_cost IS NULL;


/* negative cost */
SELECT *
FROM products
WHERE product_retail_price < 0
   OR product_cost < 0;


/****************************************************************/
select * from Customers;

/*check duplicates*/
SELECT customer_id, COUNT(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT customer_acct_num, COUNT(*)
FROM customers
GROUP BY customer_acct_num
HAVING COUNT(*) > 1;

/*check nulls*/
SELECT *
FROM customers
WHERE customer_id IS NULL;

SELECT *
FROM customers
WHERE first_name IS NULL;

SELECT *
FROM customers
WHERE last_name IS NULL;

SELECT *
FROM customers
WHERE birthdate IS NULL;

SELECT *
FROM customers
WHERE yearly_income IS NULL;


SELECT DISTINCT yearly_income
FROM customers


SELECT yearly_income, COUNT(*) AS 'TOTAL CUSTOMER by MO_INCOME'
FROM customers
group by yearly_income ;


SELECT DISTINCT member_card, COUNT(*) AS T_CUSTOMER
FROM customers
GROUP BY member_card


SELECT *
FROM sales s
LEFT JOIN products p
ON s.product_id = p.product_id
WHERE p.product_id IS NULL;

-------------------------------------------
--check duplicated values-----
SELECT region_id, COUNT(*)
FROM Region
GROUP BY region_id
HAVING COUNT(*) > 1;

SELECT sales_district, sales_region, COUNT(*)
FROM region
GROUP BY sales_district, sales_region
HAVING COUNT(*) > 1;
---duplicates appeared----------


SELECT *
FROM Region
WHERE sales_region IS NULL;


select*from
Returns

