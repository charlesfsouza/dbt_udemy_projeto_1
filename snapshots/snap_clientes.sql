{% snapshot snap_clientes %}
    {{
        config(
            target='clientes',
            target_schema='stg',
            unique_key='cliente_id',
            strategy='timestamp',
            updated_at='data_registro'
        )
    }}
    
    select
        cliente_id
        , nome
        , email
        , telefone
        , data_registro
    from {{ref('stg__clientes') }}
    
{% endsnapshot %}