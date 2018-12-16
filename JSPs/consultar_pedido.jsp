<%@ page import="java.sql.*" %>
<%@ page import="DAO.*" %>
<%@ page import="Modelo.*" %>

<html>
  <head>
    <title>Red - Consultar Pedidos</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
  </head>

<body>

<div class="navbar navbar-inverse">
  <div class="navbar-inner">
    <ul class="nav">
      <li><a href="menu.jsp">Início</a></li>
	  <li><a href="descricao.jsp">Descrição</a></li>
	  <li><a href="logout.jsp">Sair</a></li>
      <!-- <li><a href="cadastro.jsp">Cadastro</a></li> -->
    </ul>
  </div>
</div>

<table class="table table-sm">
  <thead>
    <tr>
      <th>CODIGO</th>
      <th>ITEM</th>
      <th>OBSERVAÇÃO</th>   
      <th>QUANTIDADE</th>
      <th>MESA</th>
      <th>GARÇOM</th>     
      <th>STATUS</th>
      <th></th>
      <th>DATA</th>
      <th>CPF DO CLIENTE</th>            
      <th>ESCOLHA A OPÇÃO</th>      
    </tr>
  </thead>
  <tbody>

<%
PedidoDAO pdao = new PedidoDAO();
pdao.conexaoBD();
pedido[] p = pdao.consultaTodos();
for (int i = 0; i < p.length; i++)
  	{
  		out.println ("<tr><th scope='row'>" + p[i].getCodigoPedido()+ "</th><td>" +
  		p[i].getIditem() + "</td><td>" +p[i].getObservacao() + "</td><td>" +
  		p[i].getQuantidade() + "</td><td>" +p[i].getMesa() + "</td><td>" +
  		p[i].getCodigoGarcom() + "</td><td>" +p[i].getStatus() + "</td><td>"+ "<a href='alterar_status_pedido.jsp?cod=" + p[i].getCodigoPedido() + "'>Alterar</a>" + 
  		"</td><td>" + p[i].getData() + "</td><td>" +p[i].getCpfCliente() + "</td><td>" +
  		"<a href='alterar_pedido.jsp?cod=" + p[i].getCodigoPedido() + "'>Alterar</a>" + 
  		"  OU  <a href='excluir_pedido.jsp?cod=" + p[i].getCodigoPedido() + "'>Excluir</a>" +
  	    "</td></tr>");
  	}
%>

  </tbody>
</table>
</body></html>