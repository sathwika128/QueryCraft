select title,rating
from imdb i
left join genre g on i.movie_id=g.movie_id
where i.title like '%2014%' and g.genre like 'C%' and i.budget>40000000
