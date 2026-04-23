--Criação do database:
CREATE DATABASE livraria_devsaber;

--Criando as tabelas do DATABASE:
CREATE TABLE livraria_devsaber.produtos (
	livro_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    serie VARCHAR(255),
    genero VARCHAR(100),
    valor_unitario DECIMAL(10,2) NOT NULL
);
CREATE TABLE livraria_devsaber.clientes (
	cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(255) NOT NULL,
    cidade VARCHAR(255),
    email VARCHAR(255)
);
CREATE TABLE livraria_devsaber.vendedores (
	vendedor_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_vendedor VARCHAR(255) NOT NULL
);
CREATE TABLE livraria_devsaber.vendas (
	venda_id INT AUTO_INCREMENT PRIMARY KEY,
    livro_id INT,
    cliente_id INT,
    vendedor_id INT,
    data_venda DATE NOT NULL,
    quantidade INT NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (livro_id) REFERENCES produtos(livro_id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (vendedor_id) REFERENCES vendedores(vendedor_id)
);