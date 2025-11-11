

WITH base_orders AS (
    SELECT * 
    FROM {{ source('bigquery_raw', 'orders') }} -- staging.orders
),

transformed AS (
    SELECT
        order_id,
        customer_id,
        order_date,
        UPPER(order_status) AS order_status,        -- standardize case
        ROUND(order_amount, 2) AS order_amount,     -- ensure 2 decimals
        DATE_DIFF(CURRENT_DATE(), order_date, DAY) AS days_since_order,
        CASE
            WHEN order_status = 'Completed' THEN TRUE
            ELSE FALSE
        END AS is_completed,
        CASE 
            WHEN order_amount > 300 THEN 'High'
            WHEN order_amount > 150 THEN 'Medium'
            ELSE 'Low'
        END AS order_value_tier
    FROM base_orders
)

SELECT * FROM transformed