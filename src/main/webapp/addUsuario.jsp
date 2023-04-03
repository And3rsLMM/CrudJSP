<%@page import="com.crudJava.dao.UsuarioDao" %>
<jsp:useBean id="u" class="com.crudJava.models.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
	int i = UsuarioDao.createUsuario(u);

	if(i > 0){
		response.sendRedirect("success.jsp");
	}else{
		response.sendRedirect("fail.jsp");
	}
%>