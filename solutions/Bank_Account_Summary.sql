select 
u.user_id,u.user_name,
u.credit+COALESCE(sum(case when u.user_id=t.paid_to then t.amount end),0)-COALESCE(sum(case when u.user_id=t.paid_by then t.amount end),0) credit,
case when u.credit+COALESCE(sum(case when u.user_id=t.paid_to then t.amount end),0)-COALESCE(sum(case when u.user_id=t.paid_by then t.amount end),0) < 0 then 'Yes'
else 'No' end credit_limit_breached
from users u 
left join transactions t on u.user_id=t.paid_to or u.user_id=t.paid_by
group by u.user_id,u.user_name,u.credit
order by u.user_id
