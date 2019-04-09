package controlador;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conexion.conexion;
import entidades.Camarero;

//Se obtiene todos los datos del camarero guardadas en la BD
public class CamarerosDAO {
	public ArrayList<Camarero> getAll (){  
		conexion c = new conexion();
		java.sql.Connection con = c.getConexion();
		PreparedStatement sta = null;
		
		ArrayList<Camarero> camareros = new ArrayList<Camarero>() ;
		

		try {
			sta = con.prepareStatement("select * from Camarero ");
		
		
		ResultSet resp = null;
		try {
			resp = sta.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		while (resp.next())
	      {
	         Camarero camarero = new Camarero ();
	         camarero.setIdcamarero(resp.getInt("IDCAMARERO"));
	         camarero.setNombre(resp.getString("NOMBRE"));
	         camarero.setApellido1(resp.getString("APELLIDO1"));
	         
	         camareros.add(camarero);
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
		
		return camareros ; 
	}
}
