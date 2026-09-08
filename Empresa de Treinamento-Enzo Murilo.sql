#DDL
CREATE DATABASE empresa_treinamento;
USE empresa_treinamento;

CREATE TABLE Cursos (
    idcurso INT PRIMARY KEY NOT NULL,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    duracao INT NOT NULL
);

CREATE TABLE Instrutores (
    idinstrutor INT PRIMARY KEY NOT NULL,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(20)
);

CREATE TABLE Alunos (
    idaluno INT PRIMARY KEY NOT NULL,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(20)
);

CREATE TABLE Certificacoes_Instrutor (
    codigo_instrutor INT,
    modulo VARCHAR(100)
);

CREATE TABLE Alunos_Cursos (
    codigo_aluno INT,
    curso VARCHAR(100)
);


#DML

INSERT INTO Cursos VALUES (1, 'MySQL', 500.00, 5);
INSERT INTO Cursos VALUES (2, 'Lógica de Programação', 400.00, 10);
INSERT INTO Cursos VALUES (3, 'PHP', 300.00, 4);

INSERT INTO Instrutores VALUES (101, 'Carlos Silva', 'Rua A, 123', '11999991111');
INSERT INTO Instrutores VALUES (102, 'Ana Maria', 'Av B, 456', '11988882222');


INSERT INTO Alunos VALUES 
(201, 'João Souza', 'Rua X, 10', '11977773333'),
(202, 'Maria Oliveira', 'Rua Y, 20', '11966664444'),
(203, 'Pedro Santos', 'Rua Z, 30', '11955555555');


#DQL
DESC Instrutores;
DESC Alunos;

SELECT * FROM Cursos;
SELECT * FROM Instrutores;
SELECT * FROM Alunos;