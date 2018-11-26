package DAO;

import java.sql.*;
import Modelo.*;

public class PessoaDAO {
	
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

	public boolean validaLogin (String login, String senha){
		try {  	  
	     	String query = "SELECT * FROM funcionarios where login = '" + login + "'";
	     	ResultSet rs = stmt.executeQuery(query);
	     	if (rs.next()) {
	     		if (rs.getString("senha").equals(senha))
	     		   return true;
	        } 
	     	else{
	        	return false;
	        }
	      }  catch (SQLException e) {
	        System.err.print("Erro no SQL: " + e.getMessage());
	      }
	   return false;   
	}
	
	public Pessoa[] consultaTodos ()
	{
		int totalPessoas = 7; 
		Pessoa[] p1 = new Pessoa[1];
	    try {  	  
	     	String query = "SELECT * FROM funcionarios Order by nome";
	       	ResultSet rs = stmt.executeQuery("SELECT COUNT(codigoFun)FROM funcionarios");
	       	if (rs.next()) totalPessoas = rs.getInt(1);
	     	rs = stmt.executeQuery(query);
	     	Pessoa[] p = new Pessoa[totalPessoas];
	       	int i = 0;
	   	    while (rs.next()) {
	   	    	p[i] = new Pessoa();
	   	    	p[i].setCodigo(rs.getInt("codigoFun"));
	   	    	p[i].setLogin(rs.getString("login"));
	   	    	p[i].setSenha(rs.getString("senha"));
	   	    	p[i].setNome(rs.getString("nome"));
  	            i++;
	        }
	        return p;
	      }  catch (SQLException e) {
	        System.err.print("Erro no SQL: " + e.getMessage());
	      }
	   return p1;   
	}
	
	public Pessoa consultaPorCodigo (int codigo){
		Pessoa p = null;
		try {  	  
	     	String query = "SELECT * FROM funcionarios where codigoFun = " + codigo;
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
