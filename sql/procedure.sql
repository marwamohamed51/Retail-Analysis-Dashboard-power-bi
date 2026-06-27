CREATE PROC sales_data
AS
BEGIN
	SELECT 
		S.*, C.*, P.*, ST.*, R.*, RT.*

	FROM sales S
	INNER JOIN Customers C
	ON S.customer_id = C.customer_id
	INNER JOIN Products P
	ON S.product_id = P.product_id
	INNER JOIN Stores ST
	ON S.store_id = ST.store_id
	INNER JOIN Region R
	ON ST.region_id = R.region_id
	INNER JOIN Returns RT
	ON ST.store_id = RT.store_id
	AND P.product_id = RT.product_id

END;

exec sales_data;











