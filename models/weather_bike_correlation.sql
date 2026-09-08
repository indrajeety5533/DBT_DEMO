with CTE as (

select
      t.*,
      w.*

from {{ ref('trip_fact') }} as t
left join {{ ref('Daily_weather') }} w
on t.trip_date=w.DAILY_WEATHER
)

select*from CTE