-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT 
pe.id AS pedido_id, 
pe.status, 
pe.cliente_id, 
pr.id AS produto_id, 
pr.nome, 
pr.tipo, 
pr.preco, 
pr.pts_de_lealdade AS pontos_de_lealdade_do_produto 
FROM pedidos pe 
JOIN produtos_pedidos 
ON pe.id = produtos_pedidos.pedido_id 
JOIN produtos pr 
ON produtos_pedidos.produto_id=pr.id;

-- 2)
SELECT * FROM produtos WHERE produtos.nome ILIKE 'Fritas'; --Primeiro peguei o id do produto desejado para depois montar as querys abaixo:
SELECT pedidos.id FROM pedidos JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id WHERE produtos_pedidos.produto_id = 6;

-- 3)
SELECT clientes.nome AS gostam_de_fritas
FROM clientes 
JOIN pedidos 
ON pedidos.cliente_id = clientes.id 
JOIN produtos_pedidos ON produtos_pedidos.pedido_id = pedidos.id
JOIN produtos ON produtos.id = produtos_pedidos.produto_id 
WHERE produtos.id = 6;

-- 4)
SELECT SUM(produtos.preco)
FROM produtos
JOIN produtos_pedidos ON produtos_pedidos.produto_id = produtos.id
JOIN pedidos ON produtos_pedidos.pedido_id = pedidos.id
JOIN clientes ON pedidos.cliente_id = clientes.id
WHERE clientes.nome ILIKE('Laura');

-- 5)
SELECT produtos.nome, 
COUNT(produtos_pedidos.produto_id) 
FROM produtos 
JOIN produtos_pedidos 
ON produtos_pedidos.produto_id = produtos.id 
GROUP BY produtos.nome;


