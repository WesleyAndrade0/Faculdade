--Crie uma view que mostra todos os produtos e suas respectivas marcas

CREATE or replace VIEW produtos_com_marcas AS
SELECT 
    p.prd_id,
    p.prd_nome,
    p.prd_qtd_estoque,
    p.prd_estoque_min,
    p.prd_data_fabricacao,
    p.prd_perecivel,
    p.prd_valor,
    m.mrc_nome AS marca
FROM 
    produtos p
JOIN 
    marcas m ON p.prd_marca_id = m.mrc_id;


-- Crie uma view que mostra todos os produtos e seus respectivos fornecedores

CREATE or replace VIEW produtos_com_fornecedores AS
SELECT 
    p.prd_id,
    p.prd_nome,
    p.prd_qtd_estoque,
    p.prd_estoque_min,
    p.prd_data_fabricacao,
    p.prd_perecivel,
    p.prd_valor,
    f.frn_id AS fornecedor_id,
    f.frn_nome AS fornecedor_nome,
    f.frn_email AS fornecedor_email
FROM 
    produtos p
JOIN 
    produto_fornecedor pf ON p.prd_id = pf.pf_prod_id
JOIN 
    fornecedores f ON pf.pf_forn_id = f.frn_id;


-- Crie uma view que mostra todos os produtos e seus respectivos fornecedores e marcas

CREATE or replace VIEW produtos_com_fornecedores_marcas AS
SELECT 
    p.prd_id,
    p.prd_nome,
    p.prd_qtd_estoque,
    p.prd_estoque_min,
    p.prd_data_fabricacao,
    p.prd_perecivel,
    p.prd_valor,
    m.mrc_id AS marca_id,
    m.mrc_nome AS marca_nome,
    f.frn_id AS fornecedor_id,
    f.frn_nome AS fornecedor_nome,
    f.frn_email AS fornecedor_email
FROM 
    produtos p
JOIN 
    produto_fornecedor pf ON p.prd_id = pf.pf_prod_id
JOIN 
    fornecedores f ON pf.pf_forn_id = f.frn_id
JOIN 
    marcas m ON p.prd_marca_id = m.mrc_id;

-- Crie uma view que mostra todos os produtos com estoque abaixo do mínimo

CREATE or replace VIEW produtos_com_estoque_baixo AS
SELECT 
    prd_id,
    prd_nome,
    prd_qtd_estoque,
    prd_estoque_min,
    prd_data_fabricacao,
    prd_perecivel,
    prd_valor,
    prd_marca_id
FROM 
    produtos
WHERE 
    prd_qtd_estoque < prd_estoque_min;


-- Adicione o campo data de validade. Insira novos produtos com essa informação
ALTER TABLE produtos
ADD COLUMN prd_data_validade DATE;

INSERT INTO produtos (prd_nome, prd_qtd_estoque, prd_estoque_min, prd_data_fabricacao, prd_perecivel, prd_valor, prd_marca_id, prd_data_validade)
VALUES
    ('Produto A', 100, 50, '2024-04-22', 1, 10.99, 1, '2024-12-31'),
    ('Produto B', 50, 20, '2024-04-20', 1, 15.99, 2, '2025-06-30'),
    ('Produto C', 200, 100, '2024-04-18', 0, 5.99, 1, NULL);
    
    
-- Crie uma view que mostra todos os produtos e suas respectivas marcas com validade vencida


    CREATE or replace VIEW produtos_com_validade_vencida AS
SELECT 
    p.prd_id,
    p.prd_nome,
    p.prd_data_validade,
    m.mrc_nome AS marca_nome
FROM 
    produtos p
JOIN 
    marcas m ON p.prd_marca_id = m.mrc_id
WHERE 
    p.prd_data_validade IS NOT NULL
    AND p.prd_data_validade < CURDATE();

--Selecionar os produtos com preço acima da média

CREATE or replace VIEW produtos_preco_acima_media AS
SELECT 
    prd_id,
    prd_nome,
    prd_valor,
    prd_marca_id
FROM 
    produtos
WHERE 
    prd_valor > (
        SELECT AVG(prd_valor) 
        FROM produtos
    );
