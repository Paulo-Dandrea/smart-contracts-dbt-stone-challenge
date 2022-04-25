Bem vindo à entrega do desafio do time de dados tratados.

### Proposta para entrega

Além de entregar as queries que respondem as perguntas, me aprofundei no que **me parece** fazer parte da rotina do pessoal de dados tratados. Como o Dataform não está acessível, usei o DBT que, se não me engano, é similar.

Neste Readme, vou tentar organizar por questão o que está nos códigos.


### Perguntas que gostaríamos de responder com nossas tabelas:
> Quantos contratos (tokens) estão sendo criados por bloco?

Na tabela `crypto_ethereum.tokens`, existe a coluna `block_number`, que tem seu correspondente em `crypto_ethereum.blocks`. Acredito que se agruparmos por `block_number` e contarmos (`count()`), por exemplo, os `token_adresses`, temos a quantidade de tokens por bloco.

O arquivo que responde esta pergunta é `analyses/n_tokens_per_block`:

![image](https://user-images.githubusercontent.com/37453518/165186443-9dca8bdd-879e-4d05-b515-2c7b10c7aa94.png)

Que tem como referência uma **tabela fato**, **incremental**, que apenas atualiza caso a data do bloco seja mais recente das que já estão na Warehouse. Aqui, também, **transformamos de TIMESTAMP para DATE**, já que não estamos precisando das horas. `models/fct/fct_tokens_cleansed.sql`:

![image](https://user-images.githubusercontent.com/37453518/165186538-66d8cd9b-385e-4212-8723-db78f6f9aca6.png)

Esta tabela acima, por sua vez, consome da **êfemera** `source_tokens`. Nela, alteramos os nomes de colunas e, nesta proposta, também só passamos as colunas que nos interessa. `models/src/src_tokens.sql`:

![image](https://user-images.githubusercontent.com/37453518/165186671-860d16f6-8607-4253-851b-695d5f1585db.png)

Temos a tabela `fct_tokens_cleansed` documentada e testada. Teste como 'not_null' e teste de relação com outra tabela. `models/schema.yml`

![image](https://user-images.githubusercontent.com/37453518/165186887-d8794d3a-0ae8-4013-89f2-2436b16a5c54.png)








![image](https://user-images.githubusercontent.com/37453518/165180098-4ca9776c-6efa-4800-8ba2-4f9e33c6364e.png)


![image](https://user-images.githubusercontent.com/37453518/165180682-81fbbaef-1211-456a-93f2-2c1407a02e57.png)

![image](https://user-images.githubusercontent.com/37453518/165180943-77ad717e-fd1e-400f-afc6-684aadde0623.png)
