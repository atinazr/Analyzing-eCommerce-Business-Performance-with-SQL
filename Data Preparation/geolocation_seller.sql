CREATE TABLE geolocation_seller(
	id_geo_seller serial PRIMARY KEY,
	geolocation_id int,
	seller_id varchar
)

ALTER TABLE geolocation_seller
    ADD CONSTRAINT fk_geo_seller FOREIGN KEY (geolocation_id) 
	REFERENCES geolocation_dataset;
	
ALTER TABLE geolocation_seller
    ADD CONSTRAINT fk_seller_geo FOREIGN KEY (seller_id) 
	REFERENCES sellers_dataset;
	
INSERT INTO geolocation_seller (geolocation_id, seller_id)
SELECT geolocation_id, sellers_dataset.seller_id
from geolocation_dataset join sellers_dataset
on geolocation_dataset.geolocation_zip_code_prefix=sellers_dataset.seller_zip_code_prefix
order by geolocation_id asc;

select * from geolocation_seller
	

