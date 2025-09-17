with tmp as(
select r1.user_id user1_id,r2.user_id user2_id,count(r1.follower_id) cnt
from relations r1 
join relations r2 on r1.follower_id=r2.follower_id and r1.user_id<>r2.user_id
group by 1,2
)
select distinct least(user1_id,user2_id) user1_id,greatest(user1_id,user2_id) user2_id
  from tmp where cnt in (select max(cnt) from tmp)
