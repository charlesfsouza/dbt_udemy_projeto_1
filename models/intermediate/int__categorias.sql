with categorias as (
    select
        pk_categoria
        , categoria_nome     
    from {{ ref('stg__categorias') }}
)
select
*
from categorias