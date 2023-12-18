{{ config(
    database = 'dev_analyze',
    schema = 'summaries',
    alias = 'dashboard'
) }}
SELECT 
    social.rated_at,
    stocks.avg_stock_value, 
    weather.max_temperature,
    weather.avg_wind_speed,
    social.avg_rating_value    
FROM {{ref('stocks_aggregate')}} stocks
INNER JOIN {{ref('weather_aggregate')}} weather
INNER JOIN {{ref('social_aggregate')}} social 
GROUP BY social.rated_at ;