<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="listarServlet"
	class="controller.ListarDevServlet" scope="session" />
    

	
<%
	
	if(session.getAttribute("usuario") == null){
		response.sendRedirect("index.jsp");
	}

	out.println("<br><font color 'FF0000'>" + listarServlet.mensagemDois + "</font>");
	
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
<link rel="stylesheet" href="css/cadastroVacina.css">
<title>Buscar usuário</title>
</head>
<body>
 <form action="ListarDevServlet" method="POST">
		<div id="cadastro">
			<fieldset>
				<legend>Confirme seu usuário</legend>
				<table>
					<tr>
                        <td><label for="usuario">Usuário: </label></td>
						<td><input type="text" name="usuario" id="usuario" 
							required="true" style="text-transform: uppercase;" /></td>
					</tr>                  
				</table>
				<hr>
				<input type="submit" value="Enviar" name="salvar"> <input
					type="reset" value="Limpar"> <input type="button"
					value="Voltar" onClick="voltar()">
			</fieldset>
		</div>
	</form>
	
	
		<div id="cadastro">
			<fieldset>
				<legend>Usuário encontrado</legend>
				<table border="1">
					<tr>
						<td>Cod. usuário</td>
						<td>Nome usuário</td>
						<td>senha</td>
						<td>Alterar</td>
					</tr>
					
					 
						<tr>
							<td>${cadastro.cd_usuario}</td>
							<td>${cadastro.nome}</td>
							<td>${cadastro.senha}</td>
							
							<td><a href="ExcluirServlet.jsp?id=${cadastro.cd_usuario}">Excluir</a>
								<a
								href="CidadeEdit.jsp?cidCodigo=${cidade.codigo}&&cidDescricao=${cidade.descricao}&&cidUF=${cidade.uf}">Editar</a>
							</td>
						</tr>
			

				</table>
			</fieldset>
		</div>
		<hr />
		
	
	

</body>
</html>