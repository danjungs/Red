<%@ page import="java.sql.*" %>
<%@ page import="DAO.*" %>
<%@ page import="Modelo.*" %>

<html>
  <head>
    <title>Red - Consultar Estoque</title>
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
      <th>QUANTIDADE</th> 
      <th>VALIDADE</th>
      <th>ESCOLHA A OPÇÃO</th>      
    </tr>
  </thead>
  <tbody>

<%
EstoqueDAO edao = new EstoqueDAO();
edao.conexaoBD();
estoque[] e = edao.consultaTodos();
for (int i = 0; i < e.length; i++)
  	{
  		out.println ("<tr><th scope='row'>" + e[i].getCodigoItem()+ "</th><td>" +
  		e[i].getItem() + "</td><td>"+ e[i].getQuantidade() + "</td><td>" + e[i].getValidade() + "</td><td>" +
  		"<a href='alterar_estoque.jsp?cod=" + e[i].getCodigoItem() + "'>Alterar</a>" + 
  		"  OU  <a href='excluir_estoque.jsp?cod=" + e[i].getCodigoItem() + "'>Excluir</a>" +
  	    "</td></tr>");
  	}
%>

  </tbody>
</table>
</body></html>