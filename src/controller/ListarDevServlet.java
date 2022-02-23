package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CadastroAdmin;
import service.CadastroAdminService;

/**
 * Servlet implementation class ListarDevServlet
 */
@WebServlet("/ListarDevServlet")
public class ListarDevServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		public static String mensagemDois = "";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListarDevServlet() {
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

		mensagemDois = "";
		CadastroAdmin cadastro = new CadastroAdmin();
		String nome = request.getParameter("usuario");
		HttpSession session = request.getSession();
		String usuarioEncontrado = (String) session.getAttribute("usuario");
		if (nome.equalsIgnoreCase(usuarioEncontrado)) {

			//System.out.println(usuarioEncontrado);
			CadastroAdminService cadastroBean;
			try {
				mensagemDois = "";
				cadastroBean = new CadastroAdminService();
				cadastro = cadastroBean.encontrarPorNome(usuarioEncontrado);
				request.setAttribute("cadastro", cadastro);
				RequestDispatcher d = request.getRequestDispatcher("ListarDev.jsp");
				d.forward(request, response);
				// formard leva tudo que trouxe
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			mensagemDois = "Usuário incorreto, digite novamente";
			response.sendRedirect("ListarDev.jsp");
		}

	}

}
