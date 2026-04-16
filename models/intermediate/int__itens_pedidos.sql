{{
    config(
        tags=['vendas']
    )
}}

with pedidos as (
    select
        *
    from {{ ref('stg__pedidos') }}
)

, itens_pedidos as (
    select
        *
    from {{ ref('stg__itens_pedidos') }}
)


, pagamentos as (
    select
        *
    from {{ ref('stg__pagamentos') }}
)

, avaliacoes as (
    select
        *
    from {{ ref('stg__avaliacoes') }}
)

, produtos as (
    select
        *
    from {{ ref('stg__produtos') }}
)

, categorias as (
    select
        *
    from {{ ref('stg__categorias') }}
)

, joined as (
    select
        itens_pedidos.pk_item_pedido
       , itens_pedidos.fk_pedido
       , itens_pedidos.fk_produto
       , produtos.fk_categoria
       , pedidos.fk_cliente
       , pagamentos.pk_pagamento as fk_pagamento
       , avaliacoes.pk_avaliacao as fk_avaliacao
    from itens_pedidos
    left join pedidos on pedidos.pk_pedido = itens_pedidos.fk_pedido
    left join pagamentos on pedidos.pk_pedido = pagamentos.fk_pedido
    left join avaliacoes on avaliacoes.fk_cliente = pedidos.fk_cliente and avaliacoes.fk_produto = itens_pedidos.fk_produto
    left join produtos on produtos.pk_produto = itens_pedidos.fk_produto
)

select
    *
from joined