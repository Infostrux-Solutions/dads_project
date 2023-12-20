{{ config(
    database = 'dev_analyze',
    schema = 'social_media',
    alias = 'social_aggregate'
) }}
SELECT 
    rated_at,
    avg(rating_value) as avg_rating_value
FROM {{ref('social_data')}}
GROUP BY rated_at 