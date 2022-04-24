{# Poderia fazer uma limpeza aqui, como dar nome a fileiras nulas #}
SELECT
    DATE(block_timestamp) AS block_date,
    block_number,
    block_gas_used
FROM
    {{ ref('src_blocks') }}
    {# TODO: Apagar no source colunas não usadas #}
