{{
    config(
        materialized = 'incremental',
    )
}}

with source as (
    select
    *
    from {{ source('ecomerce','pedidos') }}
    
    {% if is_incremental() %} 
        where data_pedido >= (select max(data_pedido) from {{ this }})
    {% endif %}
)

, pedidos as (
    select
        {{ dbt_utils.generate_surrogate_key( ['id'] ) }} as pk_pedido
        , cast(id as integer) as pedido_id
        , cast(cliente_id as integer) as cliente_id
        , cast(endereco_id as integer) as endereco_id
        , cast(data_pedido as date) as data_pedido
        , cast(status as string) as status_pedido
    from source
)
, clientes as (
    select
        pk_cliente
        , cliente_id
    from {{ ref('stg__clientes') }}
)
, joined as (
    select
        pedidos.pk_pedido
        , clientes.pk_cliente as fk_cliente
        , pedidos.pedido_id
        , pedidos.cliente_id
        , pedidos.endereco_id
        , pedidos.data_pedido
        , pedidos.status_pedido
    from pedidos
    left join clientes on clientes.cliente_id = pedidos.cliente_id
)
select
*
from joined
