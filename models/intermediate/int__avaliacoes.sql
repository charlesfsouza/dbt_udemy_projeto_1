with avaliacoes as (
    select
        pk_avaliacao
        , fk_cliente
        , fk_produto
        , nota
        , comentario
        , data_avaliacao  
    from {{ref('stg__avaliacoes')}}
)
select
*
from avaliacoes