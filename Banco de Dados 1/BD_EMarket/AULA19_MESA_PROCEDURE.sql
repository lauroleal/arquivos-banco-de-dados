use emarket;

/*
1) Empregados
Crie uma SP que liste os sobrenomes e nomes dos empregados, ordenados alfabeticamente.
Invoque a SP para verificar o resultado.

*/

DELIMITER $$ 
CREATE PROCEDURE GET_NOME()
BEGIN
		select sobrenome, nome from empregados order by Sobrenome and nome asc;
END
$$

CALL GET_NOME;


/*
2) Empregados por cidade
Crie uma SP que leva o nome de uma cidade e lista os funcionários dessa cidade
Invoque a SP para listar os empregados de Seattle.
*/

DELIMITER $$
CREATE PROCEDURE GET_FUNC_CIDADE(IN PARAM_NOME_CIDADE VARCHAR(50))
BEGIN
SELECT * FROM EMPREGADOS WHERE CIDADE = PARAM_NOME_CIDADE;
END
$$

CALL GET_FUNC_CIDADE("SEATTLE");


/*
3) Clientes por país
Crie uma SP que recebe o nome de um país e retorne o número de clientes naquele país.
Invoque a SP para consultar a quantidade de clientes de Portugal.
*/
DELIMITER $$
CREATE PROCEDURE CLIENTE_PAIS(IN PARAM_NOME_PAIS VARCHAR(50))
BEGIN
SELECT COUNT(*) AS 'CLIENTE/PAIS' FROM CLIENTES where pais = PARAM_NOME_PAIS;
END
$$
CALL CLIENTE_PAIS("PORTUGAL");

DELIMITER $$
CREATE PROCEDURE CLIENTE_PAIS(IN PARAM_NOME_PAIS VARCHAR(50))
BEGIN
SELECT COUNT(CONTATO) AS 'CLIENTE/PAIS' FROM CLIENTES GROUP BY pais having pais = PARAM_NOME_PAIS;
END
$$
CALL CLIENTE_PAIS("PORTUGAL");


/*
4) Produtos sem estoque
Crie uma SP que receba um número e liste os produtos cujo estoque está abaixo desse número. 
O resultado deve mostrar o nome do produto, o Estoque atual e o nome da categoria à qual o produto pertence.
Liste os produtos com menos de 10 unidades no estoque;
Liste os produtos sem estoque.
*/
DELIMITER $$
CREATE PROCEDURE ESTOQUE(IN NUMERO INT)
BEGIN

IF(NUMERO > 0) THEN
select produtonome , categorias.categorianome , UnidadesEstoque
from produtos 
inner join categorias on categorias.CategoriaID = produtos.CategoriaID
where UnidadesEstoque < NUMERO ;

ELSEIF(NUMERO = 0) THEN
select produtonome , categorias.categorianome , UnidadesEstoque
from produtos 
inner join categorias on categorias.CategoriaID = produtos.CategoriaID
where UnidadesEstoque = NUMERO ;

END IF;
END
$$

CALL ESTOQUE(0);

/*
5) Vendas com desconto
Crie uma SP que receba uma porcentagem e lista os nomes dos produtos que foram vendidos com desconto igual ou superior ao valor indicado, 
indicando, também,  o nome do cliente a quem foi vendido.
Liste as informações dos produtos que foram vendidos com um desconto superior a 10%.

*/
DELIMITER $$
CREATE PROCEDURE GET_DESCONTO(IN PARAM_PORCENTAGEM DOUBLE)
BEGIN

set @PORCENTAGEM = PARAM_PORCENTAGEM / 100;


SELECT C.CONTATO, P.PRODUTONOME, CONCAT(FORMAT((DET.DESCONTO  * 100),0), " %" ) as PORCENTAGEM , DET.PRECOUNITARIO AS PRECO_DESCONTO FROM PRODUTOS AS P
INNER JOIN DETALHEFATURA AS DET
ON P.PRODUTOID = DET.PRODUTOID

INNER JOIN FATURAS AS F 
ON F.FATURAID = DET.FATURAID

INNER JOIN CLIENTES AS C 
ON C.CLIENTEID = F.CLIENTEID
WHERE DET.Desconto >= @PORCENTAGEM; 

END
$$

CALL GET_DESCONTO(10);




 
