ALTER TABLE order_items_dataset
    ADD CONSTRAINT fk_seller_item FOREIGN KEY (seller_id) 
	REFERENCES sellers_dataset;