with tmp1 as(
select account_id,concat(date_part('year',day),'-',LPAD(date_part('month',day)::TEXT,2,'0')) mnth,sum(amount) amount 
from TRANSACTIONS  where type_pro='Creditor'
group by 1,2 order by account_id,mnth
),
tmp2 as(
select t1.account_id,amount,a.max_income,to_date(mnth || '-01','YYYY-MM-DD') mnth
from tmp1 t1 
join accounts a on a.account_id=t1.account_id
where amount>a.max_income
),
tmp3 as(
select *,row_number() over(partition by account_id order by mnth) rn,(EXTRACT(year FROM mnth)*12+EXTRACT(month FROM mnth)) mnth_num from tmp2
),
tmp4 as(
select account_id,(mnth_num-rn) grp from tmp3
),
tmp5 as(
    select account_id,count(1) cnt from tmp4 group by 1,grp having count(1)>=2
)
select distinct account_id
from tmp5 t5 
