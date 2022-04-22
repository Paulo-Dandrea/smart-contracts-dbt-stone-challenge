SELECT
    AVG(total_blocks) AS avg_blocks_per_day
FROM
    {{ ref('mart_total_blocks_per_day') }}
