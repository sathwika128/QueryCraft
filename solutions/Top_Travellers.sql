select name,coalesce(sum(distance),0) travelled_distance
from users u 
left join rides r on r.user_id=u.id
group by name order by coalesce(sum(distance),0) desc,name
