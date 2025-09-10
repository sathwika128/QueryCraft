with tmp as(
select distinct sub_id,parent_id from submissions
),
tmp1 as(
select t1.sub_id sub_id1,t1.parent_id parent_id1,t2.sub_id sub_id2,t2.parent_id parent_id2 
from tmp t1 
left join tmp t2 on t1.parent_id=t2.sub_id
),
tmp2 as(
select  case when parent_id1 is null then sub_id1 end sub_id  from tmp1
)
select sub_id post_id,coalesce(count(sub_id2),0) number_of_comments
from tmp2 t2
left join tmp1 t1 on t2.sub_id=t1.parent_id1 where sub_id is not null
group by 1 order by coalesce(count(sub_id2),0) desc,sub_id asc
