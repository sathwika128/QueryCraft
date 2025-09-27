select  genre,max(domestic+worldwide-budget) net_profit
from  genre g
left join earning e on e.movie_id=g.movie_id
left join IMDB i on i.movie_id=e.movie_id
where g.genre is not null and title like '%2012%'
group by 1 order by 1
