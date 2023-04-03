<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="com.crudJava.dao.UsuarioDao, com.crudJava.models.*, java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	<h1>Listagem de Usuários</h1>
	
	<%
	List<Usuario> list = UsuarioDao.getAllUsuarios();
	request.setAttribute("list", list);
	%>
	
	<table>
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>Email</th>
			<th>Sexo</th>
			<th>Nacionalidade</th>
		</tr>
		<c:forEach items="${list}" var="usuario">
			<tr>
				<td>${usuario.getId()}</td>
				<td>${usuario.getNome()}</td>
				<td>${usuario.getEmail()}</td>
				<td>${usuario.getSexo()}</td>
				<td>${usuario.getNacionalidade()}</td>
				<td><a href="editForm.jsp?id=${usuario.getId()}"><input type="button" value="Editar"></a></td>
				<td><a href="deleteUsuario.jsp?id=${usuario.getId()}"><input type="button" value="Deletar"></a></td>
			</tr>
		</c:forEach>		
	</table>
	<br>	
	<input type="button" value="Novo Usuario"><a type="button" href="addForm.jsp"></a>
</body>
</html>