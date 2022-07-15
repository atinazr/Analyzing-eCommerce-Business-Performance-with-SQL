select 
	date_part('year', first_purchase_time) as year,
	count(1) as new_customers
from (
	select 
		c.customer_unique_id,
		min(o.order_purchase_timestamp) as first_purchase_time
	from orders_dataset o 
	join customers_dataset c on c.customer_id = o.customer_id
	group by 1
) subq
group by 1
order by 1

