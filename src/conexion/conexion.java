package conexion;

import java.sql.Connection;
import java.sql.DriverManager;

public class conexion {

    static Connection con = null;
    private String url = "jdbc:mysql://localhost/pruebaconexia?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    private String user = "root";
    private String pass = "";
    
    public conexion(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
            System.out.println("ERROR EN LA CONEXION A LA BD. Error: " + e.getMessage());
        }
    }
    
    public Connection getConexion(){
        return con;
    }
		
    public void cerrarConexion(){
        if(con != null){
            try {
                con.close();
            } catch (Exception e) {
                System.err.println("Error al cerrar. Error: " + e.getMessage());
            }
        }
    }	
}
