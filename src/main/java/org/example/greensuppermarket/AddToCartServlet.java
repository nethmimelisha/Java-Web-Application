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
import java.io.PrintWriter;


public class AddToCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String productId = request.getParameter("productId");
            String quantity = "1";

            Cart cart = (Cart) request.getSession().getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                request.getSession().setAttribute("cart", cart);
            }

            // Retrieve the product from Main.products based on the productId
            int productIdInt = Integer.parseInt(productId);
            Product productToAdd = null;
            for (Product product : Main.products) {
                if (product.getId() == productIdInt) {
                    productToAdd = product;
                    break;
                }
            }

            if (productToAdd != null) {
                cart.addToCart(productToAdd, Integer.parseInt(quantity));

                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('Product added to cart successfully!');");
                out.println("location='index.jsp';");
                out.println("</script>");
            } else {
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('Product not found!');");
                out.println("location='index.jsp';");
                out.println("</script>");
            }
        }catch (Exception e){
            System.out.println(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the productId parameter from the form
        String productId = request.getParameter("productId");

        // Retrieve the cart from the session
        Cart cart = (Cart) request.getSession().getAttribute("cart");

        if (cart != null) {
            // Convert productId to an integer (assuming productId is an integer)
            int idToRemove = Integer.parseInt(productId);

            // Get the cart items and remove the item with the given productId
            Product productToRemove = null;
            for (Product product : cart.getItems()) {
                if (product.getId() == idToRemove) {
                    productToRemove = product;
                    break;
                }
            }

            if (productToRemove != null) {
                // Remove the product from the cart
                cart.getItems().remove(productToRemove);
                // Update total items and total price if needed
                // cart.setTotalItems(cart.getTotalItems() - 1);
                // cart.setTotalPrice(cart.getTotalPrice() - productToRemove.getPrice());
            }
            // Redirect back to the cart page
            response.sendRedirect("cart.jsp");
        }
    }
}
