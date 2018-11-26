package Modelo;

import java.sql.Date;

public class pedido {
	int codigoPedido;
	String obsevacao;
	int quantidade;
	int mesa;
	Date data;
	int cpfCliente;
	public int getCodigoPedido() {
		return codigoPedido;
	}
	public void setCodigoPedido(int codigoPedido) {
		this.codigoPedido = codigoPedido;
	}
	public String getObsevacao() {
		return obsevacao;
	}
	public void setObsevacao(String obsevacao) {
		this.obsevacao = obsevacao;
	}
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	public int getMesa() {
		return mesa;
	}
	public void setMesa(int mesa) {
		this.mesa = mesa;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public int getCpfCliente() {
		return cpfCliente;
	}
	public void setCpfCliente(int cpfCliente) {
		this.cpfCliente = cpfCliente;
	}
	
	
}
