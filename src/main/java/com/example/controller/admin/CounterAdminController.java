package com.example.controller.admin;

import com.example.dao.StatisticDAO;
import com.example.dao.impl.StatisticDAOImpl;
import com.example.entity.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(urlPatterns = {"/view/admin/count"})
public class CounterAdminController extends HttpServlet {
    StatisticDAO statisticDAO = new StatisticDAOImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("hello");
        HashMap<Category, Integer> hmap = statisticDAO.getCountByCategory();
        for(Map.Entry<Category, Integer> entry : hmap.entrySet()){
            System.out.println(entry.getKey().getCname() + " " + entry.getValue());
        }
        req.setAttribute("hmap", hmap);
        req.getRequestDispatcher("/view/admin/statistic.jsp").forward(req, resp);
    }
}
