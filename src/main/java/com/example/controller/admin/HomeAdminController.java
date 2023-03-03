package com.example.controller.admin;

import com.example.dao.StatisticDAO;
import com.example.dao.impl.StatisticDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/view/admin/index"})
public class HomeAdminController extends HttpServlet {
    StatisticDAO statisticDAO = new StatisticDAOImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double totalSales = statisticDAO.getTotalSales();
        req.setAttribute("totalSales", totalSales);
        req.getRequestDispatcher("/view/admin/index.jsp").forward(req, resp);
    }
}
