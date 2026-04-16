with itens_pedidos as (
    select
        {{ dbt_utils.generate_surrogate_key( ['pedido_id','produto_id'] ) }} as pk_item_pedido
        , cast(pedido_id as integer) as pedido_id
        , cast(produto_id as integer) as produto_id
        , cast(quantidade as integer) as quantidade
        , cast(preco_unitario as float64) as valor_unitario
        , cast(subtotal as float64) as valor_total
    from {{ source('ecomerce','itens_pedidos') }}
)
, pedidos as (
    select
        pk_pedido
        , pedido_id
    from {{ ref('stg__pedidos') }}
)
, produtos as (
    select
        pk_produto
        , produto_id
    from {{ ref('stg__produtos') }}
)
, joined as (
    select
        itens_pedidos.pk_item_pedido
        , pedidos.pk_pedido as fk_pedido
        , produtos.pk_produto as fk_produto
        , itens_pedidos.pedido_id
        , itens_pedidos.produto_id
        , itens_pedidos.quantidade
        , itens_pedidos.valor_unitario
        , itens_pedidos.valor_total
    from itens_pedidos
    left join pedidos on pedidos.pedido_id = itens_pedidos.pedido_id
    left join produtos on produtos.produto_id = itens_pedidos.produto_id
)
select
*
from joined