<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<%
	
	String id=request.getParameter("idUser");
	//String user=request.getParameter("user");
	//String pass=request.getParameter("pass");
	
	try{
		
		ConexionDB con = new ConexionDB();
		Statement st=con.conectar();
		Integer okDel=st.executeUpdate("DELETE FROM usuarios WHERE id="+id);
		
		if(okDel==1){
			response.sendRedirect("../vista/listadoUsuarios.jsp");
		}else{
			response.sendRedirect("../vista/listadoUsuarios.jsp?mensaje=Error%20al%20eliminar%20usuario");
		}
		
	} catch(Exception e){
		response.sendRedirect("../vista/listadoUsuarios.jsp?mensaje=Error%20al%20eliminar%20usuario");
	}
	
	

%>
