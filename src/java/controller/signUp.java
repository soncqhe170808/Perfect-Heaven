/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.users;
import model.usersDAO;

/**
 *
 * @author FPT
 */
public class signUp extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("userName");
        usersDAO ud = new usersDAO();
        if (ud.getUser(userName) != null) {

        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        users u = new users();
        usersDAO ud = new usersDAO();
        String userName = request.getParameter("userName");
        String passWord = request.getParameter("password");
        String email = request.getParameter("email");
        if (userName == null || userName.length() == 0 || passWord == null || passWord.length() == 0 || email == null || email.length() == 0) {
            pr.print("<h3>Empty fields<h3>");
            request.getRequestDispatcher("signUp.html").include(request, response);
            return;
        } else {
            if (ud.getUser(userName) != null) {
                pr.print("<h3>Existing userName, userName must be unique<h3>");
                request.getRequestDispatcher("signUp.html").include(request, response);
                return;
            }
            if (ud.getUserByEmail(email) != null) {
                pr.print("<h3>Dupliacet email<h3>");
                request.getRequestDispatcher("signUp.html").include(request, response);
                return;
            }
            
            ud.insert(passWord, userName, email);
            response.sendRedirect("login.html");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
