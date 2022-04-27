SELECT
    block_date,
    COUNT(block_number) number_of_blocks,
FROM
    {{ ref('fct_blocks_inner_joined_by_tokens') }}
WHERE
    block_date <= CURRENT_DATE()
    AND block_date >= date_add(CURRENT_DATE(), INTERVAL -16 DAY)
GROUP BY
    block_date
