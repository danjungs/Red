<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.*" %>
<%@ page import="java.sql.*" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  
	<head>
    
    	<meta charset="ISO-8859-1">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<!-- As meta tags acima precisam vir primeiro no head para o funcionamento do Bootstrap -->
    	
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">   
    	<!-- Ativa o design responsivo do Bootstrap -->
    
    	<title>Red - Gerar Pedido</title>

   		<!-- Bootstrap -->
    	<link href="css/bootstrap.min.css" rel="stylesheet">
    	<link href="css/bootstrap-responsive.css" rel="stylesheet">
    
    	<!-- Defini��o de estilo da p�gina -->
    	<style type="text/css">
      		body {
         		background-color: #f5f5f5;
      		}

      		.form-signin {
        		max-width: 300px;
        		padding: 19px 29px 29px;
        		margin: 0 auto 20px;
        		background-color: #fff;
        		border: 1px solid #e5e5e5;
        		-webkit-border-radius: 5px;
           		-moz-border-radius: 5px;
                	border-radius: 5px;
        		-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           			-moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                		box-shadow: 0 1px 2px rgba(0,0,0,.05);
      		}
      		
      		.form-signin .form-signin-heading, .form-signin .checkbox {
        		margin-bottom: 10px;
      		}
      		
      		.form-signin input[type="text"], .form-signin input[type="password"] {
        		font-size: 16px;
        		height: auto;
        		margin-bottom: 15px;
        		padding: 7px 9px;
      		}

		</style>

	</head>
  
  	<body>
  	
  		<!-- In�cio do encapsulamento da p�gina -->
  		<div id="wrap">

			<!-- Barra de navega��o superior fixada no topo da p�gina -->
			<div class="navbar navbar-fixed-top navbar-inverse">
  				<div class="navbar-inner">    
    				<ul class="nav">
      					<li><a href="menu.jsp">In�cio</a></li>
      					<li><a href="descricao.jsp">Descri��o</a></li>
      		<!-- <li><a href="cadastro.jsp">Cadastro</a></li> -->	
      					<!--   <li><a href="teste.jsp">Teste</a></li> -->      					
    				</ul>
  				</div>
			</div>
	
			<!-- Unidade her�i destacando o t�tulo do projeto -->
      		<div class="hero-unit">
      			<img src="https://mir-s3-cdn-cf.behance.net/project_modules/1400/7daef545930001.5841992a9b683.jpg" alt="Red-icon" width="100 height="100" align ='left'>
        		<h1>Red</h1>
        		<p>Sistema Inteligente e Moderno</p>
        		<!-- 
        			Bot�o "Saiba Mais" desativado
        			<p><a class="btn btn-primary btn-large">Saiba Mais &raquo;</a></p> 
        		-->
      		</div>	
	
			<!-- Formul�rio de Perfil -->
			<div class="container">
      			<form class="form-signin" method="POST" action="gerar_pedido_dados.jsp">
        			<h2 class="form-signin-heading">Gerar Pedido</h2>
        			Item <input type="text" class="input-block-level" name="ITEM">
        			Observa��o <input type="text" class="input-block-level" name="OBSERVACAO">                
        			Quantidade <input type="text" class="input-block-level" name="QUANTIDADE">
        			Mesa <input type="text" class="input-block-level" name="MESA">
        			Gar�om <input type="text" class="input-block-level" name="GARCOM">
        			CPF <input type="text" class="input-block-level" name="CPF">       			
       				<button class="btn btn-large btn-primary" type="submit">Salvar</button>
					<button class="btn btn-large btn-primary" type="reset">Limpar campos</button>
      			</form>      			
    		</div>
	
			<!-- 
				Barra de navega��o inferior desativada, substitu�da pelo rodap� fixo 
				<div class="navbar navbar-fixed-bottom navbar-inverse">
  					<div class="navbar-inner">    
    					<ul class="nav">
      						<li><a href="#">Aluno: Jos� Ricardo Nominato de Oliveira</a></li>
      						<li><a href="#">Orientador: Prof. Dr. Orlando Bernardo Filho</a></li>
      						<li><a href="#">Mar�o - 2017 (Vers�o Alpha)</a></li>
    					</ul>
  					</div>
				</div>
			-->
	
			<div id="push"></div>
    	</div>
    	<!-- Fim do encapsulamento da p�gina -->

    	<!-- Rodap� fixo -->
    	<div id="footer">
    		<div class="container">
        		<p class="muted credit">Sistema Informatizado para Restaurante -         								
        								(Vers�o 0.0.1)</p>
      		</div>
    	</div>

    	<!-- jQuery (necessario para o carregamento dos plugins JavaScript do Bootstrap) -->
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    
    	<!-- Incluus�o dos plugins compilados do Boostrap, conforme a necessidade -->
    	<script src="js/bootstrap.min.js"></script>
    
  	</body>
  
</html>