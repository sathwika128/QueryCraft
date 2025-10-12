with tmp as(
select success_date date,'succeeded' period_state
from succeeded
union all 
select fail_date date,'failed' period_state
from failed
),
tmp1 as(
select period_state,date,row_number() over(order by date)-row_number() over(partition by period_state order by date) grp
from tmp where EXTRACT(YEAR FROM date)=2019
)
select  
period_state,min(date) start_date,max(date) end_date
from tmp1
group by period_state,grp
