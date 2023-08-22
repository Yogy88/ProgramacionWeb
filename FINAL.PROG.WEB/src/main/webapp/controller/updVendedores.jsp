<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<%
	
	String id=request.getParameter("id");
	String nombre=request.getParameter("nombre");
	String apellido=request.getParameter("apellido");
	String tel=request.getParameter("tel");
	
	try{
		
		ConexionDB con = new ConexionDB();
		Statement st=con.conectar();
		Integer okUpd=st.executeUpdate("UPDATE vendedores SET nombre = '"+nombre+"', apellido='"+apellido+"', tel='"+tel+"'WHERE id="+id);
		
		if(okUpd==1){
			response.sendRedirect("../vista/listadoVendedores.jsp");
		}else{
			response.sendRedirect("../vista/editarVendedores.jsp?mensaje=Error%20al%20modificar%20usuario");
		}
		
	} catch(Exception e){
		response.sendRedirect("../vista/editarVendedores.jsp?mensaje=Error%20al%20modificar%20usuario");
	}
	
	

%>
