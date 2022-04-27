SELECT
    COUNT(block_number) AS total_blocks,
    block_date
FROM
    {{ ref('fct_blocks_cleansed') }}
GROUP BY
    block_date
ORDER BY
    total_blocks DESC
