-- URL IMAGEM ESTA NULO POIS É NECESSÁRIO BUSCAR UMA IMAGEM NA INTERNET (KKK)
INSERT INTO CATEGORIA(NOME, URL_IMAGEM)
VALUES
('Pratos', NULL),
('Lanches', NULL),
('Sobremesas', NULL),
('Bebidas', NULL);

INSERT INTO PRODUTOS(ID_CATEGORIA, NOME, DESCRICAO, IMAGEM,VALOR)
VALUES
(2, 'Big Mac', 'Queijo, hamburguer, alface, molho especial, cebola picles, pão com gergelim', NULL, 10.00),
(4, 'Coca cola', 'Coca cola lata', NULL, 5.00);