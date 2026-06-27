CREATE VIEW vw_sales_analysis AS
SELECT
    s.transaction_date,
    p.product_name,
    p.product_brand,
    c.first_name,
    c.last_name,
    st.store_name,
    r.sales_region,
    s.quantity
FROM sales s
JOIN products p
ON s.product_id = p.product_id
JOIN customers c
ON s.customer_id = c.customer_id
JOIN stores st
ON s.store_id = st.store_id
JOIN region r
ON st.region_id = r.region_id;

/*

SELECT TOP 20 *
FROM vw_sales_analysis;

*/


CREATE VIEW vw_returns_analysis AS
SELECT
    rt.return_date,
    p.product_name,
    st.store_name,
    rt.quantity
FROM returns rt
JOIN products p
ON rt.product_id = p.product_id
JOIN stores st
ON rt.store_id = st.store_id;

/*

SELECT TOP 20 *
FROM vw_returns_analysis;

*/
