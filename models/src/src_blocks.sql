WITH raw_blocks AS (
    SELECT
        TIMESTAMP,
        NUMBER,
        gas_used,
    FROM
        `bigquery-public-data.crypto_ethereum.blocks`
)
SELECT
    TIMESTAMP AS block_timestamp,
    NUMBER AS block_number,
    gas_used AS block_gas_used
FROM
    raw_blocks
