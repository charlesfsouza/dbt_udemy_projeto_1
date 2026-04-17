{% test valid_email(model, column) %}

with validation as (
    select
        {{ column }} as email
    from {{ model }}
    where {{ column }} not like '%@%.%' -- Verifica se o email contém um "@" seguido de um domínio
)
select count(*)
from validation


{% endtest %}