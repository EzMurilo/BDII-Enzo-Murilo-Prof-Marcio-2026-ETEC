#criar banco de dados
/* nome do banco: primeiro teste
data: 11/08/2026
hora: 19:43
local: lab 04
programadores: Enzo Murilo de Souza Correia
*/
/*conjuntos ddl
sintaxe-create database <nome do banco de dados>*/
create database teste;
/*acessar o banco de dados
use <nome do banco de dados>*/
use teste;
#criar tabela cadastro
create table cadastro(
idcad int not null primary key, #idcad: a chave primaria da tabela cadastro
nome varchar(50) not null, #nome: varchar 50, para o usuario inserir seu nome
depto char(4) not null, #dpto: char 4, ele obrigatoriamente vai armazenar 4 bites na memeoria
funcao char(20),
filhos int,
salario decimal(10,2)
);
#comando para verificar a estrutura da tabela
#desc <nome da tabela>
desc cadastro;

#conjuntos dql
#sintaxe select <campos> from <tabela>
select * from cadastro
