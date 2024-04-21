{{
    config(
        materialized='table',
        schema='sales_reporting',
        tags=['reporting']
    )
}}

WITH base_data AS (
    SELECT
        transaction_id,
        customer_id,
        customer_state,
        salesrep_id,
        salesrep_name,
        salesrep_region,
        transaction_amount
    FROM {{ ref('data_engineering_project','salesteam_customer_sales') }}
)

SELECT
    salesrep_name,
    salesrep_region,
    customer_state,
    SUM(transaction_amount) AS total_sales
FROM base_data
GROUP BY 1, 2, 3
ORDER BY salesrep_name, salesrep_region, customer_state