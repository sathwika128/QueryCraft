select distinct num consecutivenums 
from(select *,row_number() over(order by id)-row_number() over(partition by num order by id) grp
from logs) a group by num,grp having count(1)>=3


------------------

select distinct l1.num consecutivenums
from logs l1
join logs l2 on l2.id=l1.id+1 and l1.num=l2.num
join logs l3 on l3.id=l2.id+1 and l2.num=l3.num


------------------

with tmp as(
select id,num,lag(num) over(order by id) prev_num,lead(num) over(order by id) next_num from logs
)
select distinct num consecutivenums from tmp where num=prev_num and num=next_num
