select * 
from takings, week_date
where takings.week_date_id = week_date.id
and week_date.day_name = "Wednesday";