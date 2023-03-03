package com.example.controller.admin;

import com.example.dao.CategoryDAO;
import com.example.dao.impl.CategoryDAOImpl;
import com.example.entity.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/view/admin/category"})
public class CategoryAdminController extends HttpServlet {
    CategoryDAO categoryDAO = new CategoryDAOImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> listC = categoryDAO.getAllCategory();
        req.setAttribute("listC", listC);
        req.getRequestDispatcher("/view/admin/category.jsp").forward(req, resp);
    }
}
