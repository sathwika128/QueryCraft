with tmp as(
select case when user1_id=1 then user2_id else user1_id end friend_id
from friendship 
where user1_id=1 or user2_id=1
),
tmp1 as(
select distinct page_id from tmp t
join likes l on l.user_id=t.friend_id
),
tmp2 as(
select distinct page_id from likes where user_id=1
)
select page_id recommended_page from tmp1 t1 where not exists (select 1 from tmp2 t2 where t1.page_id=t2.page_id)


