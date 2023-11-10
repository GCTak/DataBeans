# Projeto Final de Banco de Dados - DataBeans

Este projeto é parte da disciplina de Banco de Dados 2 do curso de Engenharia de Computação da Universidade de Uberaba (Uniube) Campus Uberlândia e tem como objetivo criar um banco de dados que simula uma LanHouse com uma lanchonete interna.

## Ordem de Execução dos Códigos - 1º Momento

Certifique-se de seguir esta ordem de execução dos códigos para construir o banco de dados:

1. **DMLWHILE (Data Manipulation Language para a LanHouse)**: Esta etapa se concentra em inserir, atualizar e excluir dados relacionados à gestão da LanHouse. Você pode criar arquivos SQL específicos para essas tarefas.

2. **DML (Data Manipulation Language para a Lanchonete)**: Aqui, você trabalhará com operações de inserção, atualização e exclusão de dados relacionados à gestão da lanchonete dentro da LanHouse. Novamente, crie arquivos SQL dedicados para essas tarefas.

## Ordem de Execução dos Códigos - 2º Momento
Ao seguir esta ordem de execução, você garantirá que as relações entre as tabelas reflitam a herança corretamente e facilitem a gestão dos dados de Clientes e Funcionários.

1. **CREATE DATABASE**: Primeiro você irá criar o banco de dados, ou seja, somente executar a segunda linha do arquivo DDL.sql.
2. **HERANÇA**: Depois, você irá criar a estrutura de herança para modelar diferentes tipos de entidades no seu banco de dados. A herança é uma técnica de modelagem de dados que permite que entidades compartilhem características comuns, enquanto também possuem características específicas.

   - **Tabela Base (Pessoa)**: É criada uma tabela base chamada "Pessoa", que contém as características comuns a todas as entidades, como nome, data de nascimento, endereço, etc.

   - **Tabelas Secundárias (Cliente e Funcionário)**: São criadas tabelas secundárias, como "Cliente" e "Funcionário", que herdam da tabela "Pessoa". Cada uma dessas tabelas secundárias possui suas próprias características específicas. A coluna "TipoEntidade" é usada para identificar o tipo de entidade (Cliente ou Funcionário).

   - Isso permite que você compartilhe dados comuns, como nome e endereço, entre Cliente e Funcionário, ao mesmo tempo em que mantém características específicas, como "Cargo" para Funcionário.

3. **DDL(Data Definition Language)**: Após a criação da estrutura de herança, você pode prosseguir com a criação das demais tabelas do banco de dados. Uma vez que essas tabelas podem agora fazer referência às tabelas Cliente e Funcionário.

4. **PROCEDURE**: Neste arquivo constam duas programações a PROCEDURE em si e a TRIGGER, execute-as separadamente.
   
5. **DML2MOMENTO(DataManipulation Language**: Executando esse código você preencherá o banco de dados com dados fícticios.

**OBSERVAÇÃO**
   Caso prefira pular os passos 2 e 3 execute o  arquivo DDLCOMPLETO.

## Requisitos

Para executar este projeto, você precisará atender aos seguintes requisitos:

- **SQL Server**: É necessário ter o SQL Server instalado. Você pode baixá-lo em [SQL Server Downloads](https://www.microsoft.com/en-us/sql-server/sql-server-downloads).

## Contato

Se você tiver alguma dúvida ou precisar de suporte, sinta-se à vontade para entrar em contato conosco em [eng.takingami@gmail.com].

---
© 2023 
