select 
t_1.distance as '95percentile'

from 

(
select 
distance

from 
yellow_taxi

where 
pickup_time between '2013-07-01' and '2013-07-31'

union 

select 
distance

from 
Uber

where 
pickup_time between '2013-07-01' and '2013-07-31'

)t_1

order by t_1.distance asc

limit 1

offset 

(select

count(*)

from 

(select 
distance

from 
yellow_taxi

where 
pickup_time between '2013-07-01' and '2013-07-31'

union 

select 
distance

from 
Uber

where 
pickup_time between '2013-07-01' and '2013-07-31'

)

) * 95 / 100 -1








