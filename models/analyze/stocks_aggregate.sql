{{ config(
    database = 'dev_analyze',
    schema = 'stocks',
    alias = 'stocks_aggregate'
) }}
SELECT 
    (value_at_opening + value_at_closing)/2 AS avg_stock_value,
    extracted_at
FROM {{ref('stocks_data')}} 