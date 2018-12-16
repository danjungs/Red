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
String varItem = request.getParameter("ITEM");
String varPreco = request.getParameter("PRECO");
int varCodigo = Integer.parseInt(request.getParameter("cod"));

System.out.println("ITEM= "+varItem+"  PREÇO= " + varPreco);

if ( (varItem.equals("")) || (varPreco.equals("")))  
{
	
	out.println("<SCRIPT language='JavaScript'>");
	out.println("alert('TODOS OS CAMPOS DEVEM SER PREENCHIDOS!');");
	out.println("history.go(-1);");
	out.println("</SCRIPT>");
	
}
else 
{

cardapio c = new cardapio();
CardapioDAO cdao = new CardapioDAO();

c.setItem(varItem); //System.out.println("Login = " + varLogin + "p= " + p.getLogin());
c.setPreco(Float.parseFloat(varPreco)); //System.out.println("Senha = " + varSenha + "p= " + p.getSenha());
c.setCodigoItem(varCodigo);

cdao.atualizar(c); 

// Retorno
out.println("<SCRIPT language='JavaScript'>");
//if (res > 0) {
  out.println("alert('REGISTRO ALTERADO COM ÊXITO');");
//} else {
//  out.println("alert('FALHA NA ALTERAÇÃO');");
//}
//out.println("history.go(-2);");
out.println("document.location.href='consultar_cardapio.jsp';");
out.println("</SCRIPT>");
}
%>