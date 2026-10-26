const consultasSQL = [
  {
    id: 1,
    titulo: "Consulta 1: Listar Festas e seus Locais (INNER JOIN)",
    desc: "Lista o nome das festas, data/hora, nome do local parceiro e bairro.",
    sql: "SELECT e.nome_evento, e.data_hora, l.nome_local, l.bairro\nFROM eventos e\nINNER JOIN locais l ON e.id_local = l.id_local;",
    colunas: ["nome_evento", "data_hora", "nome_local", "bairro"],
    linhas: [
      ["MYSELF x ECHO DIMENSIONAL FUTURE", "2026-10-31 22:00:00", "Complexo Zona Sul", "Santo Amaro"],
      ["HELLSING GLOCK BOYZ x MYSELF WEB", "2026-11-14 23:00:00", "Espaço MySelf Club", "Vila Olímpia"],
      ["MYSELF WEB: AFTER APOLOGY", "2026-11-28 16:00:00", "Rooftop Zona Sul", "Itaim Bibi"],
      ["MYSELF TRAP NIGHT #12", "2026-12-12 22:00:00", "Arena Sunset", "Interlagos"]
    ]
  },
  {
    id: 2,
    titulo: "Consulta 2: Ingressos por Festa (WHERE / INNER JOIN)",
    desc: "Exibe os setores, lotes e preços específicos do evento ECHO DIMENSIONAL.",
    sql: "SELECT ti.setor, ti.lote, ti.preco\nFROM tipos_ingresso ti\nINNER JOIN eventos e ON ti.id_evento = e.id_evento\nWHERE e.nome_evento = 'MYSELF x ECHO DIMENSIONAL FUTURE';",
    colunas: ["setor", "lote", "preco"],
    linhas: [
      ["Pista Trap", "1", "R$ 80,00"],
      ["Área VIP Backstage", "1", "R$ 180,00"]
    ]
  },
  {
    id: 3,
    titulo: "Consulta 3: Faturamento Total Aprovado (SUM)",
    desc: "Soma total das receitas obtidas em vendas com pagamento aprovado.",
    sql: "SELECT SUM(valor_total) AS faturamento_total\nFROM pedidos\nWHERE status_pagamento = 'Aprovado';",
    colunas: ["faturamento_total"],
    linhas: [
      ["R$ 900,00"]
    ]
  },
  {
    id: 4,
    titulo: "Consulta 4: Eventos com a Marca 'WEB' (LIKE)",
    desc: "Filtra edições de festas que possuem 'WEB' no título.",
    sql: "SELECT nome_evento, tipo_evento, data_hora\nFROM eventos\nWHERE nome_evento LIKE '%WEB%';",
    colunas: ["nome_evento", "tipo_evento", "data_hora"],
    linhas: [
      ["HELLSING GLOCK BOYZ x MYSELF WEB", "Edição Especial", "2026-11-14 23:00:00"],
      ["MYSELF WEB: AFTER APOLOGY", "Edição Especial", "2026-11-28 16:00:00"]
    ]
  },
  {
    id: 5,
    titulo: "Consulta 5: Pedidos Aprovados por Valor (ORDER BY)",
    desc: "Pedidos aprovados organizados do maior para o menor valor total.",
    sql: "SELECT id_pedido, data_pedido, valor_total, status_pagamento\nFROM pedidos\nWHERE status_pagamento = 'Aprovado'\nORDER BY valor_total DESC;",
    colunas: ["id_pedido", "data_pedido", "valor_total", "status_pagamento"],
    linhas: [
      ["1", "2026-10-15 14:20:00", "R$ 360,00", "Aprovado"],
      ["4", "2026-10-18 11:30:00", "R$ 250,00", "Aprovado"],
      ["5", "2026-10-19 15:00:00", "R$ 120,00", "Aprovado"],
      ["3", "2026-10-17 20:10:00", "R$ 90,00", "Aprovado"],
      ["2", "2026-10-16 18:45:00", "R$ 80,00", "Aprovado"]
    ]
  },
  {
    id: 6,
    titulo: "Consulta 6: Total de Ingressos por Cliente (GROUP BY + SUM)",
    desc: "Calcula a quantidade acumulada de ingressos comprados por cada cliente.",
    sql: "SELECT c.nome, SUM(ip.quantidade) AS total_ingressos\nFROM clientes c\nINNER JOIN pedidos p ON c.id_cliente = p.id_cliente\nINNER JOIN itens_pedido ip ON p.id_pedido = ip.id_pedido\nGROUP BY c.id_cliente, c.nome;",
    colunas: ["nome", "total_ingressos"],
    linhas: [
      ["Enzo Gabriel", "2"],
      ["Beatriz Ramos", "1"],
      ["Matheus Oliveira", "1"],
      ["Giulia Martins", "1"],
      ["Lucas Mendes", "2"]
    ]
  },
  {
    id: 7,
    titulo: "Consulta 7: Ingressos de Médio/Alto Valor (BETWEEN)",
    desc: "Filtra opções de ingressos com preço entre R$ 80,00 e R$ 200,00.",
    sql: "SELECT setor, preco\nFROM tipos_ingresso\nWHERE preco BETWEEN 80.00 AND 200.00;",
    colunas: ["setor", "preco"],
    linhas: [
      ["Pista Trap", "R$ 80,00"],
      ["Área VIP Backstage", "R$ 180,00"],
      ["Pista Geral", "R$ 90,00"],
      ["VIP Rooftop", "R$ 150,00"]
    ]
  },
  {
    id: 8,
    titulo: "Consulta 8: Preço Médio dos Ingressos (AVG)",
    desc: "Calcula o ticket médio entre todos os lotes e setores cadastrados.",
    sql: "SELECT AVG(preco) AS preco_medio_ingressos\nFROM tipos_ingresso;",
    colunas: ["preco_medio_ingressos"],
    linhas: [
      ["R$ 135,00"]
    ]
  },
  {
    id: 9,
    titulo: "Consulta 9: Quantidade de Atrações por Festa (COUNT + GROUP BY)",
    desc: "Conta o número total de DJs/Artistas confirmados para cada evento.",
    sql: "SELECT e.nome_evento, COUNT(a.atracao) AS total_atracoes\nFROM eventos e\nINNER JOIN atracao_evento a ON e.id_evento = a.id_evento\nGROUP BY e.id_evento, e.nome_evento;",
    colunas: ["nome_evento", "total_atracoes"],
    linhas: [
      ["MYSELF x ECHO DIMENSIONAL FUTURE", "2"],
      ["HELLSING GLOCK BOYZ x MYSELF WEB", "1"],
      ["MYSELF WEB: AFTER APOLOGY", "1"],
      ["MYSELF TRAP NIGHT #12", "1"]
    ]
  },
  {
    id: 10,
    titulo: "Consulta 10: Espaços com Grande Capacidade (WHERE)",
    desc: "Locais parceiros na Zona Sul que suportam mais de 1.500 pessoas.",
    sql: "SELECT nome_local, bairro, capacidade_maxima\nFROM locais\nWHERE capacidade_maxima > 1500;",
    colunas: ["nome_local", "bairro", "capacidade_maxima"],
    linhas: [
      ["Complexo Zona Sul", "Santo Amaro", "2.500 psl"],
      ["Arena Sunset", "Interlagos", "3.500 psl"]
    ]
  },
  {
    id: 11,
    titulo: "Consulta 11: Relatório Detalhado de Vendas (Múltiplos JOINs)",
    desc: "Combina dados de clientes, compras, itens e eventos associados.",
    sql: "SELECT p.id_pedido, c.nome AS cliente, e.nome_evento, ti.setor, ip.quantidade, ip.preco_unitario\nFROM pedidos p\nINNER JOIN clientes c ON p.id_cliente = c.id_cliente\nINNER JOIN itens_pedido ip ON p.id_pedido = ip.id_pedido\nINNER JOIN tipos_ingresso ti ON ip.id_tipo_ingresso = ti.id_tipo_ingresso\nINNER JOIN eventos e ON ti.id_evento = e.id_evento;",
    colunas: ["id_pedido", "cliente", "nome_evento", "setor", "quantidade", "preco_unitario"],
    linhas: [
      ["1", "Enzo Gabriel", "MYSELF x ECHO DIMENSIONAL FUTURE", "Área VIP Backstage", "2", "R$ 180,00"],
      ["2", "Beatriz Ramos", "MYSELF x ECHO DIMENSIONAL FUTURE", "Pista Trap", "1", "R$ 80,00"],
      ["3", "Matheus Oliveira", "HELLSING GLOCK BOYZ x MYSELF WEB", "Pista Geral", "1", "R$ 90,00"],
      ["4", "Giulia Martins", "MYSELF TRAP NIGHT #12", "Camarote Exclusivo", "1", "R$ 250,00"],
      ["5", "Lucas Mendes", "MYSELF TRAP NIGHT #12", "Pista Lote Único", "2", "R$ 60,00"]
    ]
  },
  {
    id: 12,
    titulo: "Consulta 12: Promoters Responsáveis por Evento (INNER JOIN)",
    desc: "Exibe a equipe de divulgação atribuída a cada edição.",
    sql: "SELECT e.nome_evento, pe.promoter\nFROM eventos e\nINNER JOIN promoters_evento pe ON e.id_evento = pe.id_evento;",
    colunas: ["nome_evento", "promoter"],
    linhas: [
      ["MYSELF x ECHO DIMENSIONAL FUTURE", "Promoter Felipe Melo"],
      ["MYSELF x ECHO DIMENSIONAL FUTURE", "Promoter Carol Silva"],
      ["HELLSING GLOCK BOYZ x MYSELF WEB", "Promoter Lucas Farias"],
      ["MYSELF WEB: AFTER APOLOGY", "Promoter Felipe Melo"],
      ["MYSELF TRAP NIGHT #12", "Promoter Amanda Santos"]
    ]
  },
  {
    id: 13,
    titulo: "Consulta 13: Clientes VIP com Compras > R$ 100 (HAVING)",
    desc: "Filtra clientes cujo acumulado gasto em compras ultrapassa R$ 100,00.",
    sql: "SELECT c.nome, SUM(p.valor_total) AS total_gasto\nFROM clientes c\nINNER JOIN pedidos p ON c.id_cliente = p.id_cliente\nGROUP BY c.id_cliente, c.nome\nHAVING SUM(p.valor_total) > 100.00;",
    colunas: ["nome", "total_gasto"],
    linhas: [
      ["Enzo Gabriel", "R$ 360,00"],
      ["Giulia Martins", "R$ 250,00"],
      ["Lucas Mendes", "R$ 120,00"]
    ]
  },
  {
    id: 14,
    titulo: "Consulta 14: Pedidos do Mês de Outubro/2026 (BETWEEN de Datas)",
    desc: "Filtra apenas transações realizadas no período de Outubro/2026.",
    sql: "SELECT id_pedido, data_pedido, valor_total\nFROM pedidos\nWHERE data_pedido BETWEEN '2026-10-01 00:00:00' AND '2026-10-31 23:59:59';",
    colunas: ["id_pedido", "data_pedido", "valor_total"],
    linhas: [
      ["1", "2026-10-15 14:20:00", "R$ 360,00"],
      ["2", "2026-10-16 18:45:00", "R$ 80,00"],
      ["3", "2026-10-17 20:10:00", "R$ 90,00"],
      ["4", "2026-10-18 11:30:00", "R$ 250,00"],
      ["5", "2026-10-19 15:00:00", "R$ 120,00"]
    ]
  },
  {
    id: 15,
    titulo: "Consulta 15: Contagem de Eventos por Tipo (GROUP BY)",
    desc: "Agrupa e conta as festas de acordo com a sua classificação.",
    sql: "SELECT tipo_evento, COUNT(*) AS quantidade_eventos\nFROM eventos\nGROUP BY tipo_evento;",
    colunas: ["tipo_evento", "quantidade_eventos"],
    linhas: [
      ["Edição Especial", "3"],
      ["Mensal", "1"]
    ]
  }
];

