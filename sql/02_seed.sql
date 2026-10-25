USE myself_tickets_db;

INSERT INTO locais (nome_local, bairro, capacidade_maxima) VALUES
('Complexo Zona Sul', 'Santo Amaro', 2500),
('Espaço MySelf Club', 'Vila Olímpia', 1200),
('Rooftop Zona Sul', 'Itaim Bibi', 800),
('Arena Sunset', 'Interlagos', 3500);

INSERT INTO eventos (id_local, nome_evento, data_hora, tipo_evento) VALUES
(1, 'MYSELF x ECHO DIMENSIONAL FUTURE', '2026-10-31 22:00:00', 'Edição Especial'),
(2, 'HELLSING GLOCK BOYZ x MYSELF WEB', '2026-11-14 23:00:00', 'Edição Especial'),
(3, 'MYSELF WEB: AFTER APOLOGY', '2026-11-28 16:00:00', 'Edição Especial'),
(4, 'MYSELF TRAP NIGHT #12', '2026-12-12 22:00:00', 'Mensal');

INSERT INTO tipos_ingresso (id_evento, setor, lote, preco, quantidade_disponivel) VALUES
(1, 'Pista Trap', 1, 80.00, 500),
(1, 'Área VIP Backstage', 1, 180.00, 200),
(2, 'Pista Geral', 1, 90.00, 400),
(3, 'VIP Rooftop', 1, 150.00, 150),
(4, 'Pista Lote Único', 1, 60.00, 600),
(4, 'Camarote Exclusivo', 1, 250.00, 50);

INSERT INTO clientes (nome, cpf, email, telefone) VALUES
('Enzo Gabriel', '111.222.333-01', 'enzo.gabriel@email.com', '(11) 98765-4321'),
('Beatriz Ramos', '222.333.444-02', 'beatriz.ramos@email.com', '(11) 97654-3210'),
('Matheus Oliveira', '333.444.555-03', 'matheus.trap@email.com', '(11) 96543-2109'),
('Giulia Martins', '444.555.666-04', 'giulia.martins@email.com', '(11) 95432-1098'),
('Lucas Mendes', '555.666.777-05', 'lucas.mendes@email.com', '(11) 94321-0987');

INSERT INTO pedidos (id_cliente, data_pedido, valor_total, status_pagamento) VALUES
(1, '2026-10-15 14:20:00', 360.00, 'Aprovado'),
(2, '2026-10-16 18:45:00', 80.00, 'Aprovado'),
(3, '2026-10-17 20:10:00', 90.00, 'Aprovado'),
(4, '2026-10-18 11:30:00', 250.00, 'Aprovado'),
(5, '2026-10-19 15:00:00', 120.00, 'Aprovado');

INSERT INTO itens_pedido (id_pedido, id_tipo_ingresso, quantidade, preco_unitario) VALUES
(1, 2, 2, 180.00), -- Enzo comprou 2 VIP Backstage
(2, 1, 1, 80.00),  -- Beatriz comprou 1 Pista
(3, 3, 1, 90.00),  -- Matheus comprou 1 Pista Geral
(4, 6, 1, 250.00), -- Giulia comprou 1 Camarote Exclusivo
(5, 5, 2, 60.00);  -- Lucas comprou 2 Pistas

INSERT INTO atracao_evento (id_evento, atracao) VALUES
(1, 'DJ Echo Dimensional'),
(1, 'Trap Set Glock Boyz'),
(2, 'Hellsing Live'),
(3, 'Special Set After Apology'),
(4, 'DJ Resident MySelf');

INSERT INTO promoters_evento (id_evento, promoter) VALUES
(1, 'Promoter Felipe ZS'),
(1, 'Promoter Carol Silva'),
(2, 'Promoter Lucas ZS'),
(3, 'Promoter Felipe ZS'),
(4, 'Promoter Amanda ZS');