package entidades;
//Atributos de la clase mesa, con los metodos get y set
public class Mesa {
    int  idmesa ,nmaxcomensales ; 
	String ubicacion ;
	public int getIdmesa() {
		return idmesa;
	}
	public void setIdmesa(int idmesa) {
		this.idmesa = idmesa;
	}
	public int getNmaxcomensales() {
		return nmaxcomensales;
	}
	public void setNmaxcomensales(int nmaxcomensales) {
		this.nmaxcomensales = nmaxcomensales;
	}
	public String getUbicacion() {
		return ubicacion;
	}
	public void setUbicacion(String ubicacion) {
		this.ubicacion = ubicacion;
	} 
}
