package backend;

import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Session;
import org.hibernate.query.Query;

import config.HibernateConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Admin;

@WebServlet("/admin-login")
public class AdminServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		Session session = HibernateConfig.getSessionFactory().openSession();
		try {
			// Fetch admin by username
			Query<Admin> query = session.createQuery("FROM Admin WHERE username = :username", Admin.class);
			query.setParameter("username", username);
			Admin admin = query.uniqueResult();
			if (admin != null && admin.getPassword().equals(password)) {
				// Redirect to home page if login is successful
				HttpSession s = req.getSession();
				s.setAttribute("user", "Admin");
				RequestDispatcher rd = req.getRequestDispatcher("home.jsp");
				rd.forward(req, resp);
			} else {
				// Display error message or redirect to login page
				out.println("<html><body><p>Login failed. Invalid username or password.</p></body></html>");
			}
		} catch (Exception e) {
			e.printStackTrace();
			// Handle exceptions appropriately
			out.println("<html><body><p>An error occurred while processing your request.</p></body></html>");
		} finally {
			session.close();
		}

	}
}
