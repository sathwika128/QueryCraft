select name,sum(rest) rest,sum(paid) paid,sum(canceled) canceled,sum(refunded) refunded
from invoice i 
join product p on p.product_id=i.product_id
group by 1 order by 1
