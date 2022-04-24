SELECT
    *
FROM
    {{ ref('dim_blocks_cleansed') }} b
    INNER JOIN {{ ref('dim_tokens_cleansed') }} t
    ON b.block_number = t.token_block_number
