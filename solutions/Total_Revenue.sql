select c.categoryname,round(sum(od.quantity*p.price),2) total_revenue
from orders o
join order_details od on od.orderid=o.orderid
join products p on p.productid=od.productid
join categories c on c.categoryid=p.categoryid
where o.orderdate>=1996-05-28
group by 1 having round(sum(od.quantity*p.price),2)>10000
