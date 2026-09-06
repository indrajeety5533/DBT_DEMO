with trip as (

    select
        RIDE_ID,
        RIDEABLE_TYPE,
        date(to_timestamp(STARTED_AT)) as trip_date,
        START_STATIO_ID as station_id,
        END_STATION_ID,
        MEMBER_CSUAL,
        timestampdiff(
            second,
            to_timestamp(STARTED_AT),
            to_timestamp(ENDED_AT)
        ) as trip_duration_seconds

    from {{ source('demo', 'bike') }}

    

)

select *
from trip