{{ config(
    materialized = 'incremental',
    on_schema_change = 'fail',
) }}

SELECT
    DATE(block_timestamp) AS block_date,
    block_number,
    block_gas_used
FROM
    {{ ref('src_blocks') }}

{% if is_incremental() %}
WHERE
    DATE(block_timestamp) > (
        SELECT
            MAX(block_date)
        FROM
            {{ this }}
    )
{% endif %}
