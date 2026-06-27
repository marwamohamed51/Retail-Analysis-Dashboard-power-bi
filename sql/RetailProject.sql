CREATE DATABASE RetailProject;

USE RetailProject;
/*
CREATE TABLE sales (
    transaction_date DATE,
    stock_date DATE,
    product_id INT,
    customer_id INT,
    store_id INT,
    quantity INT
);
*/
INSERT INTO sales
SELECT DISTINCT
    transaction_date,
    stock_date,
    product_id,
    customer_id,
    store_id,
    quantity
FROM [sales 2017];


INSERT INTO sales
SELECT DISTINCT
    transaction_date,
    stock_date,
    product_id,
    customer_id,
    store_id,
    quantity
FROM [sales 2018];


/****************/
ALTER TABLE Calendar
ADD dimDate DATE;

select*from Calendar

UPDATE Calendar
SET dimDate = DATEFROMPARTS(column3, column1, column2);






/* removing data from sales table */
TRUNCATE TABLE sales;



