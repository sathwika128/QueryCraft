select s.name
from salesperson s
where sales_id not in(
select sales_id
from company c
join orders o on o.com_id=c.com_id
where c.name='RED'
)
