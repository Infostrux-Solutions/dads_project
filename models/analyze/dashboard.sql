{{ config(
    database = 'dev_analyze',
    schema = 'summaries',
    alias = 'dashboard'
) }}
SELECT 
    social.rated_at,
    stocks.avg_stock_value, 
    weather.min_temperature,
    weather.avg_wind_speed,
    social.avg_rating_value    
FROM {{ref('stocks_aggregate')}} stocks
INNER JOIN {{ref('weather_aggregate')}} weather
    ON DATE_TRUNC('DAY', stocks.extracted_at)=DATE_TRUNC('DAY', weather.extracted_at)
INNER JOIN {{ref('social_aggregate')}} social 
    ON DATE_TRUNC('DAY', stocks.extracted_at)=social.rated_at