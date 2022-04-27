WITH raw_tokens AS (
    SELECT
        address,
        block_timestamp,
        block_number
    FROM
        `bigquery-public-data.crypto_ethereum.tokens`
)
SELECT
    address AS token_address,
    block_timestamp AS token_block_timestamp,
    block_number AS token_block_number
FROM
    raw_tokens
