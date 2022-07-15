ALTER TABLE order_reviews_dataset
    ADD CONSTRAINT fk_reviews_order FOREIGN KEY (order_id) 
	REFERENCES orders_dataset;