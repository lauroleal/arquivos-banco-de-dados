USE emarket;

-- 1.1
CREATE VIEW VW_DETALHES_CLIENTE AS (
	SELECT
		ClienteID,
        Contato,
        Fax,
        Telefone
	FROM clientes		
);

-- 2.a Liste os números de telefone dos clientes que não possuem fax da tabela clientes.
SELECT ClienteID, Telefone, Fax
FROM clientes 
WHERE Fax = ' ';

-- 2.b Liste os números de telefone dos clientes que não possuem fax da view clientes.
SELECT ClienteID, Telefone, Fax
FROM VW_DETALHES_CLIENTE
WHERE Fax = ' ';

-- Crie uma view com os seguintes dados do fornecedor: Id, contato,
-- empresa e endereço. Para o endereço, pegue o endereço, cidade, código postal e país.
CREATE VIEW VW_DETALHES_FORNECEDOR AS (
	SELECT
		ProvedorID AS FornecedorID,
        Contato,
        Empresa,
        CONCAT(Endereco, ", ", Cidade, ", ", CodigoPostal, ", ", Pais) AS Endereco
	FROM provedores		
);

-- 2. Liste os fornecedores que moram na Avenida das Americanas, no Brasil. Faça de duas formas diferentes:
-- a. Consultando a tabela de fornecedores
SELECT ProvedorID AS FornecedorID, Endereco, Pais
FROM provedores
WHERE Endereco like '%Americanas%' and Pais like '%Brazil%';

-- 2. Liste os fornecedores que moram na Avenida das Americanas, no Brasil. Faça de duas formas diferentes:
-- b. Consultando a tabela de VIEW
SELECT FornecedorID, Endereco
FROM vw_detalhes_fornecedor 
WHERE Endereco like '%Americanas%' and Endereco like '%Brazil%'; 

-- 3.Crie uma view dos produtos que será usada ​​para controle de estoque. 
-- Inclua o id e nome do produto, preço unitário arredondado sem decimais, unidades em estoque e as unidades encomendadas. 
-- Inclua também uma nova coluna PRIORIDADE, com os seguintes valores:

 CREATE VIEW VW_ESTOQUE AS (
 SELECT 
 ProdutoID,
 ProdutoNome,
 format(PrecoUnitario, 0) AS Preco,
 UnidadesEstoque,
 UnidadesPedidas,
 CASE
 WHEN UnidadesPedidas = 0 THEN 'Baixa'
 WHEN UnidadesPedidas < UnidadesEstoque THEN 'Média'
 WHEN UnidadesPedidas < UnidadesEstoque * 2 THEN 'Urgente'
 ELSE 'Priotário'
 END AS 'Prioridade'
 FROM Produtos);

-- 2.  É necessário um relatório para identificar problemas de estoque. Utilizando a view criada no exercício anterior, indique, 
-- para cada prioridade, quantos produtos existem e seu preço médio. Não inclua prioridades para as que possuem menos de 5 produtos.

SELECT Prioridade, SUM(UnidadesEstoque), AVG(Preco)
FROM vw_estoque
GROUP BY Prioridade
HAVING COUNT(UnidadesEstoque) > 5;

