ALTER TABLE customers_dataset
ADD PRIMARY KEY (customer_id);

ALTER TABLE customers_dataset ALTER COLUMN customer_id SET NOT null;