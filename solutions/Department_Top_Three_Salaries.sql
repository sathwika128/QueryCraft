with tmp as(
    select id,name,salary,departmentid,dense_rank() over(partition by departmentid order by salary desc) as rn 
    from employee
)
select d.name Department,e.name Employee,e.salary Salary
from tmp as e 
join department d on d.id=e.departmentid where e.rn<=3
