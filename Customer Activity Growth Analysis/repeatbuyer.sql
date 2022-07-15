-- with lg as(
-- select 
-- 	customer_unique_id,
-- 	o.customer_id,
-- 	o.order_id,
-- 	o.order_purchase_timestamp
-- from customers_dataset c
-- join orders_dataset o on c.customer_id = o.customer_id
-- ), lg2 as
-- (select
--  	customer_unique_id,
--  	order_purchase_timestamp,
--  	count(customer_unique_id) from lg
-- group by 1,2
-- having count(customer_unique_id)>1)
-- select count(customer_unique_id) as jumlah_cust_repeat, date_part('year', order_purchase_timestamp) as years
-- from lg2
-- group by 2
-- order by 2 asc


with lg as(
select 
	customer_unique_id,
	o.customer_id,
	o.order_id,
	date_part('year', o.order_purchase_timestamp) as years
from customers_dataset c
join orders_dataset o on c.customer_id = o.customer_id
), lg2 as
(select
 	customer_unique_id,
 	years,
 	count(customer_unique_id) from lg
group by 2,1
having count(customer_unique_id)>1)
select count(customer_unique_id) as jumlah_cust_repeat, years
from lg2
group by years
order by years asc
