<%@page import="com.crudJava.dao.UsuarioDao," %>
<jsp:useBean id="u" class="com.crudJava.models.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u">

<%
	int i = UsuarioDao.updateUsuario(u);
	response.sendRedirect("viewUsuarios.jsp");
%>