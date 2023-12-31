<!doctype html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registro de Miembros</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  </head>
  <body style="background-color: dimgrey;" >
	<jsp:include page="Menu.jsp"></jsp:include>
  
  <%

	String id=request.getParameter("id");
	//String pass=request.getParameter("pass");
	
	
	String user=new String ("");
	String pass=new String("");
	try{
		
		ConexionDB con = new ConexionDB();
		Statement st=con.conectar();
		ResultSet rs=st.executeQuery("SELECT * FROM usuarios WHERE id="+ id);  //PROBLEMAS
		
		if(rs.next()){
			
			user=rs.getString("user");
			pass=rs.getString("pass");
			
		}else{
			response.sendRedirect("listadoUsuarios.jsp?mensaje=Error%20al%20cargar%20usuario");
		}
		/* if(okIns==1){
			response.sendRedirect("../vista/listadoUsuarios.jsp");
		}else{
			response.sendRedirect("../vista/altaUsuario.jsp?mensaje=Error%20al%20agregar%20usuario");
		}*/
		
	} catch(Exception e){
		response.sendRedirect("../vista/altaUsuario.jsp?mensaje=Error%20al%20agregar%20usuario");
	}
	
	

%>
  
<div class="container">
	<div class="border rounded m-2 text-center">
		<div class="fs-3 my-4">Modificar Miembro</div>
		
		<div class="d-flex justify-content-center">
			<form action="../controller/updUsuario.jsp" method="post">
				<input type="hidden" name ="id" id="id" value="<%out.println(id); %>" >
				<input type="email" name="user" id="user" value="<%out.println(user); %>" onkeyup="validarUser()" class="form-control mb-3" placeholder="usuario" required>
				<input type="password" name="pass" id="pass" value="<%out.println(pass); %>" onkeyup="fortPass()" class="form-control mb-3" placeholder="contraseņa" required>
				<input type="password" name="rePass" id="rePass" value="<%out.println(pass); %>"onkeyup="compararPass()" class="form-control mb-3" placeholder="reingresar contraseņa" required>
				<input type="submit" value="Enviar" class="btn btn-primary">
			</form>
		</div>
		<div id="msUser"></div>
		<%
		String mensaje=request.getParameter("mensaje");
		
		if(mensaje!=null){
			out.println("<div class='text-danger m-2'>");
			out.println(mensaje);
			out.println("</div>");	
		}
		%>
	</div>


</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <script src="js/resgistro.js"></script>
  </body>
</html>