package com.example.controller.admin;

import com.example.dao.CategoryDAO;
import com.example.dao.ProductDAO;
import com.example.dao.impl.CategoryDAOImpl;
import com.example.dao.impl.ProductDAOImpl;
import com.example.entity.Category;
import com.example.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@WebServlet(urlPatterns = {"/view/admin/add-product"})
@MultipartConfig
public class AddProductAdminController extends HttpServlet {
    ProductDAO productDAO = new ProductDAOImpl();
    CategoryDAO categoryDAO = new CategoryDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> listC = categoryDAO.getAllCategory();
        req.setAttribute("listC", listC);
        req.getRequestDispatcher("/view/admin/addproduct.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        String name = req.getParameter("name");
        String price = req.getParameter("price");
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        String category = req.getParameter("category");

        Product latestProduct = productDAO.getLatest();
        int maxid = 1;
        if (latestProduct != null) {
            maxid = latestProduct.getId() + 1;
        }

        String filename = "default.png";

        Part part = req.getPart("file-image");

        if (part.getSubmittedFileName().length() > 0) {
            String filePath = req.getServletContext().getRealPath("/view/admin/img/product");
            filename = maxid + ".png";
            part.write(filePath + "/" + filename);
        }
        Product product = new Product();
        product.setId(maxid);
        product.setName(name);
        product.setImage(filename);
        product.setPrice(Double.parseDouble(price));
        product.setTitle(title);
        product.setDescription(description);
        product.setCateID(Integer.parseInt(category));
        boolean ss = productDAO.addProduct(product);
        if (ss == true) {
            req.setAttribute("message", "successAddProduct");
        } else {
            req.setAttribute("message", "errorAddProduct");
        }
        req.getRequestDispatcher("/view/admin/addproduct.jsp").forward(req, resp);
    }
}
