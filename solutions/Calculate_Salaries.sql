select s.company_id,s.employee_id,s.employee_name,case when a.max_sal<1000 then round(s.salary-0,0)
when a.max_sal>=1000 and a.max_sal<=10000 then round(s.salary-s.salary*0.24,0)
else round(s.salary-s.salary*0.49,0) end  salary
from salaries s 
join (select company_id,max(salary) max_sal
from salaries 
group by 1) a on s.company_id=a.company_id
