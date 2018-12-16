package DAO;

import java.sql.*;
import Modelo.*;

public class PedidoDAO {
	
	Statement stmt;
	Connection con;

	public void conexaoBD ()
	{
	try {
	    Class.forName("com.mysql.jdbc.Driver");
	    String url = "jdbc:mysql://localhost:3306/Red";
	    con = DriverManager.getConnection(url, "root", "senha");

	    stmt = con.createStatement();

	  }  catch(java.lang.ClassNotFoundException e) {
	    System.err.print("Erro na Classe: " + e.getMessage());
	  } catch (SQLException e) {
	    System.err.print("Erro no SQL: " + e.getMessage());
	  }
	}	
	
	public pedido[] consultaTodos ()
	{
		int totalPedido = 7; 
		pedido[] p1 = new pedido[1];
	    try {  	  
	     	String query = "SELECT * FROM pedido Order by mesa";
	       	ResultSet rs = stmt.executeQuery("SELECT COUNT(codigoPedido)FROM pedido");
	       	if (rs.next()) totalPedido = rs.getInt(1);
	     	rs = stmt.executeQuery(query);
	     	pedido[] p = new pedido[totalPedido];
	       	int i = 0;
	   	    while (rs.next()) {
	   	    	p[i] = new pedido();
	   	    	p[i].setCodigoPedido(rs.getInt("codigoPedido"));
	   	    	p[i].setIditem(rs.getInt("idItem"));
	   	    	p[i].setObservacao(rs.getString("observacao"));
	   	    	p[i].setQuantidade(rs.getInt("quantidade"));
	   	    	p[i].setMesa(rs.getInt("mesa"));
	   	    	p[i].setCodigoGarcom(rs.getInt("codigoGarcom"));
	   	    	p[i].setStatus(rs.getString("status"));
	   	    	p[i].setData(rs.getDate("data"));
	   	    	p[i].setCpfCliente(rs.getInt("cpfCliente"));
  	            i++;
	        }
	        return p;
	      }  catch (SQLException e) {
	        System.err.print("Erro no SQL: " + e.getMessage());
	      }
	   return p1;   
	}
	
	public pedido consultaPorCodigo (int codigo){
		pedido p = null;
		try {  	  
	     	String query = "SELECT * FROM pedido where codigoPedido = " + codigo;
	     	ResultSet rs = stmt.executeQuery(query);
	     	
	     	if (rs.next()) {
	     		p = new pedido();
	     		p.setCodigoPedido(rs.getInt("codigoPedido"));
	   	    	p.setIditem(rs.getInt("idItem"));
	   	    	p.setObservacao(rs.getString("observacao"));
	   	    	p.setQuantidade(rs.getInt("quantidade"));
	   	    	p.setMesa(rs.getInt("mesa"));
	   	    	p.setCodigoGarcom(rs.getInt("codigoGarcom"));
	   	    	p.setStatus(rs.getString("status"));
	   	    	p.setData(rs.getDate("data"));
	   	    	p.setCpfCliente(rs.getInt("cpfCliente"));	
	        }
	        return p;
	      }  catch (SQLException e) {
	        System.err.print("Erro no SQL: " + e.getMessage());
	      }
	   return p;   
	}
	
	public void atualizar (pedido pedido) {

		// Cria um PreparedStatement
		PreparedStatement pstm = null;
		
		conexaoBD ();
		 try {
		 // Monta a string sql
		String sql = "update pedido " +
	                 "set idItem = ?, observacao = ?, quantidade = ? " +
	                 "where codigoPedido = ?";

		// Passa a string para o PreparedStatement
		 pstm = con.prepareStatement(sql);

		// Coloca os verdadeiros valores no lugar dos ?
		 pstm.setInt(1, pedido.getIditem());
		 pstm.setString(2, pedido.getObservacao());
		 pstm.setInt(3, pedido.getQuantidade());
		 pstm.setInt(4, pedido.getCodigoPedido());
		// Executa
		 pstm.execute();
		 } catch (SQLException e) {
		// Retorna uma mensagem informando o erro
		 System.out.println("N�o foi poss�vel salvar os dados!\nInforma��es sobre o erro:");	 
		 e.printStackTrace();
		 }
	}
	public void atualizar_status (pedido pedido) {

		// Cria um PreparedStatement
		PreparedStatement pstm = null;
		
		conexaoBD ();
		 try {
		 // Monta a string sql
		String sql = "update pedido " +
	                 "set status = ?" +
	                 "where codigoPedido = ?";

		// Passa a string para o PreparedStatement
		 pstm = con.prepareStatement(sql);

		// Coloca os verdadeiros valores no lugar dos ?
		 pstm.setString(1, pedido.getStatus());
		 pstm.setInt(2, pedido.getCodigoPedido());
		// Executa
		 pstm.execute();
		 } catch (SQLException e) {
		// Retorna uma mensagem informando o erro
		 System.out.println("N�o foi poss�vel salvar os dados!\nInforma��es sobre o erro:");	 
		 e.printStackTrace();
		 }
	}
	
	public void inserir(pedido pedido) {

		// Cria um PreparedStatement
		PreparedStatement pstm = null;
		
		conexaoBD ();
		 try {
		 // Monta a string sql
		String sql = "insert into pedido (idItem, " +
				                          "observacao, " +
				                          "quantidade, " +
				                          "mesa, " +
				                          "codigoGarcom, " +
				                          "status, " +
				                          "data, " +
				                          "cpfCliente) " +
				     "values(?,?,?,?,?,?,?,?)";

		// Passa a string para o PreparedStatement
		 pstm = con.prepareStatement(sql);

		// Coloca os verdadeiros valores no lugar dos ?
		pstm.setInt(1, pedido.getIditem());
		pstm.setString(2, pedido.getObservacao());
		pstm.setInt(3, pedido.getQuantidade());
		pstm.setInt(4, pedido.getMesa());
		pstm.setInt(5, pedido.getCodigoGarcom());
		pstm.setString(6, pedido.getStatus());
		pstm.setDate(7, pedido.getData());
		pstm.setInt(8, pedido.getCpfCliente());
		// Executa
		 pstm.execute();
		 } catch (SQLException e) {
		// Retorna uma mensagem informando o erro
			 System.out.println("Não foi possível salvar os dados!\nInformações sobre o erro:");
		 e.printStackTrace();
		 }
	}	


}
