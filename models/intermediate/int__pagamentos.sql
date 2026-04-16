with pagamentos as (
    select
        pk_pagamento
        , fk_pedido
        , pagamento_id
        , pedido_id
        , valor
        , metodo
        , data_pagamento
    from {{ ref('stg__pagamentos') }}
)
select
*
from pagamentos