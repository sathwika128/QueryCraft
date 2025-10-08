SELECT EXTRACT(MONTH FROM a.login_date),count(DISTINCT a.user_id) reactivated_users
FROM user_logins a
where not EXISTS (
select *  from user_logins b 
where a.user_id=b.user_id 
and EXTRACT(MONTH FROM b.login_date)=EXTRACT(MONTH FROM a.login_date- INTERVAL '1 month')
)
group by 1 order by 1;
