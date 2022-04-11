/*
1. Crie um procedimento armazenado que solicite o nome de um país e uma cidade como parâmetros de entrada 
e retorne as informações de contato de todos os clientes naquele país e cidade como resultado. 
Caso o parâmetro cidade esteja vazio, todos os clientes do país indicado devem ser exibidos..

2. Invoque o procedimento para obter as informações dos clientes de Brasília, no Brasil.

3. Invoque o procedimento para obter as informações de todos os clientes no Brasil.
*/

USE musimundos;

-- ==============================================
-- 						EX.: 1
-- ==============================================
DELIMITER $$
CREATE PROCEDURE SP_CLIENTES_POR_CIDADE(IN paramPais VARCHAR(14), IN paramCidade VARCHAR(19))
BEGIN
	SELECT nome, sobrenome, endereco, cidade, telefone
    FROM clientes
    WHERE pais = paramPais and (cidade = paramCidade or paramCidade is null or paramCidade = '');
END $$

-- ==============================================
-- 						EX.: 2
-- ==============================================
CALL SP_CLIENTES_POR_CIDADE('Brazil', 'Brasilia');

-- ==============================================
-- 						EX.: 3
-- ==============================================
CALL SP_CLIENTES_POR_CIDADE('Brazil', '');
