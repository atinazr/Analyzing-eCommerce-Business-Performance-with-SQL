ALTER TABLE sellers_dataset
ADD PRIMARY KEY (seller_id);

ALTER TABLE sellers_dataset ALTER COLUMN seller_id SET NOT null;