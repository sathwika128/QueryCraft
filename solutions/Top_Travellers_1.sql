select u.name,coalesce(sum(distance),0) travelled_distance
from rides r 
right join users u on r.user_id=u.id
group by 1 order by travelled_distance desc,1 asc
