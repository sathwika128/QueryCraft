select mc.name "Category",round(avg(t.amount),2) "AverageAmount",
  case when EXTRACT(HOUR FROM t.date)<12 then 1 else 0 end "EarlyTransaction"
from transaction t
join merchant m on t.id_merchant=m.id 
join merchant_category mc on m.id_merchant_category=mc.id
group by 1,3 order by 1,3 desc

