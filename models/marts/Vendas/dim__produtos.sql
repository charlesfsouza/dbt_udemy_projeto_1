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
, categorias as (
    select
        *
    from {{ ref('stg__categorias') }}
)

, joined as (
    select
        produtos.pk_produto
        , produtos.fk_categoria
        , produtos.produto_nome
        , categorias.categoria_nome
        , produtos.marca_nome
        , produtos.produto_descricao
        , produtos.qtd_estoque
        , produtos.vlr_produto
        , produtos.data_cadastro
    from produtos
    left join categorias on produtos.fk_categoria = categorias.pk_categoria
)

select
    *
from joined