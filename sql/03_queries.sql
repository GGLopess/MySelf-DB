USE myself_tickets_db;

SELECT e.nome_evento, e.data_hora, l.nome_local, l.bairro
FROM eventos e
INNER JOIN locais l ON e.id_local = l.id_local;

SELECT ti.setor, ti.lote, ti.preco, ti.quantidade_disponivel
FROM tipos_ingresso ti
INNER JOIN eventos e ON ti.id_evento = e.id_evento
WHERE e.nome_evento = 'MYSELF x ECHO DIMENSIONAL FUTURE';

SELECT id_pedido, data_pedido, valor_total, status_pagamento
FROM pedidos
WHERE status_pagamento = 'Aprovado'
ORDER BY valor_total DESC;

SELECT nome_evento, tipo_evento, data_hora
FROM eventos
WHERE nome_evento LIKE '%WEB%';

SELECT SUM(valor_total) AS faturamento_total_myself
FROM pedidos
WHERE status_pagamento = 'Aprovado';

SELECT c.nome, SUM(ip.quantidade) AS total_ingressos
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente
INNER JOIN itens_pedido ip ON p.id_pedido = ip.id_pedido
GROUP BY c.id_cliente, c.nome;

SELECT setor, preco
FROM tipos_ingresso
WHERE preco BETWEEN 80.00 AND 200.00;

SELECT AVG(preco) AS preco_medio_ingressos
FROM tipos_ingresso;

SELECT e.nome_evento, COUNT(a.atracao) AS total_atracoes
FROM eventos e
INNER JOIN atracao_evento a ON e.id_evento = a.id_evento
GROUP BY e.id_evento, e.nome_evento;

SELECT nome_local, bairro, capacidade_maxima
FROM locais
WHERE capacidade_maxima > 1500;

SELECT p.id_pedido, c.nome AS cliente, e.nome_evento, ti.setor, ip.quantidade, ip.preco_unitario
FROM pedidos p
INNER JOIN clientes c ON p.id_cliente = c.id_cliente
INNER JOIN itens_pedido ip ON p.id_pedido = ip.id_pedido
INNER JOIN tipos_ingresso ti ON ip.id_tipo_ingresso = ti.id_tipo_ingresso
INNER JOIN eventos e ON ti.id_evento = e.id_evento;

SELECT e.nome_evento, pe.promoter
FROM eventos e
INNER JOIN promoters_evento pe ON e.id_evento = pe.id_evento;

SELECT c.nome, SUM(p.valor_total) AS total_gasto
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome
HAVING SUM(p.valor_total) > 100.00;

SELECT id_pedido, data_pedido, valor_total
FROM pedidos
WHERE data_pedido BETWEEN '2026-10-01 00:00:00' AND '2026-10-31 23:59:59';

SELECT tipo_evento, COUNT(*) AS quantidade_eventos
FROM eventos
GROUP BY tipo_evento;