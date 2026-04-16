with carrinho as (
    select
        pk_carrinho
        , fk_cliente
        , fk_produto
        , qtd_adicionado
        , data_adicionado 
    from {{ ref('stg__carrinho') }}
)
select
*
from carrinho