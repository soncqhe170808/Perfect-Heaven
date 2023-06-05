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
import java.util.List;
import model.animalInfo;
import model.animalInfoDao;

/**
 *
 * @author FPT
 */
public class index extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        animalInfoDao aid = new animalInfoDao();
        String offSetRaw = request.getParameter("offSet");
        int count = aid.getCount();
        int offSet = 0;
        if (offSetRaw == null) {
            offSet = 0;
        } else {
            if (Integer.parseInt(offSetRaw) < 0) {
                offSet = 0;
            } else {
                if (Integer.parseInt(offSetRaw) <= count) {
                    offSet = Integer.parseInt(offSetRaw);
                } else {
                    offSet = Integer.parseInt(offSetRaw) - 12;
                }
            }

        }

        request.setAttribute("offSet", offSet);
        List<animalInfo> list = aid.getAllAnimalNotSoldwithPaging(offSet, 12);
        request.setAttribute("list", list);
        request.getRequestDispatcher("frontPage.jsp").forward(request, response);

    }

}
