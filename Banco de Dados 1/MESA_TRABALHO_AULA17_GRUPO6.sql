-- CLIENTES 

-- 1
create view vw_cliente as (
	select 
		ClienteID, 
        Contato, 
        Fax, 
        Telefone 
	from Clientes
);


-- 2

    select Telefone from Clientes 
		where Fax = '';

	select Telefone from vw_cliente 
    where Fax = '';
    
  -- FORNECEDORES  
  
  -- 1
	create view vw_fornecedores as (
		select 
			ProvedorID, 
            Contato, 
            Empresa, 
            Endereco, 
            Cidade, 
            CodigoPostal, 
            Pais
		from Provedores
    );
    
-- 2

	select * from Provedores
    where Endereco = 'Av. das Americanas 12.890';
    

	select * from vw_fornecedores 
    where Endereco = 'Av. das Americanas 12.890';
    


-- DESAFIO

-- 1	
  CREATE VIEW vw_produtos AS
    (SELECT 
        ProdutoID,
        ProdutoNome,
        ROUND(PrecoUnitario),
        UnidadesEstoque,
        UnidadesPedidas,
        CASE
            WHEN UnidadesPedidas = 0 THEN 'Baixa'
            WHEN UnidadesPedidas < UnidadesEstoque THEN 'Média'
            WHEN UnidadesPedidas < UnidadesEstoque * 2 THEN 'Urgente'
            ELSE 'Priotário'
        END AS 'Prioridade'
    FROM
        Produtos);
    
 -- 2   
    SELECT 
    Prioridade,
    COUNT(ProdutoID) AS 'Quantidade Produtos',
    AVG(Preco) AS 'Custo Médio'
FROM
    vw_produtos  
GROUP BY Prioridade
HAVING COUNT(ProdutoID) > 5;
    
    
	






