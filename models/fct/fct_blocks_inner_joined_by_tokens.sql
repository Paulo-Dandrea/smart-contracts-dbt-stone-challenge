SELECT
    *
FROM
    {{ ref('fct_blocks_cleansed') }} b
    INNER JOIN {{ ref('fct_tokens_cleansed') }} t
    ON b.block_number = t.token_block_number
