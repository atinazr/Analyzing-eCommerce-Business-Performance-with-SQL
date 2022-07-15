-- no.1
with cte as(
select count(customer_id) as jumlah, payment_type, o.order_purchase_timestamp as waktu from orders_dataset o
join order_payments_dataset op on o.order_id = op.order_id
group by 3,2
)
select payment_type as year, sum(jumlah) as jumlah_user from cte
group by 1
order by 2 desc


-- no.2

with cte as(
select count(customer_id) as jumlah, payment_type, o.order_purchase_timestamp as waktu from orders_dataset o
join order_payments_dataset op on o.order_id = op.order_id
group by 3,2
)
select sum(jumlah) as jumlah_user, payment_type, date_part('year', waktu) as year from cte
group by 2,3
order by 3,1 desc



with 
tmp as (
select 
	date_part('year', o.order_purchase_timestamp) as year,
	op.payment_type,
	count(1) as num_used
from order_payments_dataset op 
join orders_dataset o on o.order_id = op.order_id
group by 1, 2
) 

select *,
	case when year_2017 = 0 then NULL
		else round((year_2018 - year_2017) / year_2017, 2)
	end as pct_change_2017_2018
from (
select 
  payment_type,
  sum(case when year = '2016' then num_used else 0 end) as year_2016,
  sum(case when year = '2017' then num_used else 0 end) as year_2017,
  sum(case when year = '2018' then num_used else 0 end) as year_2018
from tmp 
group by 1) subq
order by 5 desc

-- soal2
with cte as(
select count(customer_id) as jumlah, payment_type, date_part('year',o.order_purchase_timestamp) as year from orders_dataset o
join order_payments_dataset op on o.order_id = op.order_id
group by 3,2
),
cte1 as(
select payment_type, 
		sum(case when year = '2016' then jumlah else 0 end) as year_2016,
  		sum(case when year = '2017' then jumlah else 0 end) as year_2017,
  		sum(case when year = '2018' then jumlah else 0 end) as year_2018
from cte
group by 1
	)
select *, case when year_2017 = 0 then NULL
else round((year_2018 - year_2017) / year_2017, 2)
end as change_prctg  from cte1
order by change_prctg desc

