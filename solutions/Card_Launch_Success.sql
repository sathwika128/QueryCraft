--- 1 way
select distinct card_name,first_value(issued_amount) over(partition by card_name order by issue_year,issue_month)
issued_amount 
from monthly_cards_issued 
order by first_value(issued_amount) over(partition by card_name order by issue_year,issue_month) desc

---2 way
select card_name,issued_amount 
  from (select distinct *,row_number() over(partition by card_name order by issue_year,issue_month)
rn from monthly_cards_issued) a where rn=1 order by issued_amount desc
