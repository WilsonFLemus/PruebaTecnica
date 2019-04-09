package controlador;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conexion.conexion;
import entidades.Cliente;
public class ClientesDAO {
  
 //Se obtiene todos los datos del cliente guardadas en la BD
	public ArrayList<Cliente> getAll (){  
		conexion c = new conexion();
		java.sql.Connection con = c.getConexion();
		PreparedStatement sta = null;
		
		ArrayList<Cliente> clientes = new ArrayList<Cliente>() ;
		

		try {
			sta = con.prepareStatement("select * from Cliente   ");
		
		
		ResultSet resp = null;
		try {
			resp = sta.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		while (resp.next())
	      {
	         Cliente cliente = new Cliente ();
	         cliente.setIdcliente(resp.getInt("IDCLIENTE"));
	         cliente.setNombre(resp.getString("NOMBRE"));
	         cliente.setApellido1(resp.getString("APELLIDO1"));
	         
	         
	         clientes.add(cliente);
	      }
		try {
			resp.close();
			sta.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		return clientes ; 
	}
}
