with tmp as(
    select *,row_number() over(partition by num order by id) rn 
    from logs
)
select distinct num as ConsecutiveNums from tmp where rn>3
order by num
