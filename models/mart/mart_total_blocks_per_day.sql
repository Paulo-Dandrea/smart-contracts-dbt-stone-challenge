{# Aqui deveria mesmo ser um Mart? Se fosse uma Mart, devereria ser um view?  #}

SELECT
    COUNT(block_number) AS total_blocks,
    block_date
FROM
    {{ ref('dim_blocks_cleansed') }}
GROUP BY
    block_date
ORDER BY
    total_blocks DESC
