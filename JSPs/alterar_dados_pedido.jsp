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
String varObservacao = request.getParameter("OBSERVACAO");
String varQuantidade = request.getParameter("QUANTIDADE");
int varCodigo = Integer.parseInt(request.getParameter("cod"));

if ( (varItem.equals("")) || (varObservacao.equals("")) || (varQuantidade.equals("")))
	  
{
	
	out.println("<SCRIPT language='JavaScript'>");
	out.println("alert('TODOS OS CAMPOS DEVEM SER PREENCHIDOS!');");
	out.println("history.go(-1);");
	out.println("</SCRIPT>");
	
}
else 
{

pedido p = new pedido();
PedidoDAO pdao = new PedidoDAO();

p.setIditem(Integer.parseInt(varItem)); //System.out.println("Login = " + varLogin + "p= " + p.getLogin());
p.setObservacao(varObservacao); //System.out.println("Senha = " + varSenha + "p= " + p.getSenha());
p.setQuantidade(Integer.parseInt(varQuantidade)); //System.out.println("Nome = " + varNome + "p= " + p.getNome());
p.setCodigoPedido(varCodigo);

pdao.atualizar(p); 

// Retorno
out.println("<SCRIPT language='JavaScript'>");
//if (res > 0) {
  out.println("alert('REGISTRO ALTERADO COM ÊXITO');");
//} else {
//  out.println("alert('FALHA NA ALTERAÇÃO');");
//}
//out.println("history.go(-2);");
out.println("document.location.href='consultar_pedido.jsp';");
out.println("</SCRIPT>");
}
%>