
<%@page import="controlador.MesaDAO"%>
<%@page import="controlador.ClientesDAO"%>
<%@page import="controlador.CamarerosDAO"%>
<%@page import="controlador.FacturaDAO"%>
<%@page import="entidades.Mesa"%>
<%@page import="entidades.Cliente"%>
<%@page import="entidades.Factura"%>
<%@page import="entidades.Camarero"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" %>
<%--importamos la libreria de java.sql.* --%>
<%@ page import = "java.sql.*" %>  
<%@ page import = "java.sql.*" %>  

<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> 
<div class="container" style="border-radius:10px; border: solid; border-color:#990000; margin-top:20px; ">
<h2> Crear Factura </h2>
<br>
   
    <input  type="number"  id = "idfact" name="idfact" placeholder="No Factura"  />
    
    <% 
        MesaDAO cmesas = new MesaDAO();        
   		ClientesDAO ccliente = new ClientesDAO();
   		CamarerosDAO ccamareros = new CamarerosDAO();
   		
		ArrayList<Mesa> mesas = cmesas.getAll();
		ArrayList<Cliente> clientes = ccliente.getAll();
		ArrayList<Camarero> camareros = ccamareros.getAll();
		
		
		out.println("<h3>MESA </h3>");
		out.println("<select class='form-control' id= 'mesa' placeholder = 'Mesa' > ");
		for (int i = 0 ; i< mesas.size() ; i++){
			out.println("<option value= '"+mesas.get(i).getIdmesa()+"' >" +mesas.get(i).getUbicacion() +"-"+ mesas.get(i).getNmaxcomensales() + "</option>");
		}
		out.println("</select> ");
		out.println("<h3>CLIENTE </h3>");
		out.println("<select class='form-control' id= 'cliente' placeholder = 'Cliente' > ");
		for (int i = 0 ; i< clientes.size() ; i++){
			out.println("<option value= '"+clientes.get(i).getIdcliente()+"' >" +clientes.get(i).getNombre() +"-"+ clientes.get(i).getApellido1() + "</option>");
		}
		out.println("</select> ");
		out.println("<h3>CAMARERO </h3>");
		out.println("<select class='form-control' id= 'camarero' placeholder = 'Camarero' > ");
		for (int i = 0 ; i< camareros.size() ; i++){
			out.println("<option value= '"+camareros.get(i).getIdcamarero()+"' >" +camareros.get(i).getNombre() +"-"+ camareros.get(i).getApellido1() + "</option>");
		}
		out.println("</select> ");
		%>
    <br>
    
    <input class='btn btn-danger' type="button" onclick = "crearfact() "  value ="crear factura" />  
    
     
    </div>

<div class="container" style="border-radius:10px; border: solid; border-color:#990000; margin-top:20px; ">
<h2> Añadir detalles de factura  </h2>
<br>
   
     
    <% 
        FacturaDAO cfact = new FacturaDAO();        
   		
		ArrayList<Factura> facturas = cfact.getAll();
		
		
		
		out.println("<h3>FACTURA </h3>");
		out.println("<select class='form-control' id= 'fact' placeholder = 'Factura' > ");
		for (int i = 0 ; i< facturas.size() ; i++){
			out.println("<option value= '"+facturas.get(i).getIdfactura()+"' >" +facturas.get(i).getIdfactura() +"-"+ facturas.get(i).getFechafact() + "</option>");
		}
		out.println("</select> ");
		
		
		%>
		<input  type="text"  id = "deta" name="deta" placeholder="No detalle"  />
		<input  type="text"  id = "plato" name="plato" placeholder="Plato"  />
		<input  type="number"  id = "importe" name="importe" placeholder="Importe"  />
		<input  type="number"  id = "cocinero" name="cocinero" placeholder="Id cocinero"  />
    <br>
    
    <input class='btn btn-danger' type="button" onclick = "add(); "  value ="añadir detalle" />  
    
     
    </div>


</div><br/>
	<div id="dialog" title="MENSAJE" >			
</div>

<script>
   
    
    function crearfact(){
    	//ide = document.getElementById("r"+ide).innerHTML  ;
    	nfact = document.getElementById("idfact").value;
    	ncliente = document.getElementById("mesa").value;
    	nmesa = document.getElementById("cliente").value;
    	ncamarero = document.getElementById("camarero").value;
    	
    	
    	
		$('#dialog').html('¿crear factura? ');
		$('#dialog').dialog({
		      modal: true,
		      buttons: {
		        SI: function() {
		          
		        	$.post('Facturar', {				
		        		nfact  : nfact ,
		        		ncliente  : ncliente ,
		        		nmesa  : nmesa ,
		        		ncamarero  : ncamarero 
					    
					}, function(responseText) {
						$('#dialog').html(responseText);
					    
						$('#dialog').dialog({
						      modal: true,
						      buttons: {
						        OK: function() {
						          $( this ).dialog( "close" );
						        }
						      }});
						cargarUrl('vistas/facturar.jsp');
					});
		        	
		        	$( this ).dialog( "close" );
		        },
		        NO: function() {
		          $( this ).dialog( "close" );
		        }			        
		      }});			
	}
    function add(){
    	//ide = document.getElementById("r"+ide).innerHTML  ;
    	deta = document.getElementById("deta").value;
    	nfact = document.getElementById("fact").value;
    	plato = document.getElementById("plato").value;
    	importe = document.getElementById("importe").value;
    	cocinero = document.getElementById("cocinero").value;
    	
    	
		        	$.post('Factdetalle', {				
		        		nfact  : nfact ,
		        		plato  : plato ,
		        		importe  : importe ,
		        		cocinero  : cocinero ,
		        		deta  : deta 
					    
					}, function(responseText) {
						$('#dialog').html(responseText);
					    
						$('#dialog').dialog({
						      modal: true,
						      buttons: {
						        OK: function() {
						          $( this ).dialog( "close" );
						        }
						      }});
						cargarUrl('vistas/facturar.jsp');
					});
		        	
		      
	}
    function ventana (mens){
    	
       $('#dialog').html(mens);			    
	   $('#dialog').dialog({
		      modal: true,
		      buttons: {
		        OK: function() {
		         $( this ).dialog( "close" );
		        }
		      }});     
    }           
</script>
<script type="text/javascript" class="init">
	    $('#tabladatos').DataTable({
	    	
	        responsive: true,
	        "language": {
	        	"sProcessing":     "Procesando...",
	            "sLengthMenu":     "Mostrar _MENU_ registros",
	            "sZeroRecords":    "No se encontraron resultados",
	            "sEmptyTable":     "Ningún dato disponible en esta tabla",
	            "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
	            "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
	            "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
	            "sInfoPostFix":    "",
	            "sSearch":         "Buscar:",
	            "sUrl":            "",
	            "sInfoThousands":  ",",
	            "sLoadingRecords": "Cargando...",
	            "oPaginate": {
	                "sFirst":    "Primero",
	                "sLast":     "Último",
	                "sNext":     "Siguiente",
	                "sPrevious": "Anterior"
	            },
	            "oAria": {
	                "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
	                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
	            }
	        }
	    });
	</script>