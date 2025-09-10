select followee follower,count(1) num
from follow f1 where exists (select 1 from follow f2 where f1.followee=f2.follower)
group by 1 order by 1 asc,count(1) desc
