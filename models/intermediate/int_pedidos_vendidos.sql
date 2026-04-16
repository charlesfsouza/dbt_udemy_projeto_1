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

, produtos as (
    select
        *
    from {{ ref('stg__produtos') }}
)

, pagamentos as (
    select
        *
    from {{ ref('stg__pagamentos') }}
)

, categorias as (
    select
        *
    from {{ ref('stg__categorias') }}
)

, joined as (
    select
        pedidos.data_pedido
        , cliente.nome as nome_cliente
        , cliente.email as email_cliente
        , pagamentos.valor as valor_pagamento
        , pagamentos.metodo as metodo_pagamento
        , pagamentos.status as status_pagamento
        , pagamentos.data_pagamento as data_pagamento
        , produtos.nome as nome_produto
        , categorias.nome as categoria_produto
        , itens_pedidos.quantidade as quantidade_itens
        , itens_pedidos.preco_unitario as preco_unitario_itens
    from pedidos
    left join cliente on pedidos.fk_cliente = cliente.pk_cliente
    left join pagamentos on pedidos.pk_pedido = pagamentos.fk_pedido
    left join itens_pedidos on pedidos.pk_pedido = itens_pedidos.fk_pedido
    left join produtos on itens_pedidos.fk_produto = produtos.pk_produto
    left join categorias on produtos.fk_categoria = categorias.pk_categoria
)

select
    *
from joined