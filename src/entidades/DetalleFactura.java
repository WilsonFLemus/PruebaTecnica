package entidades;
//Atributos de la clase detalle factura, con los metodos get y set
public class DetalleFactura {
	int idfactura ,iddetallefactura,	idcocinero  ,importe;
	String plato ;
	public int getIdfactura() {
		return idfactura;
	}
	public void setIdfactura(int idfactura) {
		this.idfactura = idfactura;
	}
	public int getIddetallefactura() {
		return iddetallefactura;
	}
	public void setIddetallefactura(int iddetallefactura) {
		this.iddetallefactura = iddetallefactura;
	}
	public int getIdcocinero() {
		return idcocinero;
	}
	public void setIdcocinero(int idcocinero) {
		this.idcocinero = idcocinero;
	}
	public String getPlato() {
		return plato;
	}
	public void setPlato(String plato) {
		this.plato = plato;
	}
	public int getImporte() {
		return importe;
	}
	public void setImporte(int importe) {
		this.importe = importe;
	}
	
}
