select activity
from friends 
group by 1 having count(name)<(select count(name) from friends group by activity order by count(name) desc limit 1)
order by count(1) desc limit 1


---------------------------
with tmp as(
select activity,count(1) cnt from friends group by 1
)
select activity from tmp
where cnt>(select min(cnt) from tmp) and cnt<(select max(cnt) from tmp)
