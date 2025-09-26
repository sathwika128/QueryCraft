with tmp as(
SELECT count(distinct product_category) unq_prod
FROM products
)
select  c.customer_id
from customer_contracts c 
join products p on c.product_id=p.product_id
group by 1 having count(distinct p.product_category)=(select unq_prod from tmp)
