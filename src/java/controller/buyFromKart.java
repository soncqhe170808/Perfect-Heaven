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
public class buyFromKart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
//        String soldaid = request.getParameter("aid");
        users currUser = (users) request.getSession().getAttribute("currUser");
        String buyerName = currUser.getName();
        BillDao bdao = new BillDao();
        kartDao kd = new kartDao();
        animalInfoDao aid = new animalInfoDao();
        BillDetailDao bddao = new BillDetailDao();
        String[] animalIDFromKart = request.getParameterValues("kartBill");
        
        
        if (animalIDFromKart == null || animalIDFromKart.length == 0) {
            pr.print("<h3>please choose an animal in your kart to perform the action !</h3>");
            request.getRequestDispatcher("kart.jsp").include(request, response);
            return;
        }
        
        
        String submitResult = request.getParameter("submit");

        if (submitResult.equals("Pay for the selected items?")) {
            String kaidRaw;
            int price = 0;
            animalInfo ai = new animalInfo();
            for (int i = 0; i < animalIDFromKart.length; i++) {
                kaidRaw = animalIDFromKart[i];

                ai = aid.getAnimalById(kaidRaw);
                price += ai.getPrice();
            }
            bdao.insertBill(buyerName, price);
            int maxBid = bdao.getCurrentMaxBillId();
            for (int i = 0; i < animalIDFromKart.length; i++) {
                kaidRaw = animalIDFromKart[i];
                aid.setAnimalToSold(kaidRaw);
                bddao.insert(maxBid, kaidRaw);
                kd.removeKartByaAnimalId(kaidRaw);
            }
        } 
        
        
        else {
            for (int i = 0; i < animalIDFromKart.length; i++) {
                kd.removefromOneKart(buyerName, animalIDFromKart[i]);
            }
        }

        response.sendRedirect("index");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
