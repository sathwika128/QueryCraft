select b.color,r.sid,r.bid
from reserves r 
join boats b on b.bid=r.bid
join sailors s on s.sid=r.sid
where rating in (select max(rating) from sailors where rating < (select max(rating) from sailors) )
order by 3 desc
