select max(num) num from (select num
from my_numbers 
group by num having count(1)=1) a
