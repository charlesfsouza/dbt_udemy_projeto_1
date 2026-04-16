with avaliacoes as (
    select
        {{ dbt_utils.generate_surrogate_key( ['cliente_id','produto_id'] ) }} as pk_avaliacao
        , cast(cliente_id as integer) as cliente_id
        , cast(produto_id as integer) as produto_id
        , cast(nota as integer) as nota
        , cast(comentario as string) as comentario
        , cast(data_avaliacao as date) as data_avaliacao 
    from {{ source('ecomerce','avaliacoes') }}
)
, clientes as (
    select
        pk_cliente
        , cliente_id   
    from {{ ref('stg__clientes') }}
)
, produtos as (
    select
        pk_produto
        , produto_id
    from {{ ref('stg__produtos') }}
)
, joined as (
    select
        avaliacoes.pk_avaliacao
        , clientes.pk_cliente as fk_cliente
        , produtos.pk_produto as fk_produto
        , avaliacoes.cliente_id
        , avaliacoes.produto_id
        , avaliacoes.nota
        , avaliacoes.comentario
        , avaliacoes.data_avaliacao  
    from avaliacoes
    left join clientes on avaliacoes.cliente_id = clientes.cliente_id
    left join produtos on avaliacoes.produto_id = produtos.produto_id
)
select
*
from joined