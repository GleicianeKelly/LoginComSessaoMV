<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%

	String user = (String)session.getAttribute("usuario");
	if(session.getAttribute("usuario") == null){
		response.sendRedirect("index.jsp");
	}
	else{
		out.println("Bem-vindo(a) " + user + " !");
	}

	
%>

    
    
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="img/favicon.ico.jpg">
    <link rel="stylesheet" href="css/cadastro.css">
    <title>Cadastro</title>
</head>
<body>
    <div class="controle">
        
         <div class="botao">
            <a href ="Cadastro.jsp"><button>Cadastro Admin</button></a>
        </div> 
        <div class="botao">
            <a href ="ListarDev.jsp"><button>Editar desenvolvedor</button></a>
        </div> 
        <div class="botao">
            <a href ="deslogar.jsp"><button>Sair</button></a>
        </div> 
        
    </div>
</body>
</html>