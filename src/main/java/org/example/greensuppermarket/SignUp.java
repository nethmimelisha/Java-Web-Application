package org.example.greensuppermarket;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "SignUp", value = "/SignUp")
public class SignUp extends HttpServlet {
    private int Id; // Changed to private

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String fullName = request.getParameter("fullName");
        int phoneNumber = Integer.parseInt(request.getParameter("phoneNumber"));
        String email = request.getParameter("email");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        // JDBC variables
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Establish connection to your MySQL database
            conn = DatabaseManager.getConnection();

            // Check if user with the same email exists
            String checkUserQuery = "SELECT * FROM user WHERE email = ?";
            pstmt = conn.prepareStatement(checkUserQuery);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // User with this email already exists
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('Oops! User Already registed In This Email.');");
                out.println("location='login.jsp';");
                out.println("</script>");
            } else {
                // User with this email doesn't exist, proceed to insert
                String insertUserQuery = "INSERT INTO user (fullName, phoneNumber, email, userName, password) VALUES (?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(insertUserQuery, Statement.RETURN_GENERATED_KEYS);
                pstmt.setString(1, fullName);
                pstmt.setInt(2, phoneNumber);
                pstmt.setString(3, email);
                pstmt.setString(4, userName);
                pstmt.setString(5, password);

                // Execute the insert query
                int rowsInserted = pstmt.executeUpdate();

                // Get the generated keys (if any)
                if (rowsInserted > 0) {
                    rs = pstmt.getGeneratedKeys();
                    if (rs.next()) {
                        int Id = rs.getInt(1); // Assuming the ID column is auto-generated

                        // Create a User object
                        User user = new User(Id, fullName, email, phoneNumber, userName, password);
                        Main.users.add(user);

                        // Set user attribute in request scope
                        request.setAttribute("loggedInUser", user);

                        // Forward the request to your JSP
                        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
                        dispatcher.forward(request, response);
                        return; // Ensure to return after forwarding the request to avoid further processing
                    }
                }
                // If something went wrong or no rows were inserted, handle it
                response.sendRedirect("SignUp.jsp"); // Redirect to signup page if insertion failed
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions appropriately
            System.out.println(e);
            response.sendRedirect("error.jsp"); // Redirect to an error page
        } finally {
            // Close resources
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                System.out.println(ex);
            }
        }

        // Add your logic after retrieving the ID here
        // You may not want to add it to a User object directly without further handling
    }
}