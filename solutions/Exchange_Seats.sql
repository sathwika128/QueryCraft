with tmp as(
    select count(1) cnt from seat
),tmp1 as(
select student,case when id%2=0 then id-1
when (id%2=1 and id=cnt) then id
when id%2=1 then id+1 end as id
from seat s 
cross join tmp t
)
select id,student from tmp1 order by 1


----------------------
with tmp1 as(
select student,case when id%2=0 then id-1
when (id%2=1 and id=cnt) then id
when id%2=1 then id+1 end as id
from seat s
cross join (select count(1) cnt from seat) t
)
select id,student from tmp1 order by 1

-----------------
select 
case when id%2=1 and id=(select count(1) from seat) then id
when id%2=1 then id+1
when id%2=0 then id-1 end as id,student
from seat
order by id
