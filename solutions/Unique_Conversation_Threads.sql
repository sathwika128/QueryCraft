-- 1 way
select count(distinct concat(sender_id,receiver_id)) unique_threads from (select distinct least(sender_id,receiver_id) sender_id,greatest(sender_id,receiver_id) receiver_id
from messenger_sends) a

  -- 2 way
select count(*) from (
select distinct case when sender_id<receiver_id then sender_id else receiver_id end sender_id,
case when sender_id<receiver_id then receiver_id else sender_id end receiver_id
from messenger_sends  m1 
) a
