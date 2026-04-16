{{
    config(
        tags=['vendas']
    )
}}

with clientes as (
    select
        *
    from {{ ref('int__clientes') }}
)

select
    *
from clientes