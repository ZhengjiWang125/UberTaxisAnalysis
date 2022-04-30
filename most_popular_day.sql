SELECT 
strftime ('%w',pickup_time) as most_popular_day,
Count(*) as times
FROM
Uber
WHERE
pickup_time between '2009-01-01' AND '2015-07-01'
GROUP BY strftime ('%w',pickup_time) 
ORDER BY times DESC
LIMIT 1;