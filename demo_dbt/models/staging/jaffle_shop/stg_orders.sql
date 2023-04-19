with orders as (
    select
        cast(id as int) as order_id,
        cast(user_id as int) as customer_id,
        order_date,
        status
    from {{ source('jaffle_shop', 'orders') }}
)

select * from orders