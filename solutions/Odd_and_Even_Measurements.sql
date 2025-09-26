with tmp as(
select *,row_number() over(PARTITION by CAST(measurement_time AS DATE) order by measurement_time) rn 
from measurements 
)
select CAST(measurement_time AS DATE) AS measurement_day,
sum(case when rn%2!=0 then measurement_value end) odd_sum,
sum(case when rn%2==0 then measurement_value end) even_sum
from tmp 
group by 1
