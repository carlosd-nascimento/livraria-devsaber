-- Projeto Original: BigQuery
-- Criando o schema para a livraria DevSaber
CREATE SCHEMA t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber 
OPTIONS (
  description = "Mini projeto para treinamento da Turma de Dados 2",
  location = "US"
);

-- Tabela para os Livros
CREATE TABLE `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.Produtos`(
    livro_id INT,
    titulo STRING (255) NOT NULL,
    autor STRING (255) NOT NULL,
    serie STRING (255),
    genero STRING (100),
    valor_unitario FLOAT64 NOT NULL
);

-- Tabela para os Clientes
CREATE TABLE `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.Clientes`
(
    cliente_id INT,
    nome_cliente STRING (255) NOT NULL,
    cidade STRING (255),
    email STRING(255)
);

-- Tabela para os Vendedores
CREATE TABLE Vendedores (
    vendedor_id INT,
    nome_vendedor STRING(255) NOT NULL
);

-- Tabela de Vendas (para registrar as transações)
CREATE TABLE `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.Vendas` (
    venda_id INT64 NOT NULL,
    livro_id INT64,
    cliente_id INT64,
    vendedor_id INT64,
    data_venda DATE NOT NULL,
    quantidade INT64 NOT NULL,
    valor_total NUMERIC NOT NULL,
    CONSTRAINT pk_vendas PRIMARY KEY(venda_id) NOT ENFORCED,
    CONSTRAINT fk_vendas_livros FOREIGN KEY(livro_id) REFERENCES `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.Produtos`(livro_id) NOT ENFORCED,
    CONSTRAINT fk_vendas_clientes FOREIGN KEY(cliente_id) REFERENCES `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.Clientes`(cliente_id) NOT ENFORCED,
    CONSTRAINT fk_vendas_vendedores FOREIGN KEY(vendedor_id) REFERENCES `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.Vendedores`(vendedor_id) NOT ENFORCED
);

-- Inserindo dados
INSERT INTO Clientes (cliente_id, nome_cliente, cidade, email) VALUES
(101, 'Ana Silva', 'São Paulo', 'ana.silva@email.com'),
(102, 'Bruno Costa', 'Rio de Janeiro', 'bruno.costa@email.com'),
(103, 'Carla Souza', 'Belo Horizonte', 'carla.souza@email.com'),
(104, 'Daniel Pereira', 'Curitiba', 'daniel.pereira@email.com'),
(105, 'Eduardo Lima', 'Porto Alegre', 'eduardo.lima@email.com'),
(106, 'Fernanda Torres', 'Salvador', 'fernanda.torres@email.com'),
(107, 'Gabriel Martins', 'Fortaleza', 'gabriel.martins@email.com'),
(108, 'Helena Almeida', 'Recife', 'helena.almeida@email.com'),
(109, 'Igor Fernandes', 'Brasília', 'igor.fernandes@email.com'),
(110, 'Juliana Castro', 'Manaus', 'juliana.castro@email.com');

INSERT INTO `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.Produtos` (livro_id, titulo, autor, serie, genero, valor_unitario) VALUES
(1, 'O Guia do Mochileiro das Galáxias', 'Douglas Adams', 'O Guia do Mochileiro das Galáxias', 'Ficção Científica', 45.50),
(2, 'A Cor da Magia', 'Terry Pratchett', 'Discworld', 'Fantasia', 39.90),
(3, '1984', 'George Orwell', NULL, 'Distopia', 29.99),
(4, 'O Hobbit', 'J.R.R. Tolkien', 'O Senhor dos Anéis', 'Fantasia', 55.00),
(5, 'Neuromancer', 'William Gibson', 'Sprawl', 'Cyberpunk', 48.75),
(6, 'Duna', 'Frank Herbert', 'Duna', 'Ficção Científica', 62.10),
(7, 'Fundação', 'Isaac Asimov', 'Fundação', 'Ficção Científica', 40.00),
(8, 'As Crônicas de Nárnia', 'C.S. Lewis', 'As Crônicas de Nárnia', 'Fantasia', 72.50),
(9, 'Admirável Mundo Novo', 'Aldous Huxley', NULL, 'Distopia', 44.90),
(10, 'O Senhor dos Anéis: A Sociedade do Anel', 'J.R.R. Tolkien', 'O Senhor dos Anéis', 'Fantasia', 59.90);

