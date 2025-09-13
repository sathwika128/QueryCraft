select
productid,category,price,case when  category='Electronics' then round(price+(price*10/100),2)
when category='Books' then round(price+(price*5/100),2) else round(price,2) end as adjustedprice
from products
