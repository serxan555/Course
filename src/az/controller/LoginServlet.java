package az.controller;

import az.config.UserRepository;
import az.model.User;
import az.util.Algoritms;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String addressJSP = "";
        String action = "";
        UserRepository userRepository = new UserRepository();
        if (request.getParameter("action") != null) {
            action = request.getParameter("action");
        }
        try {
            if (action.equalsIgnoreCase("doLogin")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                if (username == null || username.trim().equals("")
                        || password == null || password.trim().equals("")) {
                    request.setAttribute("errorMessage", "Please fill empti fields!");
                    addressJSP = "login.jsp";
                } else {
                    HttpSession userSession = request.getSession(true);
                    User user = userRepository.doLogin(username, Algoritms.Sha256(password));
                    if (user == null) {
                        request.setAttribute("errorMessage", "Invalid Username or Password");
                        addressJSP = "login.jsp";
                    } else {
                        userSession.setAttribute("user", user);
                        addressJSP = "index.jsp";
                    }
                }
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher(addressJSP);
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
