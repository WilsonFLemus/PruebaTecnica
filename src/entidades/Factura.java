package entidades;
//Atributos de la clase factura, con los metodos get y set
public class Factura {
    
	int idfactura ,	idcliente,	idcamarero ,	idmesa;
	String fechafact ;
	public int getIdfactura() {
		return idfactura;
	}
	public void setIdfactura(int idfactura) {
		this.idfactura = idfactura;
	}
	public int getIdcliente() {
		return idcliente;
	}
	public void setIdcliente(int idcliente) {
		this.idcliente = idcliente;
	}
	public int getIdcamarero() {
		return idcamarero;
	}
	public void setIdcamarero(int idcamarero) {
		this.idcamarero = idcamarero;
	}
	public int getIdmesa() {
		return idmesa;
	}
	public void setIdmesa(int idmesa) {
		this.idmesa = idmesa;
	}
	public String getFechafact() {
		return fechafact;
	}
	public void setFechafact(String fechafact) {
		this.fechafact = fechafact;
	} 
}
