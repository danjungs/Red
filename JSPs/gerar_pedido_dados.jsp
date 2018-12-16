<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="DAO.*" %>
<%@ page import="Modelo.*" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Computando</title>
</head>
<body>
Incluindo dados
<%

PedidoDAO pdao = new PedidoDAO();

pdao.conexaoBD();

String varItem = request.getParameter("ITEM");
String varObservacao = request.getParameter("OBSERVACAO");
String varQuantidade = request.getParameter("QUANTIDADE");
String varMesa = request.getParameter("MESA");
String varGarcom = request.getParameter("GARCOM");
String varCpf = request.getParameter("CPF");
String varStatus = "Ativo";
java.sql.Date varDate = new java.sql.Date(Calendar.getInstance().getTime().getTime());

if ( (varItem.equals("")) || (varObservacao.equals("")) || (varQuantidade.equals("")) || (varMesa.equals(""))
	  || varGarcom.equals("") || varCpf.equals(""))
{
	
	out.println("<SCRIPT language='JavaScript'>");
	out.println("alert('TODOS OS CAMPOS DEVEM SER PREENCHIDOS!');");
	out.println("history.go(-1);");
	out.println("</SCRIPT>");
	
}
 else {

pedido p = new pedido();
	
p.setIditem(Integer.parseInt(varItem));
p.setObservacao(varObservacao);
p.setQuantidade(Integer.parseInt(varQuantidade));
p.setMesa(Integer.parseInt(varMesa));
p.setCodigoGarcom(Integer.parseInt(varGarcom));
p.setStatus(varStatus);
p.setData(varDate);
p.setCpfCliente(Integer.parseInt(varCpf));

//AlunoDAO adao = new AlunoDAO();
pdao.inserir(p);

out.println("<SCRIPT language='JavaScript'>");
out.println("alert('CADASTRO CONCLUÍDO COM ÊXITO');");
out.println("history.go(-2);");
out.println("</SCRIPT>");

}
%>
</body>
</html>