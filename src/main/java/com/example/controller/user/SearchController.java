package com.example.controller.user;

import com.example.dao.CategoryDAO;
import com.example.dao.ProductDAO;
import com.example.dao.impl.CategoryDAOImpl;
import com.example.dao.impl.ProductDAOImpl;
import com.example.entity.Category;
import com.example.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/view/user/search"})
public class SearchController extends HttpServlet {
    ProductDAO productDAO = new ProductDAOImpl();
    CategoryDAO categoryDAO = new CategoryDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> listC = categoryDAO.getAllCategory();
        req.setAttribute("listC", listC);

        String q = req.getParameter("keyname");
        List<Product> listP = productDAO.getProductByKeyWord(q);
        req.setAttribute("listP", listP);
        req.setAttribute("activenav", "shop");
        req.getRequestDispatcher("/view/user/shop.jsp").forward(req, resp);
    }
}
