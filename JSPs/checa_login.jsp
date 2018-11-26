<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="DAO.*" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String varLogin = request.getParameter("login");
	    String varSenha = request.getParameter("senha");		
		FuncionarioDAO fdao = new FuncionarioDAO();
		
		fdao.conexaoBD();		
		
		boolean achouFuncionario = fdao.validaLogin(varLogin, varSenha);
				
		if (achouFuncionario) 
		
			{
				session.putValue("loginUsuario", varLogin);
				response.sendRedirect("menu.jsp");				
			}		
		else response.sendRedirect("falha_login.jsp");
	%> 
</body>
</html>