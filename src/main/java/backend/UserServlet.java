package backend;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import config.HibernateConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import models.User;

@WebServlet("/users")
@MultipartConfig
public class UserServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<User> userList = retrieveUserListFromDatabase();
		for (User user : userList) {
			System.out.println(user);
		}
		// Set the userList as an attribute in the request object
		req.setAttribute("userList", userList);
		// Forward the request to the JSP page
		RequestDispatcher rd = req.getRequestDispatcher("userList.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		// Retrieve form data
		String name = req.getParameter("name");
		int age = Integer.parseInt(req.getParameter("age"));
		String gender = req.getParameter("gender");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		// Handle file uploads
		Part photoPart = req.getPart("photo");
		byte[] photoBytes = readBytes(photoPart.getInputStream());

		Part resumePart = req.getPart("resume");
		byte[] resumeBytes = readBytes(resumePart.getInputStream());

		// Create User object
		User user = new User();
		user.setName(name);
		user.setAge(age);
		user.setGender(gender);
		user.setEmail(email);
		user.setPhone(phone);
		user.setAddress(address);
		user.setPhoto(photoBytes);
		user.setResume(resumeBytes);

		// Call method to store user data in database
		boolean isAdded = storeUserDataInDatabase(user);
		if(isAdded) {
			System.out.println("Record Added Succesfully.");
		}else {
			System.out.println("Something went wrong.");
		}
		// Retrieve the updated list of users from the database
		List<User> userList = retrieveUserListFromDatabase();

		// Set the userList as an attribute in the request object
		req.setAttribute("userList", userList);
		
		// Redirect to a confirmation page or display a success message
		RequestDispatcher rd = req.getRequestDispatcher("userList.jsp");
		rd.forward(req, resp);
	}

	private byte[] readBytes(InputStream inputStream) throws IOException {
		byte[] buffer = new byte[inputStream.available()];
		inputStream.read(buffer);
		return buffer;
	}

	private List<User> retrieveUserListFromDatabase() {
		SessionFactory factory = HibernateConfig.getSessionFactory();
		Session session = factory.openSession();
		try {
			session.beginTransaction();
			// Execute HQL query to retrieve users data
			List<User> userList = session.createQuery("from User").getResultList();
			session.getTransaction().commit();
			for (User user : userList) {
				System.out.println(user);
			}
			return userList;
		} catch (Exception e) {
			System.out.println("Error : " + e);
			return null;
		}
	}

	private boolean storeUserDataInDatabase(User user) {
		SessionFactory sf = null;
		Transaction tran = null;
		try {
			sf = HibernateConfig.getSessionFactory();
			Session session = sf.openSession();
			tran = session.beginTransaction();
			session.save(user);
			tran.commit();
			return true;
		} catch (Exception e) {
			tran.rollback();
			System.out.println("Error : " + e);
			return false;
		}

	}

}
