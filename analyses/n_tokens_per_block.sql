SELECT
    COUNT(token_address) AS n_tokens,
    token_block_number
FROM
    {{ ref('fct_tokens_cleansed') }}
GROUP BY
    token_block_number
ORDER BY
    n_tokens DESC
