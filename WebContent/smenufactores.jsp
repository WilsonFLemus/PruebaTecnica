

<%@ page language="java" %>
<%--importamos la libreria de java.sql.* --%>
<%@ page import = "java.sql.*" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> 

<style>
	a:hover {
    	background: rgba(0,0,0,0);
 		color: #3a7999;
 		box-shadow: inset 0 0 0 3px #3a7999;
	}
</style>

  		
  			     
  			  <li class="nav-item"><div class="dropdown open"><a class="btn btn-danger dropdown-toggle" style="WIDTH: 100%;" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" title="Administrativos    "> FACTURAR &nbsp;</a><div class="dropdown-menu" aria-labelledby="dropdownMenuLink">

  			    			<a class="dropdown-item" onclick="cargarUrl('vistas/facturar.jsp')">Facturar</a>
			    			
			    	  	
			    	  </div></div></li>
    			
  			  	<li class="nav-item"><div class="dropdown open"><a class="btn btn-danger dropdown-toggle" style="WIDTH: 100%;" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" title="Estudiantes    ">INFORMES &nbsp;</a><div class="dropdown-menu" aria-labelledby="dropdownMenuLink">

    			    			<a class="dropdown-item" onclick="cargarUrl('vistas/masde100.jsp')">Clientes con facturacion mayor a 100.000</a>
    			    			<a class="dropdown-item" onclick="cargarUrl('vistas/factcama.jsp')">Facturacion Camareros</a>
			    	  
			    	  </div></div></li>
    			
    			
		    	  
		      

		
