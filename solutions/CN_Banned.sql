--- 1 way
with tmp as(
select *,lag(logout) over(partition by account_id order by ip_address) prev_logout
from loginfo
),
tmp1 as(
select account_id
from tmp where login<=prev_logout
),
tmp2 as(
select account_id from loginfo group by 1 having count(distinct ip_address)=2
)
select t1.account_id
from tmp1 t1 
join tmp2 t2 on t1.account_id=t2.account_id


--- 2 way
select distinct l1.account_id
from loginfo l1
join loginfo l2 on l1.account_id=l2.account_id and l1.ip_address<>l2.ip_address and l1.login<l2.logout and l2.login<=l1.logout
