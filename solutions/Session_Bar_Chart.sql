with tmp as(
select case when duration>=0*60 and duration<5*60 then '[0-5>'
when duration>=5*60 and duration<10*60 then '[5-10>'
when duration>=10*60 and duration<15*60 then '[10-15>'
else '15 or more' end as flag,count(session_Id) cnt
from sessions
group by case when duration>=0*60 and duration<5*60 then '[0-5>'
when duration>=5*60 and duration<10*60 then '[5-10>'
when duration>=10*60 and duration<15*60 then '[10-15>'
else '15 or more' end
),
tmp1 as(
select 1 sort_order,'[0-5>' flag
union all
select 2,'[5-10>' flag
union all
select 3,'[10-15>' flag
union all
select 4,'15 or more'  flag
)
select t1.flag bin,coalesce(t.cnt,0) total
from tmp1 t1 
left join tmp  t on t1.flag=t.flag order by t1.sort_order
