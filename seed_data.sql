--Inserindo dados nas tabelas:
INSERT INTO livraria_devsaber.produtos (livro_id, titulo, autor, serie, genero, valor_unitario) 
VALUES (1, 'O Guia do Mochileiro das Galáxias', 'Douglas Adams', 'O Guia do Mochileiro das Galáxias', 'Ficção Científica', 45.50),
(2, 'A Cor da Magia', 'Terry Pratchett', 'Discworld', 'Fantasia', 39.90),
(3, '1984', 'George Orwell', NULL, 'Distopia', 29.99),
(4, 'O Hobbit', 'J.R.R. Tolkien', 'O Senhor dos Anéis', 'Fantasia', 55.00),
(5, 'Neuromancer', 'William Gibson', 'Sprawl', 'Cyberpunk', 48.75),
(6, 'Duna', 'Frank Herbert', 'Duna', 'Ficção Científica', 62.10),
(7, 'Fundação', 'Isaac Asimov', 'Fundação', 'Ficção Científica', 40.00),
(8, 'As Crônicas de Nárnia', 'C.S. Lewis', 'As Crônicas de Nárnia', 'Fantasia', 72.50),
(9, 'Admirável Mundo Novo', 'Aldous Huxley', NULL, 'Distopia', 44.90),
(10, 'O Senhor dos Anéis: A Sociedade do Anel', 'J.R.R. Tolkien', 'O Senhor dos Anéis', 'Fantasia', 59.90);

INSERT INTO livraria_devsaber.clientes (cliente_id, nome_cliente, cidade, email)
VALUES (101, 'Ana Silva', 'São Paulo', 'ana.silva@email.com'),
(102, 'Bruno Costa', 'Rio de Janeiro', 'bruno.costa@email.com'),
(103, 'Carla Souza', 'Belo Horizonte', 'carla.souza@email.com'),
(104, 'Daniel Pereira', 'Curitiba', 'daniel.pereira@email.com'),
(105, 'Eduardo Lima', 'Porto Alegre', 'eduardo.lima@email.com'),
(106, 'Fernanda Torres', 'Salvador', 'fernanda.torres@email.com'),
(107, 'Gabriel Martins', 'Fortaleza', 'gabriel.martins@email.com'),
(108, 'Helena Almeida', 'Recife', 'helena.almeida@email.com'),
(109, 'Igor Fernandes', 'Brasília', 'igor.fernandes@email.com'),
(110, 'Juliana Castro', 'Manaus', 'juliana.castro@email.com');

INSERT INTO livraria_devsaber.vendedores (vendedor_id, nome_vendedor) 
VALUES (201, 'João Santos'),
(202, 'Maria Oliveira'),
(203, 'Pedro Lima'),
(204, 'Lucas Rocha');

INSERT INTO livraria_devsaber.vendas (venda_id, livro_id, cliente_id, vendedor_id, data_venda, quantidade, valor_total) 
VALUES (1001, 1, 101, 201, '2024-05-10', 1, 45.50),
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
