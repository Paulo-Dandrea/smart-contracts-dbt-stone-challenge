{{ config(
    materialized = 'incremental',
    on_schema_change = 'fail',
) }}

SELECT
    *
FROM
    {{ ref('fct_blocks_cleansed') }}
    b
    INNER JOIN {{ ref('fct_tokens_cleansed') }}
    t
    ON b.block_number = t.token_block_number

{% if is_incremental() %}
WHERE
    token_block_date > (
        SELECT
            MAX(token_block_date)
        FROM
            {{ this }}
    )
{% endif %}
