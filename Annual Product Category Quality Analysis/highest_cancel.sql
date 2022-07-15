create table top_product_category_by_cancel_per_year as 
with cte as(
select 
		p.product_category_name as product_name,
		count(order_status) as total_cancel,
		date_part('year', o.order_purchase_timestamp) as year,
		rank() over(
			partition by date_part('year', o.order_purchase_timestamp) 
	 order by 
	count(order_status) desc) as rk
	from order_items_dataset oi
	join orders_dataset o on o.order_id = oi.order_id
	join product_dataset p on p.product_id = oi.product_id
	where o.order_status = 'canceled'
	group by 3,1
)
select product_name, total_cancel, year from cte
where rk = 1
