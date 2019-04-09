<%--importamos la clase conexion.java --%>
<%@ page import="conexion.conexion" %>
<%@ page language="java" %>
<%--importamos la libreria de java.sql.* --%>
<%@ page import = "java.sql.*" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> 
<%  
  
  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	img {
	
		left: 50%;
		top: 50%;
	
	}
	.imafondo {
	    margin-top: 15%;
		margin-left: -400px;
		left: 50%;
		top: 50%;
		position: absolute;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery.min.js" ></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/tether.min.js"></script>           
<script src="js/bootstrap.min.js"></script> 
<script type="text/javascript" language="javascript" src="js/dataTables.min.js"></script>
<script type="text/javascript" language="javascript" src="js/rowReorder.min.js"></script>
<script type="text/javascript" language="javascript" src="js/responsive.min.js"></script>
<script src="js/jquery.form.js"></script> 
  
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<link href="css/jquery-ui.css" rel="stylesheet">
<!-- data tables -->
<link rel="stylesheet" type="text/css" href="css/dataTables.min.css">
<link rel="stylesheet" type="text/css" href="css/rowReorder.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="css/responsive.dataTables.min.css">
<link href="css/menu.css" rel="stylesheet">


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://files.codepedia.info/files/uploads/iScripts/html2canvas.js"></script>

<link rel="icon" href="imagenes/favicon.ico">
<script type="text/javascript">


$(document).ready(function() {    	    	    		
	cargarsmenu('smenufactores.jsp')
});
function cargarUrl(arg1){	
	$('#cuerpo-menu').html("<b> CARGANDO... </b>");
	$('#cuerpo-menu').load(arg1);		
}
function cargarsmenu(dir){
	
	$('#smenu').load(dir);
}
function deshabilitaRetroceso(){
    window.location.hash="no-back-button";
    window.location.hash="Again-No-back-button" //chrome
    window.onhashchange=function(){window.location.hash="no-back-button";}
}
</script>

<title>Menu</title>
</head>
<body onload="deshabilitaRetroceso();">

    <nav class="navbar navbar-toggleable-md navbar-inverse fixed-top bg-inverse" >
      <button class="navbar-toggler navbar-toggler-right hidden-lg-up" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="navbar-brand" href="#">RESTAURANTE</div>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
         
        </ul>
        
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <nav class="col-sm-3 col-md-2 hidden-xs-down bg-faded sidebar">
          <ul class="nav nav-pills flex-column">
            
            
              <div id="smenu" name ="smenu">
              </div>
            
          </ul>
        </nav>

        <main class="col-sm-9 offset-sm-3 col-md-10 offset-md-2 pt-3">
          <h1>RESTAURANTE  </h1>
           
           
          <div class="panel panel-default"  id="cuerpo-menu" style="overflow-x:auto;">
          
          <img class = "imafondo" src="imagenes/imgres.png" />
          </div>
        </main>
      </div>
    </div>
   
    <script type="text/javascript">
    function ventanaem (mens){    	
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

 
 
</body>
</html>