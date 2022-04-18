SELECT 
strftime ('%H',pickup_time) as most_popular_hour,
Count(*) as times
FROM
yellow_taxi
WHERE
pickup_time between '2009-01-01' AND '2015-06-30'
GROUP BY strftime ('%H',pickup_time) 
ORDER BY times DESC
LIMIT 1;