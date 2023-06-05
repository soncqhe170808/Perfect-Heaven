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
import model.animalInfo;
import model.animalInfoDao;

/**
 *
 * @author FPT
 */
public class deleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        String idraw = request.getParameter("id");
        animalInfoDao aid = new animalInfoDao();
        
        if (idraw == null || idraw.trim().length() == 0) {
            pr.print("<h3>Empty Id!<h3>");
            request.getRequestDispatcher("delete.html").include(request, response);
            return;
        }
        animalInfo ai = new animalInfo();
        ai = aid.getAnimalById(idraw);
        if (ai == null) {
            pr.print("<h3>Id was not found!<h3>");
            request.getRequestDispatcher("delete.html").include(request, response);
            return;
        } else {
            request.setAttribute("dea", ai);
            request.getRequestDispatcher("confirmdelete.jsp").forward(request, response);
            return;
        }
         
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        String idraw = request.getParameter("id");
        animalInfoDao aid = new animalInfoDao();
        aid.delete(idraw);
        response.sendRedirect("list.jsp");
    }

}
