package org.example.greensuppermarket;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import com.paypal.base.rest.PayPalRESTException;

@WebServlet(name = "placeOrder", value = "/placeOrder")
public class placeOrder extends HttpServlet {
    private static final String CLIENT_ID ="AUO-y1tpAgFBQkQ0S1NJqJ2ThVOAg90_qu2DdWdHR5mqnLeEr5SiMQThFIwMqPBnQOPFaafkUxrAkWBx";
    private static final String CLIENT_SECR ="EP2ThDkQP9Ezv7EwG-TaWdsVeNbBawsJqi9Wl0L7-KKVRD3L4MEnLjYO4BroaI71RgeVtHNiQXx3zjmV";
    private static final String MODE ="sandbox";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle user input from the payment form
        String cardholderName = request.getParameter("cardholder-name");
        String cardNumber = request.getParameter("card-number");
        String expiryDay = request.getParameter("day");
        String expiryMonth = request.getParameter("month");
        String cvv = request.getParameter("cvv");
        System.out.println(cardholderName);
        System.out.println(cardNumber);
        System.out.println(expiryDay);
        System.out.println(expiryMonth);
        System.out.println(cvv);
        try {
            // Process payment using PayPal API
            PaymentResult paymentResult = processPayment(cardholderName, cardNumber, expiryDay, expiryMonth, cvv);

            if (paymentResult.isSuccess()) {
                // Payment successful, send confirmation email
                sendConfirmationEmail();

                // Redirect to a thank you page or confirmation page
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('Payment Successful, Thank you!');");
                out.println("location='payment.jsp';");
                out.println("</script>");
            } else {
                // Payment failed, handle accordingly (display error message, redirect, etc.)
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('Payment failed. Please try again.');");
                out.println("location='payment.jsp';");
                out.println("</script>");
            }
        } catch (PayPalRESTException e) {
            // Handle PayPal API exceptions
            e.printStackTrace();
            // Redirect or show an error message to the user
        }
    }


    private PaymentResult processPayment(String cardholderName, String cardNumber, String expiryDay, String expiryMonth, String cvv) throws PayPalRESTException {
        // Implement PayPal payment processing logic here
        // Use PayPal SDK to initiate payment
        // Return a PaymentResult object indicating the success or failure of the payment
        // Sample code: Create payment, execute payment, and handle response
        // Reference: https://developer.paypal.com/docs/api/payments/

        // Example:
        Payment payment = createPayment();
        PaymentExecution paymentExecution = new PaymentExecution();
        return executePayment(payment.getId(), paymentExecution);
    }

    private PaymentResult executePayment(String id, PaymentExecution paymentExecution) throws PayPalRESTException {
        // Set up your PayPal API credentials and API context
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECR, MODE);

        // Execute the payment using the PayPal SDK
        Payment payment = new Payment();
        payment.setId(id);

        Payment executedPayment = payment.execute(apiContext, paymentExecution);

        // Return a PaymentResult indicating success or failure based on the payment state
        if ("approved".equalsIgnoreCase(executedPayment.getState())) {
            return new PaymentResult(true);
        } else {
            return new PaymentResult(false);
        }
    }


    private Payment createPayment() throws PayPalRESTException {
        // Set up your PayPal API credentials and API context
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECR, MODE);

        // Create payment details
        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal("10.00"); // Replace with the total amount from the cart or user input

        Transaction transaction = new Transaction();
        transaction.setDescription("Your purchase description");
        transaction.setAmount(amount);

        List<Transaction> transactions = new ArrayList<>();
        transactions.add(transaction);

        // Set redirect URLs
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setReturnUrl("YOUR_RETURN_URL");
        redirectUrls.setCancelUrl("YOUR_CANCEL_URL");

        // Create a payment object
        Payment payment = new Payment();
        payment.setIntent("sale");
        payment.setPayer(new Payer());
        payment.setTransactions(transactions);
        payment.setRedirectUrls(redirectUrls);

        // Create the payment using the PayPal SDK
        return payment.create(apiContext);
    }

    private void sendConfirmationEmail() {
        // Implement sending confirmation email logic using JavaMail or an email service provider's API
        // Construct email content and send it to the user's email
    }
}

class PaymentResult {
    private boolean success;

    public PaymentResult(boolean success) {
        this.success = success;
    }

    public boolean isSuccess() {
        return success;
    }
}