ALTER TABLE order_items_dataset
    ADD CONSTRAINT fk_item_order FOREIGN KEY (order_id) 
	REFERENCES orders_dataset;