WITH ranked_by_gas AS (
    SELECT
        block_number,
        block_gas_used,
        token_address,
        RANK() over(
            ORDER BY
                block_gas_used DESC
        ) gas_rank
    FROM
        {{ ref('fct_blocks_inner_joined_by_tokens') }}
)
SELECT
    *
FROM
    ranked_by_gas
WHERE
    gas_rank = 1
