with tmp as(
    select * from employees where date_part('year',hire_date)>1990
)
select ti.emp_no,count(distinct title) as "Amount of Titles"
from tmp tm
join titles  ti on ti.emp_no=tm.emp_no
group by 1 having count(distinct title)>2
