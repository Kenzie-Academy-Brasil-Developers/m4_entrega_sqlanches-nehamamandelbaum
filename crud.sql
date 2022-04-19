-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO clientes(nome, lealdade) VALUES ('Georgia', 0);
-- 2)
SELECT clientes.id FROM clientes WHERE clientes.nome = 'Georgia'; -- Query para pegar o ID do cliente que foi criado. 
INSERT INTO pedidos(status, cliente_id) VALUES ('Recebido', 6);
-- 3)
SELECT * FROM produtos; -- Query para pegar os produtos e seus IDs para poder adicionar na tabela produtos_pedidos.
SELECT * FROM pedidos WHERE pedidos.cliente_id = 6 --Query para pegar o ID do pedido que foi criado. 
INSERT INTO produtos_pedidos (pedido_id, produto_id) VALUES (6, 1), (6, 2), (6, 6), (6, 8), (6, 8);

-- Leitura

-- 1)
SELECT 
clientes.id AS cliente_id, 
clientes.nome AS nome_cliente, 
clientes.lealdade AS lealdade_cliente, 
pedidos.status AS status_pedido, 
pedidos.id AS pedido_id ,
produtos.nome AS nome_produto, 
produtos.tipo AS tipo_produto, 
produtos.preco AS preco_produto, 
produtos.pts_de_lealdade AS produto_pts_de_lealdade
FROM clientes 
JOIN pedidos ON pedidos.cliente_id = clientes.id
JOIN produtos_pedidos ON produtos_pedidos.pedido_id = pedidos.id
JOIN produtos ON produtos_pedidos.produto_id = produtos.id
WHERE clientes.nome ILIKE('Georgia');
-- Atualização

-- 1)
UPDATE clientes SET lealdade = 48 WHERE clientes.nome ILIKE 'Georgia' ;

-- Deleção

-- 1)
DELETE from clientes WHERE clientes.nome LIKE('Marcelo');


