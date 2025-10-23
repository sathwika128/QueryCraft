select person_name from 
(select *,sum(weight) over(order by turn) w
from queue) a 
where w<=1000 order by weight desc limit 1
