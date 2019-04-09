package controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import conexion.conexion;
import entidades.DetalleFactura;
import entidades.Factura;

//Inserta los detalles de las facturas en BD
public class DetalleDAO {
    
    public void guardar (DetalleFactura ev){
        conexion c = new conexion();
        Connection con = c.getConexion();	
        
        try {
            PreparedStatement query = con.prepareStatement("INSERT INTO detallefactura (IdFactura,IdDetalleFactura,IdCocinero,Plato,Importe) " 
                                +"VALUES (?,?,?,?,?)");
            query.setInt(1,ev.getIdfactura());
            query.setInt(2,ev.getIddetallefactura());
            query.setInt(3,ev.getIdcocinero());
            query.setString(4,ev.getPlato());
            query.setInt(5,ev.getImporte());                          
            query.executeUpdate();
           
            query.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
}
