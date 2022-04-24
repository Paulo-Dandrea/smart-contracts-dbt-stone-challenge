{# Aqui deveria mesmo ser um Mart? Se fosse uma Mart, devereria ser um view? 
 #}

SELECT
    COUNT(block_number) AS total_blocks,
    DATE(block_timestamp) AS DATE
FROM
    {{ ref('dim_blocks_cleansed') }}
GROUP BY
    DATE
ORDER BY
    total_blocks DESC
