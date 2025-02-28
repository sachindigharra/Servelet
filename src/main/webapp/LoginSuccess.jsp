package com.demo;

import java.io.IOException;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String USERNAME_PATTERN = "^[A-Z][a-zA-Z]{2,}$";
    private static final String PASSWORD_PATTERN = "^(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=])(?!.*[@#$%^&+=]{2,}).{8,}$";


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("user");
        String password = request.getParameter("pwd");


        if (isValidUsername(username) && isValidPassword(password)) {
            // Redirect to success page
            request.setAttribute("user", username);
            RequestDispatcher dispatcher = request.getRequestDispatcher("LoginSuccess.jsp");
            dispatcher.forward(request, response);
        } else {

            request.setAttribute("errorMessage", "Invalid Username or Password. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.html");
            dispatcher.forward(request, response);
        }
    }


    private boolean isValidUsername(String username) {
        return Pattern.matches(USERNAME_PATTERN, username);
    }


    private boolean isValidPassword(String password) {
        return Pattern.matches(PASSWORD_PATTERN, password);
    }
}