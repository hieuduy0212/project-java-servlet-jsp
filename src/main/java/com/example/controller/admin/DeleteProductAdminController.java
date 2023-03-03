package com.example.controller.admin;

import com.example.dao.ProductDAO;
import com.example.dao.impl.ProductDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/view/admin/delete-product"})
public class DeleteProductAdminController extends HttpServlet {
    ProductDAO productDAO = new ProductDAOImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        productDAO.deleteById(Integer.parseInt(id));
        resp.sendRedirect(req.getContextPath() + "/view/admin/product");
    }
}
