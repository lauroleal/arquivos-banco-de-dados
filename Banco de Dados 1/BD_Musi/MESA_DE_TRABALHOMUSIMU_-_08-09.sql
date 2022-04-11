USE MUSIMUNDOS;

-- 1
SELECT MAX(valor_total) FROM faturas WHERE cidade_cobranca = 'Oslo';
-- 2
SELECT MIN(valor_total) FROM faturas;
-- 3
SELECT AVG('valor_total') FROM faturas WHERE pais_cobranca = 'canada';

SELECT
	*
    FROM faturas;
    
SELECT AVG(valor_total) FROM faturas WHERE pais_cobranca = 'Canada';

SELECT COUNT(*) FROM faturas WHERE pais_cobranca = 'Canada';

SELECT SUM(valor_total) FROM faturas;

SELECT 
	id_cliente,
    data_fatura,
    valor_total
FROM faturas
WHERE valor_total < (SELECT AVG(valor_total) FROM faturas);

SELECT
	*
FROM empregados;

SELECT MAX(data_nascimento) FROM empregados;

SELECT MIN(data_nascimento) FROM empregados;

SELECT DATE_FORMAT(data_nascimento, "%d %b %Y") FROM empregados;

SELECT * FROM cancoes;

SELECT COUNT(*) FROM cancoes WHERE compositor = "AC/DC";

SELECT AVG(duracao_milisegundos) FROM cancoes;

SELECT AVG(bytes) FROM cancoes WHERE compositor = 'AC/DC';

SELECT * FROM clientes;

SELECT COUNT(*) FROM clientes WHERE cidade = 'São Paulo';

SELECT COUNT(*) FROM clientes WHERE cidade = 'Paris';

SELECT COUNT(*) FROM clientes WHERE email LIKE "%yahoo%";

-- GRUPO 7 - RODRIGO MELLO, LAURO LEAL, MICHELI PINHEIRO, WALYSSON SILVA, ANA PAULA GESSI
	
