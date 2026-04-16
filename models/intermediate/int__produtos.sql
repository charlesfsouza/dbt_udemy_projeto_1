with produtos as (
    select
        pk_produto
        , fk_categoria
        , produto_nome
        , marca_nome
        , produto_descricao
        , qtd_estoque
        , vlr_produto
        , data_cadastro
    from {{ ref('stg__produtos') }}
)
select
*
from produtos