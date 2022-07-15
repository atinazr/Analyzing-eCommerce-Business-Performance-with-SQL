CREATE TABLE total_cancel_order_per_year AS
select count(order_id) as total_cancel,
		date_part('year', order_purchase_timestamp) as years from orders_dataset
where orders_dataset.order_status = 'canceled'
group by 2
order by 2



