Bem vindo à entrega do desafio do time de dados tratados.

# Proposta para entrega

Além de entregar as queries que respondem as perguntas, me aprofundei no que **me parece** fazer parte da rotina do pessoal de dados tratados. Como o Dataform não está acessível, usei o DBT que, se não me engano, é similar.


# Sources

Primeiramente, temos dois 'sources', CTEs efêmeros que fazem o primeiro contato com as tabelas do 'dataset' público **crypto_ethereum**, neles:
- Selecionei apenas colunas que achei necessárias
- Renomeei colunas


![image](https://user-images.githubusercontent.com/37453518/165271849-572daecb-71f7-449b-b9a4-d9a2eac404d1.png)
![image](https://user-images.githubusercontent.com/37453518/165271661-988aaf0f-e58c-421b-be76-ef10f4940e4a.png)
![image](https://user-images.githubusercontent.com/37453518/165272549-11b83a47-7d50-412c-b5ad-3f731f7ff04c.png)

# Tabelas de fatos

Temos 3 tabelas de fatos que consome as 'sources'. Para os blocos, contratos e as duas mescladas para quando existem contratos em blocos, ou seja, um INNER JOIN em `block_number`.
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



# Análises

Estes arquivos são apenas compilados para que sejam feitas as consultas com eles posterioremente, eles não são materializados. 



## 1. Quantos contratos (tokens) estão sendo criados por bloco?

![image](https://user-images.githubusercontent.com/37453518/165278560-c455537a-3cd3-44ed-a7f2-bf01d23380fd.png)

![image](https://user-images.githubusercontent.com/37453518/165187359-821998b1-9b45-45e0-ad7d-da0e0183c7a5.png)


## 2. Quantos blocos estão sendo criados em um dia?
Para isso, optei por fazer uma VIEW e a categorizei como MART, já que este agrupamento poderia ser usado por outras queries de um mesmo time de negócios.

![image](https://user-images.githubusercontent.com/37453518/165280067-5296c6b8-6dfb-40cb-ae90-802a63188630.png)
![image](https://user-images.githubusercontent.com/37453518/165280293-2c2f03f8-d5dd-40ad-b936-2f599eb9cf1f.png)


E tirei a média do total de blocos criados por dia.

![image](https://user-images.githubusercontent.com/37453518/165280686-f22149d9-1c4a-4eb6-b0c1-5963a4d7e8e6.png)


## 3. Em relação aos últimos 15 dias, qual foi a variação na quantidade de blocos contendo tokens em um dia?
Como o INNER JOIN da tabela só possibilita blocos que contenham tokens, basta apenas análise do agrupamento dos últimos 15 dias.

![image](https://user-images.githubusercontent.com/37453518/165282362-582b1a43-96b3-4405-a1aa-81a84ae807cd.png)

## 4. Qual o bloco que gerou contratos (tokens) e utilizou mais taxa (gas)? Informar o nome de todos os tokens contidos neste bloco.

![image](https://user-images.githubusercontent.com/37453518/165281494-f6044d17-46df-4ace-96a3-243bca4a6184.png)

![image](https://user-images.githubusercontent.com/37453518/165282473-84e11197-453b-4cba-a540-e033482b3e8b.png)


### Agendamento

![image](https://user-images.githubusercontent.com/37453518/165180098-4ca9776c-6efa-4800-8ba2-4f9e33c6364e.png)

![image](https://user-images.githubusercontent.com/37453518/165180682-81fbbaef-1211-456a-93f2-2c1407a02e57.png)

![image](https://user-images.githubusercontent.com/37453518/165180943-77ad717e-fd1e-400f-afc6-684aadde0623.png)
