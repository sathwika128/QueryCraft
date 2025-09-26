with tmp as(
select s.shippername,count(o.orderid) cnt
from orders o 
join shippers s on o.shipperid=s.shipperid
group by 1
)
select shippername,cnt totalshipments,case when cnt>60 then 'High' else 'Low' end shipmentcategory
from tmp
