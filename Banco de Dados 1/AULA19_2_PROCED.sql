/*
1. Crie um procedimento armazenado que receba um nome de gênero musical como parâmetro e o insira na tabela
 de gêneros.
Além disso, o procedimento armazenado deve retornar o ID de gênero que foi inserido.
Obs! Para calcular o novo id, inclua a seguinte linha dentro do bloco de código da SP:
SET novoid = (SELECT MAX(id) FROM generos) + 1;

2. Invoque a stored procedure criada para inserir o gênero Funk. 
Qual id a SP retornou? Consulte a tabela de gêneros para ver as mudanças. 

3. Repita a etapa anterior inserindo, desta vez, o gênero Tango.
*/ 

USE musimundos;

-- ==============================================
-- 						EX.: 1
-- ==============================================
DELIMITER $$
CREATE PROCEDURE SP_ADICIONAR_GENERO_MUSICAL(IN paramNomeGenero VARCHAR(18), out saidaGeneroInserido INT)
BEGIN
	SET saidaGeneroInserido = (SELECT MAX(id) FROM generos) + 1;
	INSERT INTO generos (id, nome) VALUES(saidaGeneroInserido ,paramNomeGenero);
END $$

-- ==============================================
-- 						EX.: 2
-- ==============================================
CALL SP_ADICIONAR_GENERO_MUSICAL('Funk', @saidaGeneroInserido);
SELECT * FROM generos;
SELECT @saidaGeneroInserido;

-- ==============================================
-- 						EX.: 3
-- ==============================================
CALL SP_ADICIONAR_GENERO_MUSICAL('Tango', @saidaGeneroInserido);
SELECT * FROM generos;
SELECT @saidaGeneroInserido;