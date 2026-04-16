{{
    config(
        tags=['vendas']
    )
}}

with pedidos as (
    select
        *
    from {{ ref('int__itens_pedidos') }}
)

select
    *
from pedidos