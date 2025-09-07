select employee_id,employee_name,department,salary,
lag(salary) over(partition by department order by employee_id) previous_salary
from employees
