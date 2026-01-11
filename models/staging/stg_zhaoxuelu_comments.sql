{{ config(materialized='view') }}

with source as (

    select *
    from {{ source('douban', 'zhaoxuelu_comments') }}

),

cleaned as (

    select
        user_id,
        user_name,
        votes,
        status,

        case
            when rating between 1 and 5 then rating
            else null
        end as rating,

        user_location,
        create_time,
        insert_time,
        user_comment,
        batch_id

    from source

)

select *
from cleaned
