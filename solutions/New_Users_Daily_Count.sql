with tmp as(
    select *,row_number() over(partition by user_id order by activity_date asc) rn 
    from traffic where activity='login'
),
tmp1 as(
select *,'2019-06-30'::DATE-activity_date::DATE days
from tmp where rn=1
)
select activity_date login_date,count(distinct user_id) user_count from tmp1 where days<=90 
group by 1
