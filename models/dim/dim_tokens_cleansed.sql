{# Poderia fazer uma limpeza aqui, como dar nome a fileiras nulas #}
SELECT
    token_address,
    token_block_number,
    DATE(token_block_timestamp) AS token_block_date
FROM
    {{ ref('src_tokens') }}
