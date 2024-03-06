package backend;

import java.io.IOException;
import java.io.OutputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.User;

@WebServlet("/download-pdf")
public class DownloadResumeServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Retrieve the user ID from request parameter
	    int userId = Integer.parseInt(req.getParameter("id"));

	    // Retrieve the User object from the database based on the user ID
	    User user = UserDetailServlet.retrieveUserDetailsById(userId);

	    // Retrieve the PDF data (BLOB) from the User object
	    byte[] resumeData = user.getResume();

	    // Set response headers for file download
	    resp.setContentType("application/pdf");
	    resp.setHeader("Content-Disposition", "attachment; filename=\"resume.pdf\"");

	    // Write the PDF data to the response output stream
	    try (OutputStream out = resp.getOutputStream()) {
	        out.write(resumeData);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}
}