function mostrarConsulta(numero) {
  const titulo = document.getElementById("titulo-sql");
  const codigo = document.getElementById("codigo-sql");
  let desc = document.getElementById("desc-sql");
  let containerTabela = document.getElementById("tabela-resultado-container");

  if (!desc) {
    desc = document.createElement("p");
    desc.id = "desc-sql";
    desc.className = "desc-sql-texto";
    codigo.parentNode.insertBefore(desc, codigo);
  }

  if (!containerTabela) {
    containerTabela = document.createElement("div");
    containerTabela.id = "tabela-resultado-container";
    codigo.parentNode.appendChild(containerTabela);
  }

  const consulta = consultasSQL.find(item => item.id === numero);

  if (consulta) {
    titulo.innerText = consulta.titulo;
    desc.innerText = consulta.desc;
    codigo.innerText = consulta.sql;

    let htmlTabela = `<h4 class="tabela-resultado-titulo">Resultado do Banco de Dados (MySQL):</h4>`;
    htmlTabela += `<div class="tabela-wrapper"><table class="tabela-resultado"><thead><tr>`;

    consulta.colunas.forEach(col => {
      htmlTabela += `<th>${col}</th>`;
    });

    htmlTabela += `</tr></thead><tbody>`;

    consulta.linhas.forEach(linha => {
      htmlTabela += `<tr>`;
      linha.forEach(celula => {
        htmlTabela += `<td>${celula}</td>`;
      });
      htmlTabela += `</tr>`;
    });

    htmlTabela += `</tbody></table></div>`;
    containerTabela.innerHTML = htmlTabela;
  } else {
    titulo.innerText = "Selecione uma consulta";
    desc.innerText = "";
    codigo.innerText = "-- Clique em um botão acima para ver a consulta SQL.";
    containerTabela.innerHTML = "";
  }
}

document.addEventListener("DOMContentLoaded", function () {
  mostrarConsulta(1);
});
