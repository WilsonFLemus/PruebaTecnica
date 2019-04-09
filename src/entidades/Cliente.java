package entidades;
//Atributos de la clase cliente, con los metodos get y set
public class Cliente {

int 	idcliente ; 
String nombre , apellido1 , apellido2 , observaciones  ;

public int getIdcliente() {
	return idcliente;
}

public void setIdcliente(int idcliente) {
	this.idcliente = idcliente;
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

public String getObservaciones() {
	return observaciones;
}

public void setObservaciones(String observaciones) {
	this.observaciones = observaciones;
} 
}
