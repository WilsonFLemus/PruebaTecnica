package controlador;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

import conexion.conexion;
import entidades.Cliente;
import entidades.Factura;


//Inserta factura a la BD
public class FacturaDAO {
	
    public void guardar (Factura ev){
        conexion c = new conexion();
        Connection con = c.getConexion();

        try {
            PreparedStatement query = con.prepareStatement("INSERT INTO factura (IdFactura,IdCliente,IdCamarero,IdMesa,FechaFactura) "
                                                                                                        +"VALUES (?,?,?,?,NOW())");		    
            query.setInt(1,ev.getIdfactura());
            query.setInt(2,ev.getIdcliente());
            query.setInt(3,ev.getIdcamarero());
            query.setInt(4,ev.getIdmesa());
            query.executeUpdate();
            query.close();
        }catch (SQLIntegrityConstraintViolationException e) {
            try {
                PreparedStatement query = con.prepareStatement("UPDATE factura SET IdCliente=?,IdCamarero=?,IdMesa=?,FechaFactura=? "					
                                            + "  WHERE IdFactura =? ");
                query.setInt(1,ev.getIdcliente());
                query.setInt(2,ev.getIdcamarero());
                query.setInt(3,ev.getIdmesa());
                query.setString(4,ev.getFechafact()); 
                query.setInt(5,ev.getIdfactura());
                query.executeUpdate();
                con.commit();
                query.close();	
            } catch (SQLException e1) {					
                e1.printStackTrace();
            }                 				               

        }catch(SQLException e) {		
            e.printStackTrace();
        }
       
    }
    public ArrayList<Factura> getAll (){  
            conexion c = new conexion();
            java.sql.Connection con = c.getConexion();
            PreparedStatement sta = null;

            ArrayList<Factura> facturas = new ArrayList<Factura>() ;


            try {
                    sta = con.prepareStatement("select * from factura   ");


            ResultSet resp = null;
            try {
                    resp = sta.executeQuery();
            } catch (SQLException e) {
                    e.printStackTrace();
            }

            while (resp.next())
          {
             Factura factura = new Factura ();
             factura.setIdfactura(resp.getInt("IdFactura"));
             factura.setIdcliente(resp.getInt("IdCliente"));
             factura.setFechafact(resp.getString("FechaFactura"));	         
             facturas.add(factura);
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

            return facturas ; 
    }
}
