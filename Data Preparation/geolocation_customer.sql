CREATE TABLE geolocation_customer(
	id_geo_cust serial PRIMARY KEY,
	geolocation_id int,
	customer_id varchar
)


INSERT INTO geolocation_customer (geolocation_id, customer_id)
SELECT geolocation_id, customers_dataset.customer_id
from geolocation_dataset join customers_dataset
on geolocation_dataset.geolocation_zip_code_prefix=customers_dataset.customer_zip_code_prefix
order by geolocation_id asc;

ALTER TABLE geolocation_customer 
    ADD CONSTRAINT fk_geo_cust FOREIGN KEY (geolocation_id) 
	REFERENCES geolocation_dataset;
	
ALTER TABLE geolocation_customer 
    ADD CONSTRAINT fk_cust_geo FOREIGN KEY (customer_id) 
	REFERENCES customers_dataset;

select * from geolocation_customer

