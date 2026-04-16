with categorias as (
    select
        {{ dbt_utils.generate_surrogate_key( ['id'] ) }} as pk_categoria
        , cast(id as integer) as categoria_id
        , cast(nome as string) as categoria_nome     
    from {{ source('ecomerce','categorias') }}
)
select
*
from categorias