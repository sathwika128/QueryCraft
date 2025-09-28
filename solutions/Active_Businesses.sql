with tmp as(
select event_type,round(sum(occurences)*1.0/count(1),1) avg_activity
from events
group by 1
)
select business_id
from events e 
join tmp t on t.event_type=e.event_type
where occurences>avg_activity
group by 1 having count(business_id)>1
