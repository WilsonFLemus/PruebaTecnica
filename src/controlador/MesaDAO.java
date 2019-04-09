package controlador;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conexion.conexion;
import entidades.Mesa;

//Se obtiene los datos de todas las mesas 

public class MesaDAO {

public ArrayList<Mesa> getAll (){  
	conexion c = new conexion();
	java.sql.Connection con = c.getConexion();
	

	
	ArrayList<Mesa> mesas = new ArrayList<Mesa>() ;
	try {
		PreparedStatement sta = con.prepareStatement("select * from MESA   ");
	

	

	
		sta = con.prepareStatement("select * from MESA   ");
	
	
	ResultSet resp = null;
	try {
		resp = sta.executeQuery();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	while (resp.next())
      {
         Mesa mesa = new Mesa ();
         mesa.setIdmesa(resp.getInt("IdMesa"));
         mesa.setNmaxcomensales(resp.getInt("NumMaxComensa"));
         mesa.setUbicacion(resp.getString("Ubicacion"));
         
         mesas.add(mesa);
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
	
	return mesas ; 

}
}
