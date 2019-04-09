package presentacion;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controlador.FacturaDAO;
import entidades.Factura;

/**
 * Servlet implementation class Facturar
 */
@WebServlet("/Facturar")
public class Facturar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Facturar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nfact    = request.getParameter("nfact");
		String ncliente = request.getParameter("ncliente");			
		String nmesa    = request.getParameter("nmesa");
		String ncamarero = request.getParameter("ncamarero");		
		System.out.println(nfact);
                System.out.println(ncliente);
                System.out.println(nmesa);
                System.out.println(ncamarero);
                
// Serverlet al que llegan los datos de la vista y los guarda usando DAO (Facturas)

		String respuesta  = "Factura creada";
		
	    Factura factura  = new Factura ();
	    FacturaDAO cont = new FacturaDAO ();
	    
	    try{
	    factura.setIdfactura(Integer.valueOf(nfact));
	    factura.setIdcliente(Integer.valueOf(ncliente));
	    factura.setIdmesa(Integer.valueOf(nmesa));
	    factura.setIdcamarero(Integer.valueOf(ncamarero));
	    
	    cont.guardar(factura);
	    }catch(Exception e){
	    	e.printStackTrace();
	    	respuesta = "Error al Crear Factura <br>  campo vacio o factura ya existe" ;
	    }
	    
	    response.setContentType( "text/html; charset=utf-8" );		
		PrintWriter out = response.getWriter();        		
		out.println(respuesta);
	    
	}

}
