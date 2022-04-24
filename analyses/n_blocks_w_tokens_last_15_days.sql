{# 3- Em relação aos últimos 15 dias, qual foi a variação na quantidade de blocos contendo
tokens em um dia ? #}
SELECT
    block_date,
    COUNT(block_number) number_of_blocks,
FROM
    {{ ref('fct_blocks_inner_joined_by_tokens') }}
WHERE
    block_date <= CURRENT_DATE()
    AND block_date >= date_add(CURRENT_DATE(), INTERVAL -15 DAY)
GROUP BY
    block_date {# -- Number of blocks with tokens generated per day within last 15 days #}
