package entidades;
//Atributos de la clase camarero, con los metodos get y set
public class Camarero {
	int idcamarero ;
	String nombre,	apellido1,	apellido2 ;
	public int getIdcamarero() {
		return idcamarero;
	}
	public void setIdcamarero(int idcamarero) {
		this.idcamarero = idcamarero;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido1() {
		return apellido1;
	}
	public void setApellido1(String apellido1) {
		this.apellido1 = apellido1;
	}
	public String getApellido2() {
		return apellido2;
	}
	public void setApellido2(String apellido2) {
		this.apellido2 = apellido2;
	}
	
}
