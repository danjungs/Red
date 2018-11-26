<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.*" %>
<%@ page import="Modelo.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

//String varLoginProfessor = request.getParameter("LOGIN");
String varNome = request.getParameter("NOME");
String varLogin = request.getParameter("LOGIN");
String varSenha = request.getParameter("SENHA");
int varCodigo = Integer.parseInt(request.getParameter("cod"));

if ( (varLogin.equals("")) || (varNome.equals("")) || (varSenha.equals("")))
	  
{
	
	out.println("<SCRIPT language='JavaScript'>");
	out.println("alert('TODOS OS CAMPOS DEVEM SER PREENCHIDOS!');");
	out.println("history.go(-1);");
	out.println("</SCRIPT>");
	
}
else 
{

Pessoa p = new Pessoa();
PessoaDAO pdao = new PessoaDAO();

p.setLogin(varLogin); //System.out.println("Login = " + varLogin + "p= " + p.getLogin());
p.setSenha(varSenha); //System.out.println("Senha = " + varSenha + "p= " + p.getSenha());
p.setNome(varNome); //System.out.println("Nome = " + varNome + "p= " + p.getNome());
p.setCodigo(varCodigo);

pdao.atualizar(p);

// Retorno
out.println("<SCRIPT language='JavaScript'>");
//if (res > 0) {
  out.println("alert('REGISTRO ALTERADO COM ÊXITO');");
//} else {
//  out.println("alert('FALHA NA ALTERAÇÃO');");
//}
//out.println("history.go(-2);");
out.println("document.location.href='menu.jsp';");
out.println("</SCRIPT>");
}
%>