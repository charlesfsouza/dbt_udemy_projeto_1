with source as (
    select
        {{ dbt_utils.generate_surrogate_key( ['id'] ) }} as pk_cliente
        , cast(id as integer) as cliente_id
        , cast(nome as string) as nome
        , cast(email as string) as email
        , cast(telefone as string) as telefone
        , cast(data_registro as date) as data_registro
        
    from {{ source('ecomerce','clientes') }}
)

select
*
from source