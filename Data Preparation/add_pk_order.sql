ALTER TABLE orders_dataset
ADD PRIMARY KEY (order_id);

ALTER TABLE orders_dataset ALTER COLUMN order_id SET NOT null;