INSERT INTO Vendedores (vendedor_id, nome_vendedor) VALUES
(201, 'João Santos'),
(202, 'Maria Oliveira'),
(203, 'Pedro Lima'),
(204, 'Lucas Rocha');

INSERT INTO Vendas (venda_id, livro_id, cliente_id, vendedor_id, data_venda, quantidade, valor_total) VALUES
(1001, 1, 101, 201, '2024-05-10', 1, 45.50),
(1002, 3, 102, 202, '2024-05-11', 2, 59.98),
(1003, 4, 101, 201, '2024-05-12', 1, 55.00),
(1004, 2, 103, 203, '2024-05-13', 1, 39.90),
(1005, 5, 104, 202, '2024-05-14', 1, 48.75),
(1006, 6, 102, 201, '2024-05-15', 1, 62.10),
(1007, 2, 105, 203, '2024-05-16', 1, 39.90),
(1008, 7, 106, 201, '2024-05-17', 3, 120.00),
(1009, 1, 107, 202, '2024-05-18', 2, 91.00),
(1010, 8, 108, 204, '2024-05-19', 1, 72.50),
(1011, 3, 109, 204, '2024-05-20', 4, 119.96),
(1012, 5, 110, 202, '2024-05-21', 1, 48.75);

-- CONSULTAS
-- 1. Total de vendas por vendedor
SELECT
    v.nome_vendedor,
    SUM(venda.valor_total) AS total_vendas
FROM
   `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.Vendas` AS venda
JOIN
  `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.Vendedores` AS v
    ON venda.vendedor_id = v.vendedor_id
GROUP BY
    v.nome_vendedor
ORDER BY
    total_vendas DESC;

-- 2. Total de unidades vendidas por livro
SELECT
    Livros.titulo,
    Livros.autor,
    SUM(Vendas.quantidade) AS total_unidades_vendidas
FROM
  `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.Vendas` AS Vendas
JOIN
  `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.Produtos` AS Livros
    ON Vendas.livro_id = Livros.livro_id
GROUP BY
    Livros.titulo,
    Livros.autor
ORDER BY
    total_unidades_vendidas DESC;

-- 3. Total gasto por cliente
SELECT
    c.nome_cliente,
    SUM(v.valor_total) AS total_gasto
FROM
  `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.Vendas` AS v
JOIN
  `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.Clientes` AS c
    ON v.cliente_id = c.cliente_id
GROUP BY
    c.nome_cliente
ORDER BY
    total_gasto DESC;

-- 4. Detalhes das vendas (incluindo nome do vendedor, nome do cliente, título do livro, valor unitário, valor total, quantidade e data da venda)
SELECT
  v.nome_vendedor,
  c.nome_cliente,
  l.titulo,
  l.valor_unitario,
  venda.valor_total,
  venda.quantidade,
  venda.data_venda
FROM
  `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.Vendas` AS venda
JOIN
  `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.Produtos` AS l
    ON venda.livro_id = l.livro_id
JOIN
  `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.Clientes` AS c
    ON venda.cliente_id = c.cliente_id
JOIN
  `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.Vendedores` AS v
    ON venda.vendedor_id = v.vendedor_id
ORDER BY
    venda.data_venda DESC;

-- 5. Criando uma view para o desempenho dos vendedores
CREATE VIEW `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.view_desempenho_func` AS
SELECT
  v.nome_vendedor,
  SUM(venda.valor_total) AS desempenho_func
FROM 
  `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.Vendas` AS venda
JOIN 
  `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.Vendedores` AS v
    ON venda.vendedor_id = v.vendedor_id
GROUP BY 
  nome_vendedor
ORDER BY
  desempenho_func DESC;

-- 6. Criando uma view para o desempenho dos vendedores
CREATE VIEW `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.view_desempenho_func` AS
SELECT
  v.nome_vendedor,
  SUM(venda.valor_total) AS desempenho_func
FROM 
  `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.Vendas` AS venda
JOIN 
  `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.Vendedores` AS v
    ON venda.vendedor_id = v.vendedor_id
GROUP BY 
  nome_vendedor
ORDER BY
  desempenho_func DESC;

--Como usar a View
SELECT * FROM `t1engenhariadados.Turma_2_Grupo7_Livraria_DevSaber.view_desempenho_func`;
