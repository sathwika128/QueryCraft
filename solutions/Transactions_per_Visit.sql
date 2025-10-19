with RECURSIVE tmp as(
select v.user_id,visit_date,coalesce(count(transaction_date),0) cnt
from visits v 
left join transactions t on v.user_id=t.user_id and v.visit_date=t.transaction_date
group by 1,2
),
tmp2 as(
    select max(cnt) max_cnt from tmp
),
tmp1 as (
    select 0 AS transaction_count 
    union all
    select transaction_count+1 
    from tmp1,tmp2
    where transaction_count+1<=max_cnt
)
select t1.transaction_count transactions_count,coalesce(count(t.cnt),0) visits_count
from tmp1 t1 
join tmp2 t2 on t1.transaction_count<=t2.max_cnt
left join tmp t on t1.transaction_count=t.cnt
group by 1
order by 1

-----------------------

with RECURSIVE tmp as(
select v.user_id,visit_date,coalesce(count(transaction_date),0) cnt
from visits v 
left join transactions t on v.user_id=t.user_id and v.visit_date=t.transaction_date
group by 1,2
),
tmp1 as (
    select 0 AS transaction_count 
    union all
    select 1
    union all
    select 2
    union all
    select 3
)
select t1.transaction_count transactions_count,coalesce(count(t.cnt),0) visits_count
from tmp1 t1 
left join tmp t on t1.transaction_count=t.cnt
group by 1
order by 1
