<%@ page import="java.sql.*" %>
<%@ page import="DAO.*" %>
<%@ page import="Modelo.*" %>

<html>
  <head>
    <title>CAJU - Alterar Dados do Pedido</title>
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
    </ul>
  </div>
</div>

<% 
  //String login = request.getParameter("login"); 
  //String login = session.getValue("loginUsuario").toString();
  pedido p;
  PedidoDAO pdao = new PedidoDAO();
  
  pdao.conexaoBD();
  p = pdao.consultaPorCodigo(Integer.parseInt(request.getParameter("cod")));
%>

			<div class="container">
      			<form class="form-signin" method="POST" action="alterar_dados_pedido.jsp?cod=<% out.println (p.getCodigoPedido()); %>">
        			<h2 class="form-signin-heading">Alteração de Dados do Pedido</h2>
        			Item <input type="text" class="input-block-level" value="<% out.println (p.getIditem()); %>" name="ITEM">        	
        			Observacao <input type="text" class="input-block-level" value="<% out.println (p.getObservacao()); %>" name="OBSERVACAO">
        			Quantidade <input type="text" class="input-block-level" value="<% out.println (p.getQuantidade()); %>" name="QUANTIDADE">     			
       				<button class="btn btn-large btn-primary" type="submit">Atualizar</button>
					<button class="btn btn-large btn-primary" type="reset">Dados Atuais</button>
      			</form>      			
    		</div>
</body>
</html>