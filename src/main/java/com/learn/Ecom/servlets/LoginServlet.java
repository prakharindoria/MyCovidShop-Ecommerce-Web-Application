
package com.learn.Ecom.servlets;

import com.learn.Ecom.dao.UserDao;
import com.learn.Ecom.entities.User;
import com.learn.Ecom.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession httpSession =request.getSession();
            String userEmail=request.getParameter("email");
            String userPassword=request.getParameter("password");

            //validations
            if(userEmail.isEmpty() || userPassword.isEmpty()){
                httpSession.setAttribute("message","Fields Empty.");
                response.sendRedirect("login.jsp");
                return;
            }

            //authentication
            UserDao userDao = new UserDao(FactoryProvider.getFactory());
            User user = userDao.getUserByEmailAndPassword(userEmail, userPassword);

            

            if(user==null){
                httpSession.setAttribute("message","Invalid Email or Password.");
                response.sendRedirect("login.jsp");
                return;
            }
            else{
                out.println("<h1>Welcome "+user.getUserName()+ "</h1>"); 
            }   
            //login user
            httpSession.setAttribute("current-user",user);

           
            if(user.getUserType().equals("admin")){
                response.sendRedirect("admin.jsp");
            }else if(user.getUserType().equals("normal")){
                response.sendRedirect("normal.jsp");
            }else{
                out.println("<h1>We have not identified User Type.");
            }
            
            



        }
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
