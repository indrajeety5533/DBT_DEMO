WITH cte AS (

    SELECT 
    
    TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
    case
    when DAYNAME(TO_TIMESTAMP(STARTED_AT)) in ('sat','sun') then 'weekend' else 'weekdays' end as Day_type,

    case
    when month(TO_TIMESTAMP(STARTED_AT)) in (12,1,2) then 'winter'
    when month(TO_TIMESTAMP(STARTED_AT)) in (3,4,5) then 'spring'
    when month(TO_TIMESTAMP(STARTED_AT)) in (12,1,2) then 'summer' else 'autumn' end AS station_of_year
    FROM {{ source('demo', 'bike') }}

)

SELECT * FROM cte