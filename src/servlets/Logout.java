package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Logout
 */
@WebServlet("/logout")
public class Logout extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	private static final String VUE_DECONNECTION = "/WEB-INF/pageDeconnection.jsp";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		getServletContext().getRequestDispatcher(VUE_DECONNECTION).forward(request, response);
		session.invalidate();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String test = request.getParameter("deconnecter");
		if (test != null)
		{ response.sendRedirect(request.getContextPath() + "/login"); }

	}
}
