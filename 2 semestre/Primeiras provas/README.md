
## Revisão PBE
### O que é NodeJS
- NodeJS é uma plataforma que permite a execução de código JavaScript no servidor
### O que é um servidor
- Um servidor é um programa instalado em um computador que fornece dados para outros computadores. Ex: Google, Facebook, Instagram, etc.
### Servidor HTTP
- É um servidor que fornece conexão através de um protocolo de Resposta a Requisições web para os navegadores. Ex: Apache, Nginx, IIS, etc.

|Servidores|Framework|
|-|:-:|
|Apache|PHP|
|Nginx|Ruby on Rails|
|IIS|.NET|
|Tomcat|Java|
|v8|NodeJS|

## Revisão BCD
### Maiores nuvens
- Amazon - AWS
- Google - GCP
- Microsoft - Azure

## Revisão BCD
### Bancos de dados relacionais x não-relacionais

- Bancos de dados relacionais são sistemas de gerenciamento de dados estruturados, baseados em tabelas, como MySQL ou Oracle.  Bancos de dados não-relacionais são sistemas de gerenciamento de dados que permitem armazenar e recuperar dados em formatos diferentes das tabelas tradicionais.  O MongoDB, um exemplo de NoSQL.
<p align="center">
<img src="https://media.dev.to/dynamic/image/width=1000,height=420,fit=cover,gravity=auto,format=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Farticles%2Fc2shxendqypzc1c1jj6t.jpg" style="width:500px">
</p>

### Normalização
- A normalização é um processo de organização de dados em um banco de dados que visa a evitar redundâncias e anomalias, e a garantir a integridade e consistência dos dados.

### Exemplo de SQL

```
drop database if exists escola;
create database escola;
use escola;

create table alunos(
    id int not null primary key auto_increment,
    nome varchar(100) not null,
    data_nascimento date not null,
    email varchar(100) not null
);

show tables;

insert into alunos values
(null,'Bia Vizeu', '2008-04-19', 'bia.vizeu.salles@gmail.com'),
(null,'Laila Casadei', '2007-07-20', 'lailacmacedo07@gmail.com'),
(null,'Milena Feliz', '2008-06-14', 'milena.felizebelo@gmail.com');


select * from alunos;
```

### Estrutura básica de um banco de dados relacional

- Dentro de cada tabela, você encontra vários registros. Cada registro contém informações sobre um único item, como um aluno específico, um livro específico ou um produto específico. Cada registro é dividido em campos. Cada campo armazena um tipo específico de informação sobre o item, como nome, idade, título, autor, preço, etc.

### O que é um entidade-relacionamento (DER)?
- O diagrama entidade-relacionamento (DER) é uma representação gráfica que mostra como as entidades se relacionam entre si em um banco de dados. Ele é como um mapa que ajuda a visualizar e entender a estrutura dos dados e como eles se conectam. O DER é essencial para a modelagem de bancos de dados, pois facilita a comunicação, ajuda a identificar erros, melhora a organização e simplifica o desenvolvimento, resultando em um banco de dados eficiente, organizado e fácil de entender. 

### DDL e DML
- O DDL é usado para definir a estrutura do banco de dados, como criar, modificar e remover tabelas, enquanto o DML é usado para manipular os dados dentro das tabelas, como inserir, atualizar, excluir e consultar dados. Imagine o DDL como a construção da base do seu banco de dados e o DML como a interação com os dados já armazenados.

    - Exemplos de comandos DDL:

        - CREATE TABLE: Cria uma nova tabela.
        - ALTER TABLE: Altera a estrutura de uma tabela existente.
        - DROP TABLE: Remove uma tabela.
        - CREATE INDEX: Cria um índice para acelerar consultas.
        - DROP INDEX: Remove um índice.

    - Exemplos de comandos DML:

        - INSERT INTO: Insere novos dados em uma tabela.
        - UPDATE: Altera dados existentes em uma tabela.
        - DELETE FROM: Remove dados de uma tabela.
        - SELECT: Consulta dados em uma tabela.