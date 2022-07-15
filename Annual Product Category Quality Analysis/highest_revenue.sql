create table top_product_category_by_revenue_per_year as 
with cte as(
select 
		p.product_category_name as product_name,
		sum(oi.price + oi.freight_value) as revenue,
		date_part('year', o.order_purchase_timestamp) as year,
		rank() over(
			partition by date_part('year', o.order_purchase_timestamp) 
	 order by 
	sum(oi.price + oi.freight_value) desc) as rk
	from order_items_dataset oi
	join orders_dataset o on o.order_id = oi.order_id
	join product_dataset p on p.product_id = oi.product_id
	where o.order_status = 'delivered'
	group by 3,1
)
select product_name, revenue, year from cte
where rk = 1
