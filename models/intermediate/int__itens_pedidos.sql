with itens_pedidos as (
    select
        pk_item_pedido
        , quantidade
        , valor_unitario
        , valor_total
    from {{ ref('stg__itens_pedidos') }}
)
select
*
from itens_pedidos