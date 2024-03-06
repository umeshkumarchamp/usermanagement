package backend;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import config.HibernateConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.User;

@WebServlet("/user-details")
public class UserDetailServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Retrieve user ID from request parameter
		int userId = Integer.parseInt(req.getParameter("id"));

		// Retrieve user details from the database based on the user ID
		User user = retrieveUserDetailsById(userId);

		// Set the user object as an attribute in the request
		req.setAttribute("user", user);

		// Forward the request to the JSP page for displaying user details
		RequestDispatcher rd = req.getRequestDispatcher("userDetails.jsp");
		rd.forward(req, resp);
	}
	
	public static User retrieveUserDetailsById(int userId) {
		User user = null; 
		SessionFactory factory = null;
		try{
			factory = HibernateConfig.getSessionFactory();
			Session session = factory.openSession(); 
			user = session.get(User.class, userId);
			session.beginTransaction().commit();
		}catch(Exception e) {
			System.out.println("Error : "+e);
		}
		return user;
	}
}
