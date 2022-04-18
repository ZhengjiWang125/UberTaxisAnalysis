
select 
t_1.date as date,
t_1.sum_distance/t_1.total_trips as avg_distance

from 

(select 

t_0.date as date,
sum(t_0.total_trips) as total_trips,
sum(t_0.sum_distance) as sum_distance

from 

(select 
strftime ('%Y-%m-%d',pickup_time) as date,
count(*) as total_trips,
sum(distance) as sum_distance

from 
yellow_taxi

where 
pickup_time between '2009-01-01' and '2009-12-31'

group by 
strftime ('%Y-%m-%d',pickup_time)

union 

select 
strftime ('%Y-%m-%d',pickup_time) as date,
count(*) as total_trips,
sum(distance) as sum_distance

from 
Uber

where 
pickup_time between '2009-01-01' and '2009-12-31'

group by 
strftime ('%Y-%m-%d',pickup_time)

)t_0

group by 
t_0.date 

)t_1

group by 
t_1.date

order by 
sum(t_1.total_trips) desc

limit 10
