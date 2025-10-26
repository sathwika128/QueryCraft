with tmp as(
select *,id-row_number() over(order by id) diff
from stadium 
where people>=100
)
select id,visit_date,people from tmp 
where diff in (select diff
from tmp 
group by diff having count(1)>=3
)
order by visit_date asc
