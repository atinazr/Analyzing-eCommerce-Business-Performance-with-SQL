select 
	year, 
	round(avg(mau), 2) as average_mau
from (
	select 
		date_part('year', o.order_purchase_timestamp) as year,
		date_part('month', o.order_purchase_timestamp) as month,
		count(distinct c.customer_unique_id) as mau
	from orders_dataset o 
	join customers_dataset c on o.customer_id = c.customer_id
	group by 1,2 
) subq
group by 1

