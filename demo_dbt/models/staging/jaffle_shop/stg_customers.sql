with customers as (
    select
        cast(id as int) as customer_id,
        first_name,
        last_name
    from {{ source('jaffle_shop', 'customers') }}
)

select * from customers