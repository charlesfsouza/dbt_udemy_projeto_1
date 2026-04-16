{{
    config(
        tags=['vendas']
    )
}}

with avaliacoes as (
    select
        pk_avaliacao
        , fk_cliente
        , fk_produto
        , nota
        , comentario
        , data_avaliacao  
    from {{ref('int__avaliacoes')}}
)
select
*
from avaliacoes