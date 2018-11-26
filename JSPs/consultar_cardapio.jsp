<%@ page import="java.sql.*" %>
<%@ page import="DAO.*" %>
<%@ page import="Modelo.*" %>

<html>
  <head>
    <title>Red - Consultar Cardápio</title>
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
      <th>PREÇO</th>      
      <th>ESCOLHA A OPÇÃO</th>      
    </tr>
  </thead>
  <tbody>

<%
CardapioDAO cdao = new CardapioDAO();
cdao.conexaoBD();
cardapio[] c = cdao.consultaTodos();
for (int i = 0; i < c.length; i++)
  	{
  		out.println ("<tr><th scope='row'>" + c[i].getCodigoItem()+ "</th><td>" +
  		c[i].getItem() + "</td><td>" + "R$ "+c[i].getPreco() + "</td><td>" +
  		"<a href='alterar_cardapio.jsp?cod=" + c[i].getCodigoItem() + "'>Alterar</a>" + 
  		"  OU  <a href='excluir_cardapio.jsp?cod=" + c[i].getCodigoItem() + "'>Excluir</a>" +
  	    "</td></tr>");
  	}
%>

  </tbody>
</table>
</body></html>