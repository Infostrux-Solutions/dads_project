{{ config(
    database = 'dev_clean',
    schema = 'weather',
    alias = 'weather_data'
) }}
SELECT 
    "CURRENT":cloudcover::string AS cloudcover,
    "CURRENT":temperature::int AS temperature,
    "CURRENT":humidity::int AS humidity, 
    "CURRENT":wind_speed::int AS wind_speed, 
    _airbyte_extracted_at AS extracted_at
FROM {{source('raw_data','current_weather')}}

