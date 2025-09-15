select EXTRACT(year FROM date) year,EXTRACT(month FROM date) month,
count(1) "TotalTransactions",sum(amount) "TotalAmount"
from transaction
group by 1,2 order by count(1) desc limit 3
