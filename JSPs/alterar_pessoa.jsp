<%@ page import="java.sql.*" %>
<%@ page import="DAO.*" %>
<%@ page import="Modelo.*" %>

<html>
  <head>
    <title>CAJU - Alterar Dados da Pessoa</title>
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
    </ul>
  </div>
</div>

<% 
  //String login = request.getParameter("login"); 
  //String login = session.getValue("loginUsuario").toString();
  Pessoa p;
  PessoaDAO pdao = new PessoaDAO();
  
  pdao.conexaoBD();
  p = pdao.consultaPorCodigo(Integer.parseInt(request.getParameter("cod")));
%>

			<div class="container">
      			<form class="form-signin" method="POST" action="alterar_dados_pessoa.jsp?cod=<% out.println (p.getCodigo()); %>">
        			<h2 class="form-signin-heading">Alteração de Dados da Pessoa</h2>
        			Nome <input type="text" class="input-block-level" value="<% out.println (p.getNome()); %>" name="NOME">        	
        			Login <input type="text" class="input-block-level" value="<% out.println (p.getLogin()); %>" name="LOGIN">
        			Senha <input type="password" class="input-block-level" value="<% out.println (p.getSenha()); %>" name="SENHA">     			
       				<button class="btn btn-large btn-primary" type="submit">Atualizar</button>
					<button class="btn btn-large btn-primary" type="reset">Dados Atuais</button>
      			</form>      			
    		</div>
</body>
</html>