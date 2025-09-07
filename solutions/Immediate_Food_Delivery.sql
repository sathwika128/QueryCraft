with tmp as(
select *,row_number() over(partition by customer_id order by order_date) first_order_date 
from delivery
),
tmp1 as(
select *,(customer_pref_delivery_date-order_date) date_diff from tmp where first_order_date=1
)
select round(count(case when date_diff=0 then 1 end)*100/count(1),2) immediate_percentage from tmp1
