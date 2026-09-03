{{ config(
    database='DEMO',
    schema='DEMO_SCHEMA'
) }}

WITH cte AS (

    SELECT
        TO_TIMESTAMP(STARTED_AT) AS started_at,
        DATE(TO_TIMESTAMP(STARTED_AT)) AS date_started_at,
        HOUR(TO_TIMESTAMP(STARTED_AT)) AS hour_started_at,
        CASE
            WHEN DAYNAME(TO_TIMESTAMP(STARTED_AT)) IN ('Sat','Sun')
                THEN 'weekend'
            ELSE 'weekday'
        END AS day_type,
        CASE
            WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) IN (12,1,2) THEN 'Winter'
            WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) IN (3,4,5) THEN 'Spring'
            WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) IN (6,7,8) THEN 'Summer'
            ELSE 'Autumn'
        END AS season_of_year
    FROM {{ source('demo', 'bike') }}

)

SELECT *
FROM cte