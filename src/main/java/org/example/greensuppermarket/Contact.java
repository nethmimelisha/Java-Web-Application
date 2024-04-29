/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.example.greensuppermarket;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;


public class Contact extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int Id = 0;

        String name = request.getParameter("Your name");
        String email = request.getParameter("Your Email");
        String message = request.getParameter("Your message");

        try {
            conn = DatabaseManager.getConnection();

            String sql = "INSERT INTO review (name, email, message) VALUES (?, ?, ?)";
            pstmt =  conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, message);

            // Execute the insert query
            int rowsInserted = pstmt.executeUpdate();

            // Get the generated keys (if any)
            if (rowsInserted > 0) {
                rs = pstmt.getGeneratedKeys();
                if (rs.next()) {
                    Id = rs.getInt(1); // Assuming the ID column is auto-generated
                }
            }
            Review review = new Review(Id, name, email, message);
            Main.reviews.add(review);
            System.out.println(Id);
            System.out.println(name);
            System.out.println(email);
            System.out.println(message);

        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
