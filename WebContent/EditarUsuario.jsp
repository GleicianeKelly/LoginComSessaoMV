<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%

	if(session.getAttribute("usuario") == null){
		response.sendRedirect("index.jsp");
	}
	
%>



<%
String acaoSalvar = request.getParameter("salvar");


Integer codigo = Integer.parseInt(request.getParameter("codigo"));
String nome_usuario = (request.getParameter("nome_usuario"));
String senha = request.getParameter("senha");



%>

<script type="text/javascript">
	function voltar() {
		location.href = "MenuCadastro.jsp";
	}
</script>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="img/favicon.ico.jpg">
<link rel="stylesheet" href="css/lista.css">
<title>Atualizar Usuário</title>
</head>
<body>

	<form action="EditarServlet" method="POST">
		<div id="Form">
			<fieldset>
				<legend>Atualizar Cadastro</legend>
				<table>
					<tr>
						<td><label for="codigo"></label></td>
						<td><input type="hidden" name="codigo" 
						id="codigo" size="6" value="<%=codigo%>" /></td>
					<tr>
					<tr>
						<td><label for="codigo">Id usuário: </label></td>
						<td><input type="text" disabled="true"
						id="codigo" size="6" value="<%=codigo%>" /></td>
					<tr>
					<tr>
						<td><label for="nome_usuario">Nome usuário: </label></td>
						<td><input type="text" name="nome_usuario"
							id="nome_usuario" required="true"
							style="text-transform: uppercase;" 
							value="<%=nome_usuario%>" /></td>
					<tr>
					<tr>
						<td><label for="senha">Senha: </label></td>
						<td><input type="text" name="senha"
							id="senha" required="true"
							style="text-transform: uppercase;" 
							value="<%=senha%>" /></td>
					</tr>
				</table>
				<hr>
				<input type="submit" value="Salvar" name="salvar"> <input
					type="button" value="Voltar" onClick="voltar()">

			</fieldset>
		</div>
	</form>
</body>
</html>
