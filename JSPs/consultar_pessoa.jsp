<%@ page import="java.sql.*" %>
<%@ page import="DAO.*" %>
<%@ page import="Modelo.*" %>

<html>
  <head>
    <title>Red - Consultar Pessoas</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
  </head>

<body>

<div class="navbar navbar-inverse">
  <div class="navbar-inner">
    <ul class="nav">
      <li><a href="login.jsp">Início</a></li>
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
      <th>NOME</th>
      <th>LOGIN</th>
      <th>SENHA</th>            
      <th>ESCOLHA A OPÇÃO</th>      
    </tr>
  </thead>
  <tbody>

<%
PessoaDAO pdao = new PessoaDAO();
pdao.conexaoBD();
Pessoa[] p = pdao.consultaTodos();
for (int i = 0; i < p.length; i++)
  	{
  		out.println ("<tr><th scope='row'>" + p[i].getCodigo()+ "</th><td>" +
  		p[i].getNome() + "</td><td>" +p[i].getLogin() + "</td><td>" +
  		p[i].getSenha() + "</td><td>" +
  		"<a href='alterar_pessoa.jsp?cod=" + p[i].getCodigo() + "'>Alterar</a>" + 
  		"  OU  <a href='excluir_pessoa.jsp?cod=" + p[i].getCodigo() + "'>Excluir</a>" +
  	    "</td></tr>");
  	}
%>

  </tbody>
</table>
</body></html>