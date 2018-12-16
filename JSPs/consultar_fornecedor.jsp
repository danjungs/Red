<%@ page import="java.sql.*" %>
<%@ page import="DAO.*" %>
<%@ page import="Modelo.*" %>

<html>
  <head>
    <title>Red - Consultar Fornecedor</title>
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
      <th>EMPRESA</th>
      <th>PRODUTO</th>
      <th>PREÇO</th>      
      <th>ESCOLHA A OPÇÃO</th>      
    </tr>
  </thead>
  <tbody>

<%
FornecedorDAO fdao = new FornecedorDAO();
fdao.conexaoBD();
fornecedor[] f = fdao.consultaTodos();
for (int i = 0; i < f.length; i++)
  	{
  		out.println ("<tr><th scope='row'>" + f[i].getIdFornecedor()+ "</th><td>" +
  		f[i].getEmpresa() + "</td><td>" + f[i].getProduto() + "</td><td>" + "R$ "+f[i].getPreco() + "</td><td>" +
  		"<a href='alterar_cardapio.jsp?cod=" + f[i].getIdFornecedor() + "'>Alterar</a>" + 
  		"  OU  <a href='excluir_cardapio.jsp?cod=" + f[i].getIdFornecedor() + "'>Excluir</a>" +
  	    "</td></tr>");
  	}
%>

  </tbody>
</table>
</body></html>