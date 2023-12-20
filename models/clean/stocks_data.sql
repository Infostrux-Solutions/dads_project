{{ config(
    database = 'dev_clean',
    schema = 'stocks',
    alias = 'stocks_data'
) }}
SELECT 
    "1. OPEN" AS value_at_opening,
    "4. CLOSE" AS value_at_closing, 
    _airbyte_extracted_at AS extracted_at
FROM {{source('raw_data','time_series_daily')}} 
