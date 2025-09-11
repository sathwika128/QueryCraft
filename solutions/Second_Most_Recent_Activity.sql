with tmp as(
    select username,count(1) cnt from useractivity group by 1
),
tmp1 as(
select username,activity,startDate,enddate from (
    select u.username,u.activity,u.startDate,u.enddate,row_number() over(partition by u.username order by enddate desc) rn
from useractivity u 
join tmp t on u.username=t.username and cnt>1) a where rn=2
),
tmp2 as(
select u.*
from useractivity u 
join tmp t on u.username=t.username and cnt=1
)
select * from tmp1
union all
select * from tmp2
