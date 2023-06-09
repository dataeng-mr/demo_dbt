with orders as (
    select * 
    from {{ ref('stg_orders') }}
),

payments as (
    select * 
    from {{ ref('stg_payments') }}
),

orders_payments as (
    select
        order_id,
        sum(case when status = 'success' then amount end) as amount
    from payments
    group by order_id
),

final as (

    select
        o.order_id,
        o.customer_id,
        o.order_date,
        coalesce(op.amount, 0) as amount
    from orders as o
    left join orders_payments  as op
    on o.order_id = op.order_id
)

select * from final