with tmp as(
    select *,row_number() over(partition by company order by salary) rnk,count(1) over(partition by company) cnt from employee

)
select id,company,salary
from tmp
where (cnt%2=0 and (rnk=cnt/2 or rnk=cnt/2+1)) or (cnt%2=1 and rnk=(cnt+1)/2)
order by company,salary
