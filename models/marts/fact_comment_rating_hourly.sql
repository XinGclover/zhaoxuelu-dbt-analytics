{{ config(materialized='table') }}

select
    date_trunc('hour', create_time) as comment_hour,

    count(*) as total_comments,

    sum(
        case
            when rating <= 2 then 1
            else 0
        end
    ) as low_rating_comments,

    round(
        sum(case when rating <= 2 then 1 else 0 end)::numeric
        / nullif(count(*), 0),
        4
    ) as low_rating_ratio

from {{ ref('stg_zhaoxuelu_comments') }}
group by 1
order by 1
