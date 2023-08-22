<!doctype html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <title>Registro de Vendedores</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  </head>
  <body style="background-color: dimgrey;" >
	<jsp:include page="Menu.jsp"></jsp:include>
		
	<h1 class="text-center m-2 fs-3">Vendedores</h1>
	
	
		<%
		String mensaje=request.getParameter("mensaje");
		if(mensaje!=null){
			out.println("<div adclass='text-danger m-2'>");
			out.println(mensaje);
			out.println("</div>");	
		}
		%>
	
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addModal">
 		 Agregar Vendedor
	</button>
	
	<table class="table text-center">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">NOMBRE</th>
      <th scope="col">APELLIDO</th>
      <th scope="col">TELEFONO</th>
      <th scope="col">EDICION</th>
    </tr>
  </thead>
  <tbody>
   <%
   
   try{
	   
	   db.ConexionDB conn = new db.ConexionDB();
	   Statement st=conn.conectar();
	   ResultSet rs=st.executeQuery("SELECT * FROM vendedores");
	   
	   while(rs.next()){
		   out.println("<tr>");
		   
		   out.println("<td>");
		   Integer id=rs.getInt("id");
		   out.println(id);
		   out.println("</td>");
		   
		   out.println("<td>");
		   String nombre=rs.getString("nombre");
		   out.println(nombre);
		   out.println("</td>");
		   
		   out.println("<td>");
		   out.println(rs.getString("apellido"));
		   out.println("</td>");
		   
		   out.println("<td>");
		   out.println(rs.getString("tel"));
		   out.println("</td>");
		   
		   out.println("<td>");
		   out.println("<a href='editarVendedor.jsp?id="+id+"'><i class='bi bi-pencil-fill m-1'></i></a>");
		   out.println("<a href='#' data-bs-toggle='modal' data-bs-target='#delModal' id='"+id+"' user='"+nombre+"'><i class='bi bi-trash m 1'></i></a>");
		   out.println("</td>");
		   
		   	   
		   out.println("</tr>");
	   }
	   
	   
   } catch (Exception e){
		out.println("<div class='text-center m-2 fs-3 text-danger'>LISTADO DE Vendedores</h1>");
	   out.println("Error al cargar vendedores");
   }
   
  
   %>
   
  </tbody>
</table>



<div class="modal fade" id="delModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Eliminar Vendedor</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
         <form action="../controller/delVendedores.jsp" method="post">
         	<input type ="hidden" name="idUser" id="idUser">
		      <div class="modal-body text-center">
		          <div class="mb-3">
		            <label for="recipient-name" class="col-form-label">¿Realmente quiere eliminar este Vendedor?</label>
		            <div id="dataUser" class="text-danger"></div>
		          </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
		        <input type="submit" class="btn btn-primary" value="Eliminar">
		      </div>
      </form>
    </div>
  </div>
</div>



<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Vendedor</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <div class="d-flex justify-content-center">
			<form action="../controller/addUsuario.jsp" method="post">
				<input type="email" name="user" id="user" onkeyup="validarUser()" class="form-control mb-3" placeholder="usuario" required>
				<input type="password" name="pass" id="pass" onkeyup="fortPass()" class="form-control mb-3" placeholder="contraseña" required>
				<input type="password" name="rePass" id="rePass" class="form-control mb-3" placeholder="reingresacontraseña" required>
				<input type="submit" value="Enviar" class="btn btn-primary">
			</form>
		</div>
    </div>
  </div>
</div>




</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

	<script src="js/listUsu.js"></script>
  </body>
</html>