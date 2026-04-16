with pagamentos as (
    select
        {{ dbt_utils.generate_surrogate_key( ['id'] ) }} as pk_pagamento
        , cast(id as integer) as pagamento_id
        , cast(pedido_id as integer) as pedido_id
        , cast(valor as float64) as valor_pagamento
        , cast(metodo as string) as metodo_pagamento
        , cast(data_pagamento as date) as data_pagamento        
    from {{ source('ecomerce','pagamentos') }}
)
, pedidos as (
    select
        pk_pedido
        , pedido_id
    from {{ ref('stg__pedidos') }}
)
, joined as (
    select
        pagamentos.pk_pagamento
        , pedidos.pk_pedido as fk_pedido
        , pagamentos.pagamento_id
        , pagamentos.pedido_id
        , pagamentos.valor_pagamento
        , pagamentos.metodo_pagamento
        , pagamentos.data_pagamento
    from pagamentos
    left join pedidos on pedidos.pedido_id = pagamentos.pedido_id
)
select
*
from joined