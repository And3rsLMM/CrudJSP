<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar Usuario</title>
</head>
<body>
	<%@page import="com.crudJava.dao.UsuarioDao, com.crudJava.models.Usuario" %>
	<%
		String id = request.getParameter("id");
		Usuario usuario = UsuarioDao.getUsuarioById(Integer.parseInt(id));
	%>
	<h1>Editar Usuario</h1>
	
	<form action="editUsuario.jsp" method="post">
		<input type="hidden" name="id" value="<%=usuario.getId()%>"/>
		<table>
			<tr>
				<td>Nome: </td>
				<td><input type="text" name="nome" value="<%=usuario.getNome()%>"/></td>
			</tr>
			<tr>
				<td>Email: </td>
				<td><input type="email" name="email" value="<%=usuario.getEmail()%>"/></td>
			</tr>
			<tr>
				<td>Sexo: </td>
				<td>
					<input type="radio" name="sexo" value="masculino"/>Masculino
					<input type="radio" name="sexo" value="feminino"/>Feminino
				</td>
			</tr>
			<tr>
				<td>Nacionalidade: </td>
				<td>
					<select name="nacionalidade">
						<option>Argentina</option>
						<option>Brasil</option>
						<option>Chile</option>
						<option>Colombia</option>
						<option>Peru</option>
						<option>Paraguai</option>
						<option>Uruguai</option>
						<option>Venezuela</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="Salvar Alterações"/></td>
				
			</tr>
		</table>
	</form>
</body>
</html>