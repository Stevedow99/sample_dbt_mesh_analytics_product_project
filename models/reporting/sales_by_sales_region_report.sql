{{
    config(
        materialized='table',
        schema='sales_reporting',
        tags=['reporting']
    )
}}



SELECT
    salesrep_region,
    SUM(total_sales) AS total_sales
FROM {{ ref('sales_team_reporting') }}
GROUP BY salesrep_region