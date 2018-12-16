package DAO;

import java.sql.*;
import Modelo.*;

public class CardapioDAO {
	
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
	
	public cardapio[] consultaTodos ()
	{
		int totalCardapio = 7; 
		cardapio[] p1 = new cardapio[1];
	    try {  	  
	     	String query = "SELECT * FROM cardapio Order by codigoProd";
	       	ResultSet rs = stmt.executeQuery("SELECT COUNT(codigoProd)FROM cardapio");
	       	if (rs.next()) totalCardapio = rs.getInt(1);
	     	rs = stmt.executeQuery(query);
	     	cardapio[] c = new cardapio[totalCardapio];
	       	int i = 0;
	   	    while (rs.next()) {
	   	    	c[i] = new cardapio();
	   	    	c[i].setCodigoItem(rs.getInt("codigoProd"));
	   	    	c[i].setItem(rs.getString("item"));
	   	    	c[i].setPreco(rs.getFloat("preco"));
	   	    	
  	            i++;
	        }
	        return c;
	      }  catch (SQLException e) {
	        System.err.print("Erro no SQL: " + e.getMessage());
	      }
	   return p1;   
	}
	
	public cardapio consultaPorCodigo (int codigo){
		cardapio c = null;
		try {  	  
	     	String query = "SELECT * FROM cardapio where codigoProd = " + codigo;
	     	ResultSet rs = stmt.executeQuery(query);
	     	
	     	if (rs.next()) {
	     		c = new cardapio();
	     		c.setCodigoItem(rs.getInt("codigoProd"));
	   	    	c.setItem(rs.getString("item"));
	   	    	c.setPreco(rs.getFloat("senha"));
	        }
	        return c;
	      }  catch (SQLException e) {
	        System.err.print("Erro no SQL: " + e.getMessage());
	      }
	   return c;   
	}
	
	public void atualizar (cardapio cardapio) {

		// Cria um PreparedStatement
		PreparedStatement pstm = null;
		
		conexaoBD ();
		 try {
		 // Monta a string sql
		String sql = "update cardapio " +
	                 "set item = ?, preco = ?" +
	                 "where codigoProd = ?";

		// Passa a string para o PreparedStatement
		 pstm = con.prepareStatement(sql);

		// Coloca os verdadeiros valores no lugar dos ?
		 pstm.setString(1, cardapio.getItem());
		 pstm.setFloat(2, cardapio.getPreco());
		 pstm.setInt(3, cardapio.getCodigoItem());
		// Executa
		 pstm.execute();
		 } catch (SQLException e) {
		// Retorna uma mensagem informando o erro
		 System.out.println("N�o foi poss�vel salvar os dados!\nInforma��es sobre o erro:");	 
		 e.printStackTrace();
		 }
	}

}
