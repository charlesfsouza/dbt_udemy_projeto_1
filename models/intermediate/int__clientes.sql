with source as (
    select
        pk_cliente
        , nome
        , email
        , telefone
        , data_registro
    from {{ ref('stg__clientes') }}
)
select
*
from source