SELECT
    ROUND(AVG(total_blocks), 2) AS avg_blocks_per_day
FROM
    {{ ref('mart_total_blocks_per_day') }}
