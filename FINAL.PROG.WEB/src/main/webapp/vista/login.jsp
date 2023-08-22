<!doctype html>
<html lang="en">
  <head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Club Shelby</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  </head>
  <body>
  
  <h1 style= "text-align: center;color: goldenrod;">Club Shelby</h1>
  <div>
  
  
  </div>

<div class="container" style="color: goldenrod;">
	<div class="border rounded m-2 text-center">
		<div style="" class="fs-3 my-4">Iniciar Sesion</div>
		<div class="d-flex justify-content-center">
			<form action="../controller/checkLogin.jsp" method="post">
				<input type="email" name="user" id="user" class="form-control mb-3" placeholder="usuario" required>
				<input type="password" name="pass" id="pass" class="form-control mb-3" placeholder="contraseña" required>
				<input type="submit" value="Enviar" class="btn btn-primary">
			</form>
		</div>
		<div class="text-danger m-2">
		</div>
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
	<body style="
					background-image: url(imagenes/Shelby.jpg);
					background-position: center;
					background-repeat: no-repeat;
					background-size: cover;
					background-attachment: fixed;
					
					"
					>	
		</body>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
  </body>
</html>