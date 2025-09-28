select customer_id+n ids
from (
    select customer_id,lead(customer_id) over(order by customer_id) next_id from customers
) c 
join (
    select 1 as n 
    union all 
    select 2 
    union all 
    select 3 
    union all 
    select 4 
    union all 
    select 5
) t on c.next_id is not null and  customer_id+n<next_id
order by 1
