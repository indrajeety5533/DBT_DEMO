{{config(
    materialization= 'incremental'
    unique_key = 'order_id'
    incremental_strategy= 'merge'

)}}

select order_id, MEMBER_CASUAL
from {{ source('demo', 'bike') }}

{% if is incremental() %}

where updated_at>(select max(updated_at)
from {{this}}
)

{%endif%}


%}