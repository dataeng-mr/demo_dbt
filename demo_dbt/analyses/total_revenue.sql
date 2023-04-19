with payments as (
    select
        payment_method,
        sum(amount) as total_amount
    from {{ ref('stg_payments') }}
    where status = 'success'
)

select * from payments