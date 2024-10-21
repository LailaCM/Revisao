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
