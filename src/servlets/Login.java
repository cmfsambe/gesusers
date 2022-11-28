package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet(
{ "", "/login" })
public class Login extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	private static final String VUE_CONNECTION = "/WEB-INF/pageAuthentification.jsp";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		getServletContext().getRequestDispatcher(VUE_CONNECTION).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String login = request.getParameter("identifiant");
		String password = request.getParameter("motdepasse");

		if ("admin".equals(login) && "passer".equals(password))
		{
			HttpSession session = request.getSession();
			session.setAttribute("isConnected", true);
			session.setAttribute("connectedUser", login);
			response.sendRedirect(request.getContextPath() + "/accueil");
		}
		else
		{
			request.setAttribute("connectionFailed", true);
			request.setAttribute("login", login);
			getServletContext().getRequestDispatcher(VUE_CONNECTION).forward(request, response);
		}

	}

}
