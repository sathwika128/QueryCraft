with tmp as(
select p1.id p1,p2.id p2,p1.x_value x1,p1.y_value y1,p2.x_value x2,p2.y_value y2
from points p1
join points p2 on p1.id<p2.id
),
tmp1 as(
select *,ABS(x2-x1)*ABS(y2-y1) area
from tmp
)select p1,p2,area from tmp1 where area>0
order by area desc,p1,p2
