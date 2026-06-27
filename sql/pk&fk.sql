use retailProject;

/* region p_K */
ALTER TABLE region
ADD CONSTRAINT pk_region PRIMARY KEY (region_id);

/* stores p_K */
ALTER TABLE stores
ADD CONSTRAINT pk_stores PRIMARY KEY (store_id);

/* region f_K */
ALTER TABLE stores
ADD CONSTRAINT fk_stores_region
FOREIGN KEY (region_id)
REFERENCES region(region_id);

/* customers p_K */
ALTER TABLE customers
ADD CONSTRAINT pk_customers PRIMARY KEY (customer_id);

/* products p_K */
ALTER TABLE products
ADD CONSTRAINT pk_products PRIMARY KEY (product_id);

/* sales p_K */
ALTER TABLE sales
ALTER COLUMN transaction_date DATE NOT NULL;

ALTER TABLE sales
ALTER COLUMN product_id INT NOT NULL;

ALTER TABLE sales
ALTER COLUMN customer_id INT NOT NULL;


ALTER TABLE sales
ALTER COLUMN store_id INT NOT NULL;



ALTER TABLE sales
ADD CONSTRAINT pk_sales 
PRIMARY KEY (transaction_date, product_id, customer_id, store_id);

/* stores f_K */
ALTER TABLE sales
ADD CONSTRAINT fk_sales_store
FOREIGN KEY (store_id)
REFERENCES stores(store_id);

/* products f_K */
ALTER TABLE sales
ADD CONSTRAINT fk_sales_product
FOREIGN KEY (product_id)
REFERENCES products(product_id);

/* customers f_K */
ALTER TABLE sales
ADD CONSTRAINT fk_sales_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);


/*************************************************/

/* products f_k in returns */
ALTER TABLE returns
ADD CONSTRAINT fk_returns_product
FOREIGN KEY (product_id)
REFERENCES products(product_id);

/* stores f_k in returns */
ALTER TABLE returns
ADD CONSTRAINT fk_returns_store
FOREIGN KEY (store_id)
REFERENCES stores(store_id);


/************************************************/

/* calendar p_k */
ALTER TABLE Calendar
ALTER COLUMN dimDate DATE NOT NULL;

ALTER TABLE Calendar
ADD CONSTRAINT pk_calendar PRIMARY KEY (dimDate);

/* calendar f_k */
ALTER TABLE sales
ADD CONSTRAINT fk_Sales_dimDate
FOREIGN KEY (transaction_date)
REFERENCES calendar(dimDate);