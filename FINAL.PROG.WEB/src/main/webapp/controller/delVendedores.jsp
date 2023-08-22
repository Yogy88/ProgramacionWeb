<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<%
	
	String nombre=request.getParameter("idnombre");
	//String user=request.getParameter("user");
	//String pass=request.getParameter("pass");
	
	try{
		
		ConexionDB con = new ConexionDB();
		Statement st=con.conectar();
		Integer okDel=st.executeUpdate("DELETE FROM vendedores WHERE id="+nombre);
		
		if(okDel==1){
			response.sendRedirect("../vista/listadoVendedores.jsp");
		}else{
			response.sendRedirect("../vista/listadoVendedores.jsp?mensaje=Error%20al%20eliminar%20usuario");
		}
		
	} catch(Exception e){
		response.sendRedirect("../vista/listadoVendedores.jsp?mensaje=Error%20al%20eliminar%20usuario");
	}
	
	

%>
