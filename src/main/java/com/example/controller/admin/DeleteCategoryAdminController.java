package com.example.controller.admin;

import com.example.dao.CategoryDAO;
import com.example.dao.impl.CategoryDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.concurrent.Executors;

@WebServlet(urlPatterns = {"/view/admin/delete-category"})
public class DeleteCategoryAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        CategoryDAO categoryDAO = new CategoryDAOImpl();
        categoryDAO.deleteById(Integer.parseInt(id));
        resp.sendRedirect(req.getContextPath() + "/view/admin/category");

    }
}
