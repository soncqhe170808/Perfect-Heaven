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
import java.sql.Date;
import model.animalInfo;
import model.animalInfoDao;

/**
 *
 * @author FPT
 */
public class insertServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        String idRaw, type, genderRaw, weightRaw, description, imgPath, dobRaw, priceRaw;
        Date dob;
        int id, price;
        float weight;
        char gender;
        animalInfoDao aid = new animalInfoDao();
        idRaw = request.getParameter("id");
        animalInfo sai = aid.getAnimalById(idRaw);
        if (sai != null) {
            pr.print("<h3>The animal with the id " + idRaw + " has already existed in the database !<h3>");
            request.getRequestDispatcher("insert.html").include(request, response);
            return;
        }
        if (idRaw == null || idRaw.trim().length() == 0) {
            pr.print("<h3>Empty Id!<h3>");
            request.getRequestDispatcher("insert.html").include(request, response);
            return;
        } else {
            id = Integer.parseInt(idRaw);

        }

        weightRaw = request.getParameter("weight");
        if (weightRaw == null || weightRaw.trim().length() == 0) {
            pr.print("<h3>Empty WeigthS!<h3>");
            request.getRequestDispatcher("insert.html").include(request, response);
            return;
        } else {
            weight = Float.parseFloat(weightRaw);

        }
        priceRaw = request.getParameter("price");
        if (priceRaw == null || priceRaw.trim().length() == 0) {
            pr.print("<h3>Empty WeigthS!<h3>");
            request.getRequestDispatcher("insert.html").include(request, response);
            return;
        } else {
            price = Integer.parseInt(priceRaw);

        }
        type = request.getParameter("type");
        genderRaw = request.getParameter("gender");
        gender = genderRaw.charAt(0);
        imgPath = request.getParameter("path");
        dobRaw = request.getParameter("dob");
        dob = Date.valueOf(dobRaw);
        description = request.getParameter("description");
        if (description == null || description.trim().length() == 0) {
           pr.print("<h3>emty description!!!</h3>");
           request.getRequestDispatcher("insert.html").include(request, response);
            return;
        }
        
        animalInfo newAi = new animalInfo(id, price, weight, type, description, imgPath, gender, dob, false);
        aid.insert(newAi);
        response.sendRedirect("list.jsp");
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
