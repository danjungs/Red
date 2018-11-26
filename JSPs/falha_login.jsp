<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.*" %>
<%@ page import="Modelo.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  
	<head>
    
    	<meta charset="ISO-8859-1">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<!-- As meta tags acima precisam vir primeiro no head para o funcionamento do Bootstrap -->
    	
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">   
    	<!-- Ativa o design responsivo do Bootstrap -->
    
    	<title>Red - Falha na Autenticação</title>

   		<!-- Bootstrap -->
    	<link href="css/bootstrap.min.css" rel="stylesheet">
    	<link href="css/bootstrap-responsive.css" rel="stylesheet">
    
    	<!-- Definição de estilo da página -->
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
  	
  		<!-- Início do encapsulamento da página -->
  		<div id="wrap">

			<!-- Barra de navegação superior fixada no topo da página -->
			<div class="navbar navbar-fixed-top navbar-inverse">
  				<div class="navbar-inner">    
    				<ul class="nav">
      					<li><a href="index.jsp">Início</a></li>
      					<li><a href="descricao.jsp">Descrição</a></li>
    				</ul>
  				</div>
			</div>
	
			<!-- Unidade herói destacando o título do projeto -->
      		<div class="hero-unit">
        		<<img src="https://mir-s3-cdn-cf.behance.net/project_modules/1400/7daef545930001.5841992a9b683.jpg" alt="Red-icon" width="100 height="100" align ='left'>
        		<h1>Red</h1>
        		<p>Sistema Inteligente e Moderno</p>
        		<!-- 
        			Botão "Saiba Mais" desativado
        			<p><a class="btn btn-primary btn-large">Saiba Mais &raquo;</a></p> 
        		-->
      		</div>	
			
			<!-- Alerta de erro no login -->
			<div class="alert alert-error">
  				<button type="button" class="close" data-dismiss="alert">×</button>
  				<a href="#" class="close" data-dismiss="alert">×</a>
  				<h4>Falha na Autenticação!</h4>
  				Nome de usuário inexistente ou senha incorreta. Por favor, faça o login novamente.
			</div>
			
			<!-- Formulário de Login -->
			<div class="container">
      			<form class="form-signin" method="POST" action="checa_login.jsp">
        			<h2 class="form-signin-heading">Login</h2>
        			<input type="text" class="input-block-level" placeholder="Digite seu login" name="login">
        			<input type="password" class="input-block-level" placeholder="Digite sua Senha" name="senha">        
        			<!-- 
        				Checkbox "Lembre-se de mim" desativada 
        				<label class="checkbox">
          					<input type="checkbox" value="remember-me"> Remember me
        				</label> 
        			-->        
       				<button class="btn btn-large btn-primary" type="submit">Entrar</button>
      			</form>
      			<p><a href = "recupera_senha_login.jsp">Esqueci o Login e/ou a Senha</a></p> 
    		</div>
	
			<!-- 
				Barra de navegação inferior desativada, substituída pelo rodapé fixo 
				<div class="navbar navbar-fixed-bottom navbar-inverse">
  					<div class="navbar-inner">    
    					<ul class="nav">
      						<li><a href="#">Aluno: Thiago Pimentel Luiz Vianna</a></li>
      						<li><a href="#">Orientador: Prof. Dr. Orlando Bernardo Filho</a></li>
      						<li><a href="#">Julho - 2015</a></li>
    					</ul>
  					</div>
				</div>
			-->
	
			<div id="push"></div>
    	</div>
    	<!-- Fim do encapsulamento da página -->

    	<!-- Rodapé fixo -->
    	<div id="footer">
    		<div class="container">
        		<p class="muted credit">Sistema Informatizado para Restaurante -         								
        								(Versão 0.0.1)</p>
      		</div>
    	</div>

    	<!-- jQuery (necessario para o carregamento dos plugins JavaScript do Bootstrap) -->
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    
    	<!-- Incluusão dos plugins compilados do Boostrap, conforme a necessidade -->
    	<script src="js/bootstrap.min.js"></script>
    
  	</body>
  
</html>