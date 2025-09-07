-- 1st way 
select salary
from employee order by salary desc limit 1 offset 1


-- 2nd way
select salary
from (select *,row_number() over(order by salary desc) rn
from employee) e where rn=2
