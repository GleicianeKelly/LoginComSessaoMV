package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CadastroAdmin;
import model.Login;
import service.CadastroAdminService;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		public static String mensagemTres = "";
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		Login login = new Login();
		
		mensagemTres = "";
		String nome = request.getParameter("nome").toLowerCase();
		String senha = request.getParameter("senha");
		//PrintWriter out = response.getWriter();
		//String mensagem;
		
		try {
			CadastroAdminService cadastro = new CadastroAdminService();
			boolean resultado = cadastro.encontrarPorSenha(nome, senha);
			if(resultado) {
					HttpSession session = request.getSession();
					session.setAttribute("usuario", nome);
					response.sendRedirect("MenuCadastro.jsp");
				}
				else {
					response.sendRedirect("index.jsp");
					mensagemTres = "Email ou senha incorretos! ";
				}
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (RuntimeException e) {
			// TODO Auto-generated catch block
			response.sendRedirect("index.jsp");
			mensagemTres = "Email ou senha incorretos! ";
		}
		
		
		
		/*if(login.logar(nome, senha)) {
			HttpSession session = request.getSession();
			session.setAttribute("usuario", nome);
			response.sendRedirect("MenuCadastro.jsp");
			
		}
		
		else {
			response.sendRedirect("index.jsp");
		}*/
		
		
	}
}
