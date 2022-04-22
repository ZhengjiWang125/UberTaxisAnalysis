
select 
t_1.date as date,
t_1.hour as hour,
t_1.precipitation as precipitation,
t_1.windspeed as windspeed,
sum(t_2.total_trips) as total_trips

from 

(select 
strftime ('%Y-%m-%d',date) as date,
strftime ('%H',date) as hour,
precipitation,
windspeed

from
weather_hourly 

where 
date between '2012-10-22' and '2012-11-06'

group by 
strftime ('%Y-%m-%d',date),
strftime ('%H',date),
precipitation,
windspeed
)t_1

left join 

(select 
strftime ('%Y-%m-%d',pickup_time) as date,
strftime ('%H',pickup_time) as hour,
count(*) as total_trips

from 
yellow_taxi

where 
pickup_time between '2012-10-22' and '2012-11-06'

group by 
strftime ('%Y-%m-%d',pickup_time),
strftime ('%H',pickup_time) 

union 

select 
strftime ('%Y-%m-%d',pickup_time) as date,
strftime ('%H',pickup_time) as hour,
count(*) as total_trips

from 
Uber

where 
pickup_time between '2012-10-22' and '2012-11-06'

group by 
strftime ('%Y-%m-%d',pickup_time),
strftime ('%H',pickup_time)

)t_2

on 
t_1.date = t_2.date
and 
t_1.hour = t_2.hour

group by 
t_1.date,
t_1.hour,
t_1.precipitation,
t_1.windspeed


