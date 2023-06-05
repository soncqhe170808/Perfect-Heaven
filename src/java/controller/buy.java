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
import model.BillDao;
import model.BillDetailDao;
import model.animalInfo;
import model.animalInfoDao;
import model.kartDao;
import model.users;

/**
 *
 * @author FPT
 */
public class buy extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        String soldaid = request.getParameter("aid");
        users currUser = (users) request.getSession().getAttribute("currUser");
        if (currUser == null) {
            pr.print("<h3 style>color = red;</style>You must Login to perform this action!<h3>");
            request.getRequestDispatcher("login.html").include(request, response);
            return;
        }
        String buyerName = currUser.getName();
        BillDao bdao = new BillDao();
        
        animalInfoDao aid = new animalInfoDao();
        BillDetailDao bddao = new BillDetailDao();
        animalInfo ai = aid.getAnimalById(soldaid);
        aid.setAnimalToSold(soldaid);
        
        kartDao kd = new kartDao();
        bdao.insertBill(buyerName, ai.getPrice());
        int maxBid = bdao.getCurrentMaxBillId();
        bddao.insert(maxBid, soldaid);
        kd.removeKartByaAnimalId(soldaid);
        response.sendRedirect("index");
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
