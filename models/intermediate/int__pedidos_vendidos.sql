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

, cliente as (
    select
        *
    from {{ ref('stg__clientes') }}
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


, joined as (
    select
        pedidos.pk_pedido
       , itens_pedidos.fk_produto
       , pagamentos.pk_pagamento as fk_pagamento
       , pedidos.fk_cliente
       , sum(itens_pedidos.quantidade) as quantidade_itens
       , sum(itens_pedidos.valor_total) as valor_total

    from pedidos
    left join cliente on pedidos.fk_cliente = cliente.pk_cliente
    left join pagamentos on pedidos.pk_pedido = pagamentos.fk_pedido
    left join itens_pedidos on pedidos.pk_pedido = itens_pedidos.fk_pedido


)

select
    *
from joined