with pagamentos as (
    select
        pk_pagamento
        , fk_cliente
        , fk_pedido
        , valor
        , metodo
        , data_pagamento
    from {{ ref('stg__pagamentos') }}
)
select
*
from pagamentos