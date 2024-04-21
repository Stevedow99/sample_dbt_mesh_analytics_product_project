{{
    config(
        materialized='table',
        schema='product_reporting',
        tags=['product_reporting']
    )
}}



SELECT
    vehicle_category,
    SUM(total_sales) AS total_sales
FROM {{ ref('product_sales_reporting') }}
GROUP BY vehicle_category
ORDER BY total_sales DESC