select 
	year, 
	round(avg(frequency_purchase),3) as avg_orders_per_customers 
from (
	select 
		date_part('year', o.order_purchase_timestamp) as year,
		c.customer_unique_id,
		count(1) as frequency_purchase
	from orders_dataset o 
	join customers_dataset c on c.customer_id = o.customer_id
	group by 1, 2
) a
group by 1
