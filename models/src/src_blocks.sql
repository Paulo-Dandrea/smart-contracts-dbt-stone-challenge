{# Normalmente, acredito, um source deve passar todas as colunas. Mas não quis gastar minhas quotas :D #}
WITH raw_blocks AS (
    SELECT
        TIMESTAMP,
        NUMBER,
        SIZE,
        gas_used,
        transaction_count
    FROM
        `bigquery-public-data.crypto_ethereum.blocks`
)
{# Acredito que aqui adaptamos os nomes de colunas #}
SELECT
    TIMESTAMP AS block_timestamp,
    NUMBER AS block_number,
    SIZE AS block_size,
    gas_used AS block_gas_used,
    transaction_count AS block_transaction_count
FROM
    raw_blocks
