<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<%

	String nombre=request.getParameter("nombre");
	String apellido=request.getParameter("apellido");
	String tel=request.getParameter("tel");
	
	try{
		
		ConexionDB con = new ConexionDB();
		Statement st=con.conectar();
		Integer okIns=st.executeUpdate("INSERT INTO vendedores (nombre, apellido, el) VALUES ('"+nombre+"','"+apellido+"','"+tel+"')");
		
		if(okIns==1){
			response.sendRedirect("../vista/listadoVendedores.jsp");
		}else{
			response.sendRedirect("../vista/altaVendedores.jsp?mensaje=Error%20al%20agregar%20usuario");
		}
		
	} catch(Exception e){
		response.sendRedirect("../vista/altaVendedores.jsp?mensaje=Error%20al%20agregar%20usuario");
	}
	
	

%>
