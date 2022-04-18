
select 
t_1.hour as hour,
t_1.sum_precipitation as sum_precipitation,
t_1.avg_windspeed as avg_windspeed,
sum(t_2.total_trips) as total_trips

from 

(select 
strftime ('%H',date) as hour,
sum(precipitation) as sum_precipitation,
avg(windspeed) as avg_windspeed

from
weather_hourly 

where 
date between '2012-10-22' and '2012-11-06'

group by 
strftime ('%H',date) 
)t_1

left join 

(select 
strftime ('%H',pickup_time) as hour,
count(*) as total_trips

from 
yellow_taxi

where 
pickup_time between '2012-10-22' and '2012-11-06'

group by 
strftime ('%H',pickup_time)

union 

select 
strftime ('%H',pickup_time) as hour,
count(*) as total_trips

from 
Uber

where 
pickup_time between '2012-10-22' and '2012-11-06'

group by 
strftime ('%H',pickup_time)

)t_2

on 
t_1.hour = t_2.hour

group by 
t_1.hour,
t_1.sum_precipitation,
t_1.avg_windspeed


