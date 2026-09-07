with trip as (

    select
        RIDE_ID,
        date(to_timestamp(STARTED_AT)) as trip_date,
        START_STATION_ID as station_id,
        END_STATION_ID,
        MEMBER_CASUAL,
        timestampdiff(
            second,
            to_timestamp(STARTED_AT),
            to_timestamp(ENDED_AT)
        ) as trip_duration_seconds

    from {{ ref('stg_bike') }}

    

)

select *
from trip