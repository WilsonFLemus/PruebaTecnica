
<%@page import="conexion.conexion"%>
<%@ page language="java" %>
<%--importamos la libreria de java.sql.* --%>
<%@ page import = "java.sql.*" %>  
<%@ page import = "java.sql.*" %>  

<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> 


<div class="container" style="border-radius:10px; border: solid; border-color:#990000; margin-top:20px; ">
<h2> Camareros por mes</h2>
<br> 
        <div class="row">
	          		<div class="col-md-12">
			 			<table class="table display nowrap" id="tabladatos" cellspacing="0" width="100%">
						 	<thead style="background-color:#990000;" >
			                        <tr>
				                        <td align="center"><font color="AAAAAA" data-priority="1" >NOMBRES Y APELLIDOS</font></td>
				                        <td align="center"><font color="AAAAAA" data-priority="2" >ene </font></td>
				                        <td align="center"><font color="AAAAAA" data-priority="2" >feb </font></td>
				                        <td align="center"><font color="AAAAAA" data-priority="2" >mar </font></td>
				                        <td align="center"><font color="AAAAAA" data-priority="2" >abr </font></td>
				                        <td align="center"><font color="AAAAAA" data-priority="2" >may </font></td>
				                        <td align="center"><font color="AAAAAA" data-priority="2" >jun </font></td>
				                        <td align="center"><font color="AAAAAA" data-priority="2" >jul </font></td>
				                        <td align="center"><font color="AAAAAA" data-priority="2" >ago </font></td>
				                        <td align="center"><font color="AAAAAA" data-priority="2" >sep </font></td>
				                        <td align="center"><font color="AAAAAA" data-priority="2" >oct </font></td>
				                        <td align="center"><font color="AAAAAA" data-priority="2" >nov </font></td>
				                        <td align="center"><font color="AAAAAA" data-priority="2" >dic </font></td>
				                        <td align="center"><font color="AAAAAA">TOTAL</font></td>
				                    </tr>
			                </thead>
			                <tbody style="background-color:#ffffff;">
<% 
        conexion c = new conexion();
		java.sql.Connection con = c.getConexion();
		PreparedStatement sta = null;
		 
		
	  
		sta = con.prepareStatement("select * from camarero ");
		
		ResultSet resp = null;
		try {
			resp = sta.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		while (resp.next())
	      {
	         out.println("<tr>");	         
	         out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>"+resp.getString("NOMBRE")+ "   "+resp.getString("APELLIDO1")+ " </td>");	         
	         int idcama = resp.getInt("IDCAMARERO");
	 		 try {
	 			PreparedStatement sta2 = con.prepareStatement("select  ca.IDCAMARERO   ,sum(df.IMPORTE) as total "+
	 				"	from camarero ca left JOIN FACTURA ft on ca.IDCAMARERO  = ft.IDCAMARERO  ,  DETALLEFACTURA df " +
	 				"	where  df.IDFACTURA = ft.IDFACTURA and  MONTH (ft.FechaFactura)  = 1 and "+
	 				"	 ca.IDCAMARERO = ? group by ca.IDCAMARERO ");	 		
		 		sta2.setInt(1, idcama) ;
	 			ResultSet resp2 = null;
	 		 	resp2 = sta2.executeQuery();
	 		 	
	 		 	if (resp2.next()){
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>"+resp.getInt("TOTAL")+ " </td>");
	 		 	}else{
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0 </td>");
	 		 	}
	 		 } catch (SQLException e) { System.out.println("ERROR: " + e.getMessage());	e.printStackTrace(); out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0.0</td>");}
	 		try {
	 			PreparedStatement sta2 = con.prepareStatement("select  ca.IDCAMARERO   ,sum(df.IMPORTE) as total "+
	 				"	from camarero ca left JOIN FACTURA ft on ca.IDCAMARERO  = ft.IDCAMARERO  ,  DETALLEFACTURA df " +
	 				"	where  df.IDFACTURA = ft.IDFACTURA and  MONTH (ft.FechaFactura)  = 2 and "+
	 				"	 ca.IDCAMARERO = ? group by ca.IDCAMARERO ");	 		
		 		sta2.setInt(1, idcama) ;
	 			ResultSet resp2 = null;
	 			resp2 = sta2.executeQuery();
	 		 	
	 		 	if (resp2.next()){
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>"+resp2.getInt("TOTAL")+ " </td>");
	 		 	}else{
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0 </td>");
	 		 	}
	 		 	resp2.close();	   	 		 		 		 		 		 		 
	 		 } catch (SQLException e) {	e.printStackTrace(); out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0 </td>");}
	 		try {
	 			PreparedStatement sta2 = con.prepareStatement("select  ca.IDCAMARERO   ,sum(df.IMPORTE) as total "+
	 				"	from camarero ca left JOIN FACTURA ft on ca.IDCAMARERO  = ft.IDCAMARERO  ,  DETALLEFACTURA df " +
	 				"	where  df.IDFACTURA = ft.IDFACTURA and  MONTH(ft.FechaFactura)  = 3 and "+
	 				"	 ca.IDCAMARERO = ? group by ca.IDCAMARERO ");	 		
		 		sta2.setInt(1, idcama) ;
	 			ResultSet resp2 = null;
	 			resp2 = sta2.executeQuery();
	 		 	
	 		 	if (resp2.next()){
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>"+resp2.getInt("TOTAL")+ " </td>");
	 		 	}else{
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0 </td>");
	 		 	}	 	resp2.close();	   	 		 		 		 		 		 		 
	 		 } catch (SQLException e) {	e.printStackTrace(); out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0 </td>");}
	 		try {
	 			PreparedStatement sta2 = con.prepareStatement("select  ca.IDCAMARERO   ,sum(df.IMPORTE) as total "+
	 				"	from camarero ca left JOIN FACTURA ft on ca.IDCAMARERO  = ft.IDCAMARERO  ,  DETALLEFACTURA df " +
	 				"	where  df.IDFACTURA = ft.IDFACTURA and  MONTH(ft.FechaFactura)  = 4 and "+
	 				"	 ca.IDCAMARERO = ? group by ca.IDCAMARERO ");	 		
		 		sta2.setInt(1, idcama) ;
	 			ResultSet resp2 = null;
	 			resp2 = sta2.executeQuery();
	 		 	
	 		 	if (resp2.next()){
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>"+resp2.getInt("TOTAL")+ " </td>");
	 		 	}else{
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0</td>");
	 		 	}	 resp2.close();	   		 		 		 		 		 		 		 
	 		 } catch (SQLException e) {	e.printStackTrace(); out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0 </td>");}
	 		try {
	 			PreparedStatement sta2 = con.prepareStatement("select  ca.IDCAMARERO   ,sum(df.IMPORTE) as total "+
	 				"	from camarero ca left JOIN FACTURA ft on ca.IDCAMARERO  = ft.IDCAMARERO  ,  DETALLEFACTURA df " +
	 				"	where  df.IDFACTURA = ft.IDFACTURA and  MONTH(ft.FechaFactura)  = 5 and "+
	 				"	 ca.IDCAMARERO = ? group by ca.IDCAMARERO ");	 		
		 		sta2.setInt(1, idcama) ;
	 			ResultSet resp2 = null;
	 			resp2 = sta2.executeQuery();
	 		 	
	 		 	if (resp2.next()){
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>"+resp2.getInt("TOTAL")+ " </td>");
	 		 	}else{
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0 </td>");
	 		 	}	 	resp2.close();	   	 		 		 		 		 		 		 
	 		 } catch (SQLException e) {	e.printStackTrace(); out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0 </td>");}
	 		try {
	 			PreparedStatement sta2 = con.prepareStatement("select  ca.IDCAMARERO   ,sum(df.IMPORTE) as total "+
	 				"	from camarero ca left JOIN FACTURA ft on ca.IDCAMARERO  = ft.IDCAMARERO  ,  DETALLEFACTURA df " +
	 				"	where  df.IDFACTURA = ft.IDFACTURA and  MONTH(ft.FechaFactura)  = 6 and "+
	 				"	 ca.IDCAMARERO = ? group by ca.IDCAMARERO ");	 		
		 		sta2.setInt(1, idcama) ;
	 			ResultSet resp2 = null;
	 			resp2 = sta2.executeQuery();
	 		 	
	 		 	if (resp2.next()){
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>"+resp2.getInt("TOTAL")+ " </td>");
	 		 	}else{
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0 </td>");
	 		 	}	 	resp2.close();	   	 		 		 		 		 		 		 
	 		 } catch (SQLException e) {	e.printStackTrace(); out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0 </td>");}
	 		try {
	 			PreparedStatement sta2 = con.prepareStatement("select  ca.IDCAMARERO   ,sum(df.IMPORTE) as total "+
	 				"	from camarero ca left JOIN FACTURA ft on ca.IDCAMARERO  = ft.IDCAMARERO  ,  DETALLEFACTURA df " +
	 				"	where  df.IDFACTURA = ft.IDFACTURA and  MONTH(ft.FechaFactura)  = 7 and "+
	 				"	 ca.IDCAMARERO = ? group by ca.IDCAMARERO ");	 		
		 		sta2.setInt(1, idcama) ;
	 			ResultSet resp2 = null;
	 			resp2 = sta2.executeQuery();
	 		 	
	 		 	if (resp2.next()){
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>"+resp2.getInt("TOTAL")+ " </td>");
	 		 	}	else{
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0 </td>");
	 		 	} 	resp2.close();	   	 		 		 		 		 		 		 
	 		 } catch (SQLException e) {	e.printStackTrace(); out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0 </td>");}
	 		try {
	 			PreparedStatement sta2 = con.prepareStatement("select  ca.IDCAMARERO   ,sum(df.IMPORTE) as total "+
	 				"	from camarero ca left JOIN FACTURA ft on ca.IDCAMARERO  = ft.IDCAMARERO  ,  DETALLEFACTURA df " +
	 				"	where  df.IDFACTURA = ft.IDFACTURA and  MONTH (ft.FechaFactura)  = 8 and "+
	 				"	 ca.IDCAMARERO = ? group by ca.IDCAMARERO ");	 		
		 		sta2.setInt(1, idcama) ;
	 			ResultSet resp2 = null;
	 			resp2 = sta2.executeQuery();
	 		 	
	 		 	if (resp2.next()){
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>"+resp2.getInt("TOTAL")+ " </td>");
	 		 	}	else{
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0 </td>");
	 		 	} 		resp2.close();	    		 		 		 		 		 		 
	 		 } catch (SQLException e) {	e.printStackTrace(); out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0 </td>");}
	 		try {
	 			PreparedStatement sta2 = con.prepareStatement("select  ca.IDCAMARERO   ,sum(df.IMPORTE) as total "+
	 				"	from camarero ca left JOIN FACTURA ft on ca.IDCAMARERO  = ft.IDCAMARERO  ,  DETALLEFACTURA df " +
	 				"	where  df.IDFACTURA = ft.IDFACTURA and  MONTH (ft.FechaFactura)  = 9 and "+
	 				"	 ca.IDCAMARERO = ? group by ca.IDCAMARERO ");	 		
		 		sta2.setInt(1, idcama) ;
	 			ResultSet resp2 = null;
	 			resp2 = sta2.executeQuery();
	 		 	
	 		 	if (resp2.next()){
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>"+resp2.getInt("TOTAL")+ " </td>");
	 		 	}else{
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0 </td>");
	 		 	}	resp2.close();	    		 		 		 		 		 		 		 
	 		 } catch (SQLException e) {	e.printStackTrace(); out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0 </td>");}
	 		try {
	 			PreparedStatement sta2 = con.prepareStatement("select  ca.IDCAMARERO   ,sum(df.IMPORTE) as total "+
	 				"	from camarero ca left JOIN FACTURA ft on ca.IDCAMARERO  = ft.IDCAMARERO  ,  DETALLEFACTURA df " +
	 				"	where  df.IDFACTURA = ft.IDFACTURA and  MONTH(ft.FechaFactura)  = 10 and "+
	 				"	 ca.IDCAMARERO = ? group by ca.IDCAMARERO ");	 		
		 		sta2.setInt(1, idcama) ;
	 			ResultSet resp2 = null;
	 			resp2 = sta2.executeQuery();
	 		 	
	 		 	if (resp2.next()){
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>"+resp2.getInt("TOTAL")+ " </td>");
	 		 	}else{
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0 </td>");
	 		 	}	 resp2.close();	   		 		 		 		 		 		 		 
	 		 } catch (SQLException e) {	e.printStackTrace(); out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0 </td>");}
	 		try {
	 			PreparedStatement sta2 = con.prepareStatement("select  ca.IDCAMARERO   ,sum(df.IMPORTE) as total "+
	 				"	from camarero ca left JOIN FACTURA ft on ca.IDCAMARERO  = ft.IDCAMARERO  ,  DETALLEFACTURA df " +
	 				"	where  df.IDFACTURA = ft.IDFACTURA and  MONTH (ft.FechaFactura)  = 11 and "+
	 				"	 ca.IDCAMARERO = ? group by ca.IDCAMARERO ");	 		
		 		sta2.setInt(1, idcama) ;
	 			ResultSet resp2 = null;
	 			resp2 = sta2.executeQuery();
	 		 	
	 		 	if (resp2.next()){
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>"+resp2.getInt("TOTAL")+ " </td>");
	 		 	}else{
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0 </td>");
	 		 	}	 	resp2.close();	   	 		 		 		 		 		 		 
	 		 } catch (SQLException e) {	e.printStackTrace(); out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0 </td>");}
	 		try {
	 			PreparedStatement sta2 = con.prepareStatement("select  ca.IDCAMARERO   ,sum(df.IMPORTE) as total "+
	 				"	from camarero ca left JOIN FACTURA ft on ca.IDCAMARERO  = ft.IDCAMARERO  ,  DETALLEFACTURA df " +
	 				"	where  df.IDFACTURA = ft.IDFACTURA and  MONTH  (ft.FechaFactura)  = 12 and "+
	 				"	 ca.IDCAMARERO = ? group by ca.IDCAMARERO ");	 		
		 		sta2.setInt(1, idcama) ;
	 			ResultSet resp2 = null;
	 			resp2 = sta2.executeQuery();
	 		 	
	 		 	if (resp2.next()){
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>"+resp2.getInt("TOTAL")+ " </td>");
	 		 	}else{
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0 </td>");
	 		 	}	 	resp2.close();	   	 		 		 		 		 		 		 
	 		 } catch (SQLException e) {	e.printStackTrace(); out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0 </td>");}
	 		try {
	 			PreparedStatement sta2 = con.prepareStatement("select  ca.IDCAMARERO   ,sum(df.IMPORTE) as total "+
	 				"	from camarero ca left JOIN FACTURA ft on ca.IDCAMARERO  = ft.IDCAMARERO  ,  DETALLEFACTURA df " +
	 				"	where  df.IDFACTURA = ft.IDFACTURA and  MONTH(ft.FechaFactura)  = 12 and "+
	 				"	 ca.IDCAMARERO = ? group by ca.IDCAMARERO ");	 		
		 		sta2.setInt(1, idcama) ;
	 			ResultSet resp2 = null;
	 			resp2 = sta2.executeQuery();
	 		 	
	 		 	if (resp2.next()){
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>"+resp2.getInt("TOTAL")+ " </td>");
	 		 	}else{
	 		 		out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>total </td>");
	 		 	}	 	resp2.close();	   	 		 		 		 		 		 		 
	 		 } catch (SQLException e) {	e.printStackTrace(); out.println("<td STYLE='VERTICAL-ALIGN : MIDDLE' align='CENTER'>0 </td>");}
	         
	         
	     
	         out.println("</tr>");	       
	      }
		try {
			resp.close();
			sta.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		%>
</tbody>
</table>
</div>
</div>

</div><br/>
	<div id="dialog" title="MENSAJE" >			
</div>

<script>
    $(function() {
    	
        $('#upload-form').ajaxForm({
        	beforeSubmit: function(arr, $form, options) {$('#cargando').html("<h3><marquee> CARGANDO ...</marquee></h3>");	 },
            success: function(msg) {
				$('#dialog').html(msg);			    
				$('#dialog').dialog({
				      modal: true,
				      buttons: {
				        OK: function() {
				          $( this ).dialog( "close" );
				        }
				      }});
				cargarUrl('vistas/r1001informaticos.jsp');
            },
            error: function(msg) {
            	$('#dialog').html("No se puede cargar el archivo");			    
				$('#dialog').dialog({
				      modal: true,
				      buttons: {
				        OK: function() {
				          $( this ).dialog( "close" );
				        }
				      }});
            }
        });
    });
    
    function retiro(ide){
    	ide = document.getElementById("r"+ide).innerHTML  ;
		$('#dialog').html('¿Seguro que desea eliminar Archivo? <br> tambien eliminara los registros cargados con el archivo');
		$('#dialog').dialog({
		      modal: true,
		      buttons: {
		        SI: function() {
		          
		        	$.post('Borrar', {				
						CODIGOARCHIVO  : ide 
					    
					}, function(responseText) {
						$('#dialog').html(responseText);
					    
						$('#dialog').dialog({
						      modal: true,
						      buttons: {
						        OK: function() {
						          $( this ).dialog( "close" );
						        }
						      }});
						cargarUrl('vistas/r1001informaticos.jsp');
					});
		        	
		        	$( this ).dialog( "close" );
		        },
		        NO: function() {
		          $( this ).dialog( "close" );
		        }			        
		      }});			
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