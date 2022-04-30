
select 
t_1.date as date,
sum(t_2.total_trips) as total_trips

from 

(select 
strftime ('%Y-%m-%d',date) as date,
windspeed

from 
weather_daily

where 
date between '2014-01-01' and '2015-01-01'
)t_1

left join 

(select 
strftime ('%Y-%m-%d',pickup_time) as date,
count(*) as total_trips

from 
yellow_taxi

where 
pickup_time between '2014-01-01' and '2015-01-01'

group by 
strftime ('%Y-%m-%d',pickup_time)

union 

select 
strftime ('%Y-%m-%d',pickup_time) as date,
count(*) as total_trips

from 
Uber

where 
pickup_time between '2014-01-01' and '2015-01-01'

group by 
strftime ('%Y-%m-%d',pickup_time)
)t_2

on 
t_1.date = t_2.date

group by 
t_1.date

order by 
t_1.windspeed desc 

limit 10


