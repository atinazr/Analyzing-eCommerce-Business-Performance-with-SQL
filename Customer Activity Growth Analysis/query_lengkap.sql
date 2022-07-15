with 
calc_mau as (
select 
	year, 
	round(avg(mau), 2) as average_mau
from
(
	select 
		date_part('year', o.order_purchase_timestamp) as year,
		date_part('month', o.order_purchase_timestamp) as month,
		count(distinct c.customer_unique_id) as mau
	from orders_dataset o 
	join customers_dataset c on o.customer_id = c.customer_id
	group by 1,2 
) subq
group by 1
),
calc_newcust as (
select 
	date_part('year', first_purchase_time) as year,
	count(1) as new_customers
from 
(
	select 
		c.customer_unique_id,
		min(o.order_purchase_timestamp) as first_purchase_time
	from orders_dataset o 
	join customers_dataset c on c.customer_id = o.customer_id
	group by 1
) subq
group by 1
),
calc_repeat as (
select 
	year, 
	count(distinct customer_unique_id) as repeating_customers
from 
(
	select 
		date_part('year', o.order_purchase_timestamp) as year,
		c.customer_unique_id,
		count(1) as purchase_frequency
	from orders_dataset o 
	join customers_dataset c on c.customer_id = o.customer_id
	group by 1, 2
	having count(1) > 1
) subq
group by 1 
),
calc_avg_freq as (
select 
	year, 
	round(avg(frequency_purchase),3) as avg_orders_per_customers 
from 
(
	select 
		date_part('year', o.order_purchase_timestamp) as year,
		c.customer_unique_id,
		count(1) as frequency_purchase
	from orders_dataset o 
	join customers_dataset c on c.customer_id = o.customer_id
	group by 1, 2
) a
group by 1
)

select 
	mau.year, 
	mau.average_mau, 
	newc.new_customers,
	rep.repeating_customers, 
	freq.avg_orders_per_customers
from calc_mau mau 
join calc_newcust newc on mau.year = newc.year
join calc_repeat rep on rep.year = mau.year
join calc_avg_freq freq on freq.year = mau.year















