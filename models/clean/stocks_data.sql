{{ config(
    database = 'dev_clean',
    schema = 'stocks',
    alias = 'stocks_data'
) }}
SELECT 
    open AS value_at_opening,
    close AS value_at_closing, 
    _airbyte_extracted_at AS extracted_at
FROM {{source('stocks','time_series_daily')}} ;