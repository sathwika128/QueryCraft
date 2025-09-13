---1 way
SELECT id as "Id" 
FROM
(SELECT *,LAG(temperature, 1) OVER(ORDER BY recordDate) AS prev_day_temp FROM Weather) AS subquery
WHERE temperature > prev_day_temp;

---2 way
SELECT w1.id AS "Id"
FROM Weather w1
JOIN Weather w2
ON w1.recordDate = w2.recordDate + INTERVAL '1 day'
WHERE w1.temperature > w2.temperature;
