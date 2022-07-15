ALTER TABLE orders_dataset
    ADD CONSTRAINT fk_customer_order FOREIGN KEY (customer_id) 
	REFERENCES customers_dataset;