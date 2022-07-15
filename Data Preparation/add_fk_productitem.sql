ALTER TABLE order_items_dataset
    ADD CONSTRAINT fk_product_item FOREIGN KEY (product_id) 
	REFERENCES product_dataset;