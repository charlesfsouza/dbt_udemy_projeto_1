{{
    config(
        tags=['vendas']
    )
}}

with pagamentos as (
    select
        *
    from {{ ref('int__pagamentos') }}
)

select
    *
from pagamentos