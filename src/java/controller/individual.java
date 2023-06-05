/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import model.animalInfo;

/**
 *
 * @author FPT
 */
@WebServlet(name = "individual", urlPatterns = {"/individual"})
public class individual extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idRaw, weightRaw, type, description, imgPath, genderRaw, dobRaw, priceRaw, soldRaw;
        Date dob;
        int id, price;
        float weight;
        boolean sold;
        idRaw = request.getParameter("id");
        type = request.getParameter("type");
        genderRaw = request.getParameter("gender");
        dobRaw = request.getParameter("dob");
        weightRaw = request.getParameter("weight");
        description = request.getParameter("description");
        imgPath = request.getParameter("path");
        priceRaw = request.getParameter("price");
        soldRaw = request.getParameter("sold");
        if (idRaw != null && weightRaw != null) {
            id = Integer.parseInt(idRaw);
            weight = Float.parseFloat(weightRaw);
            price = Integer.parseInt(priceRaw);
            char gender = genderRaw.charAt(0);
            dob = Date.valueOf(dobRaw);
            sold = Boolean.valueOf(soldRaw);
            animalInfo ai = new animalInfo(id, price, weight, type, description, imgPath, gender, dob, false);
            request.setAttribute("ai", ai);
            request.getRequestDispatcher("individual.jsp").forward(request, response);
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
