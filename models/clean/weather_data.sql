{{ config(
    database = 'dev_clean',
    schema = 'weather',
    alias = 'weather_data'
) }}
SELECT 
    "CURRENT":cloudcover AS cloudcover,
    "CURRENT":temperature,
    "CURRENT":humidity AS humidity, 
    "CURRENT":wind_speed AS wind_speed, 
    _airbyte_extracted_at AS extracted_at
FROM {{source('raw_data','current_weather')}};

