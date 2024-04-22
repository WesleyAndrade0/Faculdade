CREATE TABLE marcas (
  mrc_id INT AUTO_INCREMENT PRIMARY KEY,
  mrc_nome VARCHAR(50) NOT NULL,
  mrc_nacionalidade VARCHAR(50)
);

CREATE TABLE produtos (
  prd_id INT AUTO_INCREMENT PRIMARY KEY,
  prd_nome VARCHAR(50) NOT NULL,
  prd_qtd_estoque INT NOT NULL DEFAULT 0,
  prd_estoque_min INT NOT NULL DEFAULT 0,
  prd_data_fabricacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Alterei para usar a data/hora atual
  prd_perecivel BOOLEAN,
  prd_valor DECIMAL(10, 2),
  prd_marca_id INT,
  CONSTRAINT fk_marcas FOREIGN KEY(prd_marca_id) REFERENCES marcas(mrc_id)
);

CREATE TABLE fornecedores (
  frn_id INT AUTO_INCREMENT PRIMARY KEY,
  frn_nome VARCHAR(50) NOT NULL,
  frn_email VARCHAR(50)
);

CREATE TABLE produto_fornecedor (
  pf_prod_id INT REFERENCES produtos(prd_id),
  pf_forn_id INT REFERENCES fornecedores(frn_id),
  PRIMARY KEY (pf_prod_id, pf_forn_id)
);