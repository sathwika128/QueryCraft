select user_id,max(diff) biggest_window
from (select user_id,visit_date,coalesce(lead(visit_date) over(partition by user_id order by visit_date),'2021-1-1') next_day,
coalesce(lead(visit_date) over(partition by user_id order by visit_date),'2021-1-1')-visit_date::date diff
from uservisits) a 
group by 1 order by 1
