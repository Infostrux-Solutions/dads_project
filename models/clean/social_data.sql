{{ config(
    database = 'dev_clean',
    schema = 'social_media',
    alias = 'sm_ratings'
) }}
SELECT 
    rating_id,
    rating AS rating_value,
    rating_date AS rated_at
FROM {{source('raw_data','ratings')}}
WHERE rating is not null 