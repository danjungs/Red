package DAO;

import java.sql.*;
import Modelo.*;

public class EstoqueDAO {
	
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
	
	public estoque[] consultaTodos ()
	{
		int totalEstoque = 7; 
		estoque[] e1 = new estoque[1];
	    try {  	  
	     	String query = "SELECT * FROM estoque Order by idItem";
	       	ResultSet rs = stmt.executeQuery("SELECT COUNT(idItem)FROM estoque");
	       	if (rs.next()) totalEstoque = rs.getInt(1);
	     	rs = stmt.executeQuery(query);
	     	estoque[] e = new estoque[totalEstoque];
	       	int i = 0;
	   	    while (rs.next()) {
	   	    	e[i] = new estoque();
	   	    	e[i].setCodigoItem(rs.getInt("idItem"));
	   	    	e[i].setItem(rs.getString("item"));
	   	    	e[i].setQuantidade(rs.getInt("quantidade"));
	   	    	e[i].setValidade(rs.getDate("validade"));
	   	    	
  	            i++;
	        }
	        return e;
	      }  catch (SQLException e) {
	        System.err.print("Erro no SQL: " + e.getMessage());
	      }
	   return e1;   
	}
	
	public Pessoa consultaPorCodigo (int codigo){
		Pessoa p = null;
		try {  	  
	     	String query = "SELECT * FROM estoque where codigoFun = " + codigo;
	     	ResultSet rs = stmt.executeQuery(query);
	     	
	     	if (rs.next()) {
	     		p = new Pessoa();
	     		p.setCodigo(rs.getInt("codigo"));
	   	    	p.setLogin(rs.getString("login"));
	   	    	p.setSenha(rs.getString("senha"));
	   	    	p.setNome(rs.getString("nome"));	
	        }
	        return p;
	      }  catch (SQLException e) {
	        System.err.print("Erro no SQL: " + e.getMessage());
	      }
	   return p;   
	}
	
	public void atualizar (Pessoa pessoa) {

		// Cria um PreparedStatement
		PreparedStatement pstm = null;
		
		conexaoBD ();
		 try {
		 // Monta a string sql
		String sql = "update pessoa " +
	                 "set nome = ?, login = ?, senha = ? " +
	                 "where codigo = ?";

		// Passa a string para o PreparedStatement
		 pstm = con.prepareStatement(sql);

		// Coloca os verdadeiros valores no lugar dos ?
		 pstm.setString(1, pessoa.getNome());
		 pstm.setString(2, pessoa.getLogin());
		 pstm.setString(3, pessoa.getSenha());
		 pstm.setInt(4, pessoa.getCodigo());
		// Executa
		 pstm.execute();
		 } catch (SQLException e) {
		// Retorna uma mensagem informando o erro
		 System.out.println("N�o foi poss�vel salvar os dados!\nInforma��es sobre o erro:");	 
		 e.printStackTrace();
		 }
	}

}
