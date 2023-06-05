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
import java.util.ArrayList;
import java.util.List;
import model.BillDetail;
import model.BillDetailDao;
import model.animalInfo;

/**
 *
 * @author FPT
 */
public class billDetailServlet extends HttpServlet {
   
   

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String bidRaw = request.getParameter("bid");
        BillDetailDao bddao = new BillDetailDao();
        List<animalInfo> bdList = bddao.getSoldAnimalByBillId(bidRaw);
        request.setAttribute("billAnimal", bdList);
        request.getRequestDispatcher("billDetail.jsp").forward(request, response);
    } 

    
}
