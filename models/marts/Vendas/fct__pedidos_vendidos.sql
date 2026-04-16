{{
    config(
        tags=['vendas']
    )
}}

with pedidos as (
    select
        *
    from {{ ref('int__pedidos_vendidos') }}
)

select
    *
from pedidos