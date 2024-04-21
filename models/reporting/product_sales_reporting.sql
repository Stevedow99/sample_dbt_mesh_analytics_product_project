{{
    config(
        materialized='table',
        schema='product_reporting',
        tags=['product_reporting']
    )
}}



SELECT
    vehicle_name,
    vehicle_category,
    SUM(transaction_amount) AS total_sales
FROM {{ ref('data_engineering_project', 'customer_product_sales', v=1) }}
GROUP BY vehicle_name, vehicle_category
ORDER BY total_sales DESC