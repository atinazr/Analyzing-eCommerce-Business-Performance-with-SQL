ALTER TABLE product_dataset
ADD PRIMARY KEY (product_id);

ALTER TABLE product_dataset ALTER COLUMN product_id SET NOT null;