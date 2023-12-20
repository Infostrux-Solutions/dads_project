{{ config(
    database = 'dev_analyze',
    schema = 'weather',
    alias = 'weather_aggregate'
) }}
SELECT 
    extracted_at,
    min(cloudcover) AS max_cloud_cover ,
    max(temperature) AS min_temperature,
    min(humidity) AS min_humidity, 
    avg(wind_speed) AS avg_wind_speed
FROM {{ref('weather_data')}}
GROUP BY extracted_at

