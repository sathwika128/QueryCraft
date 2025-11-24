

with days as(
select emp_id,case when EXTRACT(EPOCH FROM (logout-login))/3600.0  >  10 then '10+'
when EXTRACT(EPOCH FROM (logout-login))/3600.0 >8 then '8+'
else '8-' end as days
from employees
),
time_window as(
select emp_id,count(1) days_8,
count(case when days='10+' then 1 end) days_10
from days
where days not in ('8-')
group by 1
)
select emp_id,case when days_8>=3 and days_10>=2 then 'both'
when days_8>=3 then '1' 
else '2' end criterion
from time_window
where days_8>=3 or days_10>=2
order by 1 asc
