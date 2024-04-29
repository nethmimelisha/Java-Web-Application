package org.example.greensuppermarket;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SignIn extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // JDBC variables
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DatabaseManager.getConnection();
            String sql = "SELECT * FROM user WHERE userName = ? AND password = ?";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, request.getParameter("userName"));
            pstmt.setString(2, request.getParameter("password"));

            try (ResultSet resultSet = pstmt.executeQuery()) {
                if (resultSet.next()) {
                    // Fetch user data from the result set
                    int Id = resultSet.getInt("Id");
                    String fullName = resultSet.getString("fullName");
                    int phoneNumber = resultSet.getInt("phoneNumber");
                    String email = resultSet.getString("email");
                    String userName = resultSet.getString("userName");
                    String password = resultSet.getString("password");

                    // Create a User object and add it to the users list
                    User user = new User(Id, fullName, email, phoneNumber, userName, password);
                    Main.users.add(user);

                    // Set user attribute in request scope
                    request.setAttribute("loggedInUser", user);

                    // Forward the request to your JSP
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
                    dispatcher.forward(request, response);
                    System.out.println("User loaded: " + fullName);
                } else {
                    response.sendRedirect("signin.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


}
