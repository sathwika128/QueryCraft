with tmp as(
SELECT event_id,contact_id,event_type,date_trunc('week',event_date) event_week,
lag(date_trunc('week',event_date)) over(PARTITION by contact_id order by event_date) prev_event_week,
lead(date_trunc('week',event_date)) over(PARTITION by contact_id order by event_date) next_event_week
FROM marketing_touches
order by contact_id,event_date
),
tmp1 as(
select distinct contact_id from tmp
where next_event_week=event_week+interval '1 week'  or prev_event_week=event_week+interval '-1 week'
),
tmp2 as(
select distinct contact_id from marketing_touches  where event_type='trial_request' and contact_id in (select contact_id from crm_contacts)
)
select distinct email
from tmp1 t1
join tmp2 t2 on t1.contact_id=t2.contact_id
join crm_contacts c on c.contact_id=t2.contact_id
