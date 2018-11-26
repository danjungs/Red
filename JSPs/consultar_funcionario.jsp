<%@ page import="java.sql.*" %>
<%@ page import="DAO.*" %>
<%@ page import="Modelo.*" %>

<html>
  <head>
    <title>Red - Consultar Funcionarios</title>
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
      <th>NOME</th>
      <th>CARGO</th>
      <th>LOGIN</th>
      <th>SENHA</th>            
      <th>ESCOLHA A OPÇÃO</th>      
    </tr>
  </thead>
  <tbody>

<%
FuncionarioDAO fdao = new FuncionarioDAO();
fdao.conexaoBD();
funcionario[] f = fdao.consultaTodos();
for (int i = 0; i < f.length; i++)
  	{
  		out.println ("<tr><th scope='row'>" + f[i].getCodigoFun()+ "</th><td>" +
  		f[i].getNome() + "</td><td>" + f[i].getCargo() + "</td><td>" +
  		f[i].getLogin() + "</td><td>" +	f[i].getSenha() + "</td><td>" +
  		"<a href='alterar_funcionario.jsp?cod=" + f[i].getCodigoFun() + "'>Alterar</a>" + 
  		"  OU  <a href='excluir_funcionario.jsp?cod=" + f[i].getCodigoFun() + "'>Excluir</a>" +
  	    "</td></tr>");
  	}
%>

  </tbody>
</table>
</body></html>