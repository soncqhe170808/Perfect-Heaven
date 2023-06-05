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
import model.animalInfo;
import model.animalInfoDao;

/**
 *
 * @author FPT
 */
public class searchByDescription extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        String description = request.getParameter("description").trim();
        animalInfoDao aid = new animalInfoDao();
        List<animalInfo> foundList = aid.searchByDescription(description);
//        int i = aid.searchByDescription(description);
//        pr.print(i);
//        pr.print(foundList.size());
        int i = 0;
        request.setAttribute("offSet", 0);
        request.setAttribute("list", foundList);
        request.getRequestDispatcher("frontPage.jsp").forward(request, response);
    }

}
