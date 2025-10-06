with tmp as(
select c.customer_id,p.product_id,p.product_name,count(1) cnt
from customers c 
join orders o on c.customer_id=o.customer_id
join products p on p.product_id=o.product_id
group by 1,2,3
)
select customer_id,product_id,product_name from (select *,dense_rank() over(partition by customer_id order by cnt desc) rn 
from tmp) a where rn=1

