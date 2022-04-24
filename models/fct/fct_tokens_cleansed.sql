{# Poderia fazer uma limpeza aqui, como dar nome a fileiras nulas #}
{{ config(
    materialized = 'incremental',
    on_schema_change = 'fail',
) }}

SELECT
    token_address,
    token_block_number,
    DATE(token_block_timestamp) AS token_block_date
FROM
    {{ ref('src_tokens') }}

{% if is_incremental() %}
WHERE
    DATE(token_block_timestamp) > (
        SELECT
            MAX(token_block_date)
        FROM
            {{ this }}
    )
{% endif %}
