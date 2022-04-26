Bem vindo à entrega do desafio do time de dados tratados.

### Proposta para entrega

Além de entregar as queries que respondem as perguntas, me aprofundei no que **me parece** fazer parte da rotina do pessoal de dados tratados. Como o Dataform não está acessível, usei o DBT que, se não me engano, é similar.

---

### Sources

Primeiramente, temos dois 'sources', CTEs efêmeros que fazem o primeiro contato com as tabelas do 'dataset' público **crypto_ethereum**, neles:
- Selecionei apenas colunas que achei necessárias
- Renomeei colunas


![image](https://user-images.githubusercontent.com/37453518/165271849-572daecb-71f7-449b-b9a4-d9a2eac404d1.png)
![image](https://user-images.githubusercontent.com/37453518/165271661-988aaf0f-e58c-421b-be76-ef10f4940e4a.png)
![image](https://user-images.githubusercontent.com/37453518/165272549-11b83a47-7d50-412c-b5ad-3f731f7ff04c.png)

### Tabelas de fatos

Temos 3 tabelas de fatos. Para os blocos, contratos e as duas mescladas para quando existem contratos em blocos, ou seja, um INNER JOIN em `block_number`.
Nelas:
- Transformamos TIMESTAMP em DATE, já que não utilizamos HORA.
- Configuramos ela como 'incremental', só atualizando a tabela quando o registro tiver uma DATA superior das já registradas na **nossa** tabela


![image](https://user-images.githubusercontent.com/37453518/165274379-169236d2-8c1a-4cf3-bcda-27dddf814712.png)
![image](https://user-images.githubusercontent.com/37453518/165274452-55a6016c-2dd5-453d-b06d-456ab582577d.png)
![image](https://user-images.githubusercontent.com/37453518/165274509-6fa14303-3a2a-43ca-a220-e9cf1ef1cd1d.png)


- Elas estão documentadas e testadas, seja por testes singulares (-unique -not_null) ou por macros (-positive_value -no_nulls_in_columns)

![image](https://user-images.githubusercontent.com/37453518/165275524-46e6a9f2-545a-4fdc-abfb-dabcc35f63db.png)

![image](https://user-images.githubusercontent.com/37453518/165275790-f1be1475-d7d5-4c7b-a7d2-5e95019c85e3.png)

![image](https://user-images.githubusercontent.com/37453518/165275847-30429e24-e65d-453f-835d-8828d49ac6bc.png)

![image](https://user-images.githubusercontent.com/37453518/165275943-9a087496-b6b6-49d8-8fd0-7dce0e9c06be.png)

![image](https://user-images.githubusercontent.com/37453518/165275997-77cf1bf0-fd57-4965-a8ba-e6e29d26da9c.png)

![image](https://user-images.githubusercontent.com/37453518/165276047-8f69d6cd-6adb-4ed2-85d0-3b94b1349707.png)



### 1. Quantos contratos (tokens) estão sendo criados por bloco?





Na tabela `crypto_ethereum.tokens`, existe a coluna `block_number`, que tem seu correspondente em `crypto_ethereum.blocks`. Acredito que se agruparmos por `block_number` e contarmos (`count()`), por exemplo, os `token_adresses`, temos a quantidade de tokens por bloco.

O arquivo que responde esta pergunta é `analyses/n_tokens_per_block`:

![image](https://user-images.githubusercontent.com/37453518/165186443-9dca8bdd-879e-4d05-b515-2c7b10c7aa94.png)

Que tem como referência uma **tabela fato**, **incremental**, que apenas atualiza caso a data do bloco seja mais recente das que já estão na Warehouse. Aqui, também, **transformamos de TIMESTAMP para DATE**, já que não estamos precisando das horas. `models/fct/fct_tokens_cleansed.sql`:

![image](https://user-images.githubusercontent.com/37453518/165186538-66d8cd9b-385e-4212-8723-db78f6f9aca6.png)

Esta tabela acima, por sua vez, consome da **efêmera** `source_tokens`. Nela, alteramos os nomes de colunas e, nesta proposta, também só passamos as colunas que nos interessa. `models/src/src_tokens.sql`:

![image](https://user-images.githubusercontent.com/37453518/165186671-860d16f6-8607-4253-851b-695d5f1585db.png)

Temos a tabela `fct_tokens_cleansed` documentada e testada. Teste como 'not_null' e teste de relação com outra tabela. `models/schema.yml`

![image](https://user-images.githubusercontent.com/37453518/165186887-d8794d3a-0ae8-4013-89f2-2436b16a5c54.png)

**Resultado:**

![image](https://user-images.githubusercontent.com/37453518/165187359-821998b1-9b45-45e0-ad7d-da0e0183c7a5.png)









![image](https://user-images.githubusercontent.com/37453518/165180098-4ca9776c-6efa-4800-8ba2-4f9e33c6364e.png)


![image](https://user-images.githubusercontent.com/37453518/165180682-81fbbaef-1211-456a-93f2-2c1407a02e57.png)

![image](https://user-images.githubusercontent.com/37453518/165180943-77ad717e-fd1e-400f-afc6-684aadde0623.png)
