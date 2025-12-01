with tmp as(
    select id,max(month) latest_month from employee group by 1
),
tmp1 as(
select e.id,e.month,e.salary
from employee e 
join tmp t on t.id=e.id
where concat(e.id,e.month)<>concat(t.id,latest_month)
)
select a.id,a.month,coalesce(a.salary,0)+coalesce(b.salary,0)+coalesce(c.salary,0) salary
from tmp1 a
left join tmp1 b on a.id=b.id and b.month=a.month-1
left join tmp1 c on a.id=c.id and c.month=a.month-2
order by id asc,month desc


----------------
with tmp as(
    select id,max(month) latest_month from employee
    group by 1
),
tmp1 as(
select e.*
from employee e
join tmp t on e.id=t.id
where concat(t.id,t.latest_month)<>concat(e.id,e.month)
order by e.id  
),
tmp2 as(
select id,month,salary,month-lag(month) over(partition by id order by month) month_diff,
sum(salary) over(partition by id order by month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) rolling_sum
from tmp1
)
select id,month,
case when month_diff is null or month_diff=1 then rolling_sum
else salary end as salary
from tmp2
order by id asc,month desc
