function mostrarConsulta(numero) {
  var titulo = document.getElementById("titulo-sql");
  var codigo = document.getElementById("codigo-sql");

  switch(numero) {
    case 1:
      titulo.innerText = "Consulta 1: Listar Festas e seus Locais (INNER JOIN)";
      codigo.innerText = "SELECT e.nome_evento, e.data_hora, l.nome_local, l.bairro\nFROM eventos e\nINNER JOIN locais l ON e.id_local = l.id_local;";
      break;
      
    case 2:
      titulo.innerText = "Consulta 2: Ingressos por Festa (WHERE / INNER JOIN)";
      codigo.innerText = "SELECT ti.setor, ti.lote, ti.preco\nFROM tipos_ingresso ti\nINNER JOIN eventos e ON ti.id_evento = e.id_evento\nWHERE e.nome_evento = 'MYSELF x ECHO DIMENSIONAL FUTURE';";
      break;
      
    case 3:
      titulo.innerText = "Consulta 3: Faturamento Total Aprovado (SUM)";
      codigo.innerText = "SELECT SUM(valor_total) AS faturamento_total\nFROM pedidos\nWHERE status_pagamento = 'Aprovado';";
      break;
      
    default:
      titulo.innerText = "Selecione uma consulta";
      codigo.innerText = "-- Clique em um botão acima para ver a consulta SQL.";
  }
}