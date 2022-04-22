{# Poderia fazer uma limpeza aqui, como dar nome a fileiras nulas #}
SELECT
    *
FROM
    {{ ref('src_blocks') }}
