/*As funções de agregação no MySQL executam cálculos 
em um conjunto de linhas e retornam um único valor como resultado

As mais utilizadas são:

COUNT(): Conta a quantidade de linhas ou registros.

SUM(): Soma os valores de uma coluna numérica.

AVG(): Calcula a média aritmética de uma coluna numérica.

MAX(): Retorna o maior valor.

MIN(): Retorna o menor valor.

Elas são frequentemente usadas junto com a cláusula GROUP BY para agrupar
resultados por categorias*/

CREATE DATABASE IF NOT EXISTS vendas_db3;
USE vendas_db3;

-- Criar a tabela de vendas
CREATE TABLE vendas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    vendedor VARCHAR(50),
    produto VARCHAR(50),
    quantidade INT,
    preco_unitario DECIMAL(10,2)
);

-- Inserindo dados de exemplo
INSERT INTO vendas (vendedor, produto, quantidade, preco_unitario) VALUES 
('Ana', 'Notebook', 2, 3500.00),
('Ana', 'Mouse', 5, 150.00),
('Bruno', 'Teclado', 3, 250.00),
('Bruno', 'Monitor', 1, 1200.00),
('Carlos', 'Mouse', 10, 140.00),
('Carlos', 'Teclado', 2, 260.00);


/* Usando funções de agregação de forma geral
Se quisermos saber estatisticas gerais de todos as vendas da loja*/
SELECT
	COUNT(*) AS total_vendas,
    SUM(quantidade * preco_unitario) AS faturamento_total,
    AVG(preco_unitario)AS preco_medio,
    ROUND(AVG(preco_unitario), 2) AS preco_medio, # Round ele arredonda o numero, o 2 serve para deixar apenas com duas casas decimais
    MAX(preco_unitario) AS maior_preco,
    MIN(preco_unitario) AS menor_preco
FROM vendas;
#------------------------------------------------------------------------------------------------

/*Usando funções de agregação  com GROUP BY
Geralmente, queremos agrupar essas informações.
Qual foi o faturamento total por vendedor*/

SELECT
	vendedor,
    COUNT(*) AS qtd_transacoes,
    SUM(quantidade * preco_unitario) AS total_vendido
FROM vendas
GROUP BY vendedor
ORDER BY preco_unitario DESC;

#-----------------------------------------------------------------------------------------------
/*Usando funções de agregação com where
Geralmente, queremos agrupar essas informações.
Qual foi o faturamento total do produto notebook*/

SELECT
	vendedor,
    SUM(quantidade * preco_unitario) AS total_notebook
FROM vendas
where produto = 'notebook';

#--------------------------------------------------------------------------

/*Usando o Having (Filtro para dados agregados)
Se quisermos filtrar apenas os vendedores que faturaram mais de R$ 2,000,00,
usamos o HAVING (o WHERE não funciona diretamente em cima de funções de agregação)*/

SELECT
	vendedor,
    SUM(quantidade * preco_unitario) AS total_vendido
FROM vendas
GROUP BY vendedor
HAVING SUM(quantidade * preco_unitario) > 2000.00;