CREATE DATABASE IF NOT EXISTS myself_tickets_db;
USE myself_tickets_db;

CREATE TABLE locais (
    id_local INT AUTO_INCREMENT PRIMARY KEY,
    nome_local VARCHAR(100) NOT NULL,
    bairro VARCHAR(60) NOT NULL,
    capacidade_maxima INT NOT NULL CHECK (capacidade_maxima > 0)
) ENGINE=InnoDB;

CREATE TABLE eventos (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    id_local INT NOT NULL,
    nome_evento VARCHAR(150) NOT NULL,
    data_hora DATETIME NOT NULL,
    tipo_evento VARCHAR(50) NOT NULL,
    CONSTRAINT fk_eventos_locais FOREIGN KEY (id_local) REFERENCES locais(id_local) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE tipos_ingresso (
    id_tipo_ingresso INT AUTO_INCREMENT PRIMARY KEY,
    id_evento INT NOT NULL,
    setor VARCHAR(50) NOT NULL,
    lote INT NOT NULL DEFAULT 1,
    preco DECIMAL(10,2) NOT NULL CHECK (preco >= 0),
    quantidade_disponivel INT NOT NULL CHECK (quantidade_disponivel >= 0),
    CONSTRAINT fk_tipos_ingresso_eventos FOREIGN KEY (id_evento) REFERENCES eventos(id_evento) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATETIME NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL CHECK (valor_total >= 0),
    status_pagamento VARCHAR(20) NOT NULL DEFAULT 'Aprovado',
    CONSTRAINT fk_pedidos_clientes FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE itens_pedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_tipo_ingresso INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    preco_unitario DECIMAL(10,2) NOT NULL CHECK (preco_unitario >= 0),
    CONSTRAINT fk_itens_pedido_pedidos FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
    CONSTRAINT fk_itens_pedido_tipos_ingresso FOREIGN KEY (id_tipo_ingresso) REFERENCES tipos_ingresso(id_tipo_ingresso) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE atracao_evento (
    id_evento INT NOT NULL,
    atracao VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_evento, atracao),
    CONSTRAINT fk_atracao_eventos FOREIGN KEY (id_evento) REFERENCES eventos(id_evento) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE promoters_evento (
    id_evento INT NOT NULL,
    promoter VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_evento, promoter),
    CONSTRAINT fk_promoters_eventos FOREIGN KEY (id_evento) REFERENCES eventos(id_evento) ON DELETE CASCADE
) ENGINE=InnoDB;