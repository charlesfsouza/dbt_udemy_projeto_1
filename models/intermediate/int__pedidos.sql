with pedidos as (
    select
        pk_pedido
        , fk_cliente
        , endereco_id
        , data_pedido
        , status_pedido
    from {{ ref('stg__pedidos') }}
)
select
*
from pedidos
