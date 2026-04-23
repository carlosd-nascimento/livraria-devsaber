--QUERYS
--Total de Vendas por Vendedor: Esta consulta mostra o total de dinheiro que cada vendedor gerou:
SELECT v.nome_vendedor,
    SUM(venda.valor_total) AS total_vendas
FROM livraria_devsaber.vendas AS venda
JOIN livraria_devsaber.vendedores AS v
    ON venda.vendedor_id = v.vendedor_id
GROUP BY
    v.nome_vendedor
ORDER BY
    total_vendas DESC;

--Livros Mais Vendidos: Essa consulta lista os livros pela quantidade total de unidades vendidas.
SELECT livro.titulo, livro.autor,
    SUM(venda.quantidade) AS total_unidades_vendidas
FROM livraria_devsaber.vendas AS venda
JOIN livraria_devsaber.produtos AS livro
    ON venda.livro_id = livro.livro_id
GROUP BY
    livro.titulo, livro.autor
ORDER BY
    total_unidades_vendidas DESC;

--Clientes que Mais Gastaram: Essa consulta identifica os clientes que mais gastaram na sua livraria.
SELECT c.nome_cliente,
    SUM(venda.valor_total) AS total_gasto
FROM livraria_devsaber.vendas AS venda
JOIN livraria_devsaber.clientes AS c
    ON venda.cliente_id = c.cliente_id
GROUP BY
    c.nome_cliente
ORDER BY
    total_gasto DESC;

--Detalhes de Venda Completa: Esta consulta combina todas as tabelas para mostrar informações detalhadas de cada venda em um único resultado
SELECT vend.nome_vendedor, 
    c.nome_cliente, 
	li.titulo,
	li.valor_unitario,
	venda.valor_total,
	venda.quantidade,
	venda.data_venda
FROM livraria_devsaber.vendas AS venda
JOIN  livraria_devsaber.produtos AS li
    ON venda.livro_id = li.livro_id
JOIN livraria_devsaber.clientes AS c
    ON venda.cliente_id = c.cliente_id
JOIN livraria_devsaber.vendedores AS vend
    ON venda.vendedor_id = vend.vendedor_id
ORDER BY
    venda.data_venda DESC;

--CRIANDO VIEW 
--View para Detalhes de Vendas: Em vez de reescrever a consulta de "Detalhes de Venda Completa" toda vez, você pode salvá-la como uma View.
CREATE VIEW livraria_devsaber.vw_detalhes_vendas AS
SELECT venda.venda_id, 
    venda.data_venda,
    li.titulo AS titulo_livro,
    li.autor AS autor_livro,
    li.valor_unitario,
    venda.quantidade,
    venda.valor_total,
    c.nome_cliente,
    vend.nome_vendedor
FROM livraria_devsaber.vendas AS venda
JOIN livraria_devsaber.produtos AS li ON venda.livro_id = li.livro_id
JOIN livraria_devsaber.clientes AS c ON venda.cliente_id = c.cliente_id
JOIN livraria_devsaber.vendedores AS vend ON venda.vendedor_id = vend.vendedor_id;

--Como usar a View
SELECT * FROM livraria_devsaber.vw_detalhes_vendas;
