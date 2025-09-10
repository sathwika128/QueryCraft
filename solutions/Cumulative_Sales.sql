with tmp as(
select 
s.shipperid,s.shippername,o.orderdate,sum(od.quantity*p.price) total_sales
from orders o 
join shippers s on s.shipperid=o.shipperid
join order_details od on o.orderid=od.orderid
join products p on p.productid=od.productid
group by s.shipperid,s.shippername,o.orderdate
)
select shipperid,shippername,orderdate,round(total_sales,2) total_sales,round(sum(total_sales) over(partition by shipperid order by orderdate),2) cumulative_sales
from tmp
group by 1,2,3,4
