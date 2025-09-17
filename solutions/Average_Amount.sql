with tmp as(
select m.merchant_id,m.business_name,sum(transaction_amount) total_received,avg(transaction_amount) average_transaction
from transactions t
join merchants m on t.recipient_id=m.merchant_id 
where transaction_date>='2023-11-01' and transaction_date<='2024-04-30'
group by m.merchant_id,m.business_name
),
tmp1 as(
select merchant_id,business_name,total_received,
case when total_received>50000 then 'Excellent'
when total_received>20000 and total_received<=50000 then 'Good'
when total_received>10000 and total_received<=20000 then 'Average'
when total_received<=10000 then 'Below Average' end performance_score,
average_transaction
from tmp)
select merchant_id,business_name,round(total_received,2) total_received,performance_score,round(average_transaction,2) average_transaction
from tmp1
order by
case 
when performance_score='Excellent' then 1 
when performance_score='Good' then 2
when performance_score='Average' then 3 
else 4 end,
total_received desc

