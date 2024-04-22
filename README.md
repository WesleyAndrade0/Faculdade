# Descrição do Código SQL

Este repositório contém um conjunto de instruções SQL que cria várias views em um banco de dados. Cada view fornece uma visualização específica dos dados armazenados nas tabelas do banco de dados.

## Arquivos SQL

- `SQLite.2.sql`: Este arquivo contém as instruções SQL para criar as views.
  
## Views Criadas

1. **produtos_com_marcas**: Esta view mostra todos os produtos e suas respectivas marcas. Ela inclui informações como o ID do produto, nome do produto, quantidade em estoque, quantidade mínima em estoque, data de fabricação, se o produto é perecível, valor do produto e nome da marca.

2. **produtos_com_fornecedores**: Esta view exibe todos os produtos e seus respectivos fornecedores. Além das informações dos produtos, também inclui o ID do fornecedor, nome do fornecedor e e-mail do fornecedor.

3. **produtos_com_fornecedores_marcas**: Esta view mostra todos os produtos com suas marcas e fornecedores correspondentes. Ela combina informações das views `produtos_com_marcas` e `produtos_com_fornecedores`.

4. **produtos_com_estoque_baixo**: Esta view lista todos os produtos que têm estoque abaixo do mínimo. Inclui informações como ID do produto, nome do produto, quantidade em estoque, quantidade mínima em estoque, data de fabricação, se o produto é perecível, valor do produto e ID da marca.

5. **produtos_com_validade_vencida**: Esta view exibe todos os produtos cuja data de validade expirou. Inclui informações como ID do produto, nome do produto, data de validade e nome da marca.

6. **produtos_preco_acima_media**: Esta view lista todos os produtos com preço acima da média de todos os produtos no banco de dados. Inclui ID do produto, nome do produto, valor do produto e ID da marca.

## Uso

Para utilizar as views criadas, basta executar o script `criar_views.sql` em um ambiente de banco de dados compatível. As views estarão disponíveis para consulta e análise dos dados.

