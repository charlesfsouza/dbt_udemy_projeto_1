with produtos as (
    select
        {{ dbt_utils.generate_surrogate_key( ['id'] ) }} as pk_produto
        , cast(id as integer) as produto_id
        , cast(categoria_id as integer) as categoria_id
        , cast(nome as string) as produto_nome
        , cast(marca as string) as marca_nome
        , cast(descricao as string) as produto_descricao
        , cast(estoque as integer) as qtd_estoque
        , cast(preco as float64) as vlr_produto
        , cast(data_cadastro as date) as data_cadastro
        
    from {{ source('ecomerce','produtos') }}
)
, categorias as (
    select
        pk_categoria
        , categoria_id    
    from {{ ref('stg__categorias') }}
)
, joined as (
    select
        produtos.pk_produto
        , categorias.pk_categoria as fk_categoria
        , produtos.produto_id
        , produtos.categoria_id
        , produtos.produto_nome
        , produtos.marca_nome
        , produtos.produto_descricao
        , produtos.qtd_estoque
        , produtos.vlr_produto
        , produtos.data_cadastro
    from produtos
    left join categorias on categorias.categoria_id = produtos.categoria_id
)
select
*
from joined