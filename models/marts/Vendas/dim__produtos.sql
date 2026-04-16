{{
    config(
        tags=['vendas']
    )
}}

with produtos as (
    select
        *
    from {{ ref('int__produtos') }}
)

select
    *
from produtos