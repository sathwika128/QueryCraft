select user_id,time_stamp last_stamp
from (select *,row_number() over(partition by user_id order by time_stamp desc) rn 
from logins
where EXTRACT(YEAR FROM time_stamp)=2020) a where rn=1
