package presentacion;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controlador.DetalleDAO;
import controlador.FacturaDAO;
import entidades.DetalleFactura;
import entidades.Factura;

/**
 * Servlet implementation class Factdetalle
 */
@WebServlet("/Factdetalle")
public class Factdetalle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Factdetalle() {
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
		String deta = request.getParameter("deta");
		String nfact    = request.getParameter("nfact");
		String plato = request.getParameter("plato");			
		String importe    = request.getParameter("importe");
		String cocinero = request.getParameter("cocinero");		
		
	// Serverlet al que llegan los datos de la vista y los guarda usando DAO (Detalles de factura)
		
		String respuesta  = "detalle añadido";
		
	    DetalleFactura defactura  = new DetalleFactura ();
	    DetalleDAO cont = new DetalleDAO ();
	    
	    try{
	    	defactura.setIddetallefactura(Integer.valueOf(deta));
	    	defactura.setIdfactura(Integer.valueOf(nfact));
	    	defactura.setPlato(plato);
	    	defactura.setImporte(Integer.valueOf(importe));
	    	defactura.setIdcocinero(Integer.valueOf(cocinero));
	    
	    cont.guardar(defactura);
	    }catch(Exception e){
	    	e.printStackTrace();
	    	respuesta = "Error al añadir detalle " ;
	    }
	    
	    response.setContentType( "text/html; charset=utf-8" );		
		PrintWriter out = response.getWriter();        		
		out.println(respuesta);
	
	}

}
