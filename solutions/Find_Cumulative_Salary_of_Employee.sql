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
)
select a.id,a.month,
(select sum(b.salary)
from tmp1 b where a.id=b.id and b.month between a.month-2 and a.month
) as salary
from tmp1 a
order by id asc,month desc

