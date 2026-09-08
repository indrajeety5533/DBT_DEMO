WITH cte AS (

    SELECT*
        --TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
        --DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
        --HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,

        {{ Day_type('STARTED_AT') }} AS day_type,

        {{ get_session('STARTED_AT') }} AS station_of_year

    FROM {{ ref('stg_bike') }}

)

SELECT *
FROM cte;