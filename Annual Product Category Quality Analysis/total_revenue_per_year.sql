create table total_revenue_per_year as
select sum(price + freight_value ),
	   date_part('year', order_purchase_timestamp) as year
from order_items_dataset oi 
join orders_dataset o on oi.order_id = o.order_id
where order_status = 'delivered'
group by 2
order by 2

alter table total_revenue_per_year rename column sum to revenue
select * from total_revenue_per_year