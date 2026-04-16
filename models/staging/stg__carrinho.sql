with carrinho as (
    select
        {{ dbt_utils.generate_surrogate_key( ['cliente_id','produto_id'] ) }} as pk_carrinho
        , cast(cliente_id as integer) as cliente_id
        , cast(produto_id as integer) as produto_id
        , cast(quantidade as integer) as qtd_adicionado
        , cast(data_adicionado as date) as data_adicionado        
    from {{ source('ecomerce','carrinho') }}
)
, produtos as (
    select
        pk_produto
        , produto_id
    from {{ ref('stg__produtos') }}
)
, clientes as (
    select
        pk_cliente
        , cliente_id
    from {{ ref('stg__clientes') }}
)
, joined as (
    select
        carrinho.pk_carrinho
        , clientes.pk_cliente as fk_cliente
        , produtos.pk_produto as fk_produto
        , carrinho.cliente_id
        , carrinho.produto_id
        , carrinho.qtd_adicionado
        , carrinho.data_adicionado
    from carrinho
    left join produtos on produtos.produto_id = carrinho.produto_id
    left join clientes on clientes.cliente_id = carrinho.cliente_id
)

select
*
from joined