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
import java.util.List;

//edit info òf product in list
@WebServlet(urlPatterns = {"/view/admin/edit-product"})
@MultipartConfig
public class EditProductAdminController  extends HttpServlet {
    ProductDAO productDAO = new ProductDAOImpl();
    CategoryDAO categoryDAO = new CategoryDAOImpl();
    private String id_req = null;
    private List<Category> listC = null;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        id_req = req.getParameter("id");
        int id = Integer.parseInt(id_req);
        Product product = productDAO.getProductByID(id);
        req.setAttribute("product", product);
        listC = categoryDAO.getAllCategory();
        req.setAttribute("listC", listC);
        req.getRequestDispatcher("/view/admin/editproduct.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        String name = req.getParameter("name").trim();
        String price = req.getParameter("price").trim();
        String title = req.getParameter("title").trim();
        String description = req.getParameter("description");
        String category = req.getParameter("category");
        Product product=productDAO.getProductByID(Integer.parseInt(id_req));
        product.setName(name);
        product.setPrice(Double.parseDouble(price));
        product.setTitle(title);
        product.setDescription(description);
        product.setCateID(Integer.parseInt(category));

        Part part = req.getPart("file-image");
        if(part.getSubmittedFileName().length() > 0){
            String filePath = req.getServletContext().getRealPath("/view/admin/img/product");
            String filename = product.getId() + ".png";
            part.write(filePath + "/" + filename);
            product.setImage(filename);
        }
        boolean ss = productDAO.editProduct(product);
        if(ss){
            req.setAttribute("message", "successEditProduct");
        }else{
            req.setAttribute("message", "errorEditProduct");
        }
        req.setAttribute("product", product);
        req.setAttribute("listC", listC);
        req.getRequestDispatcher("/view/admin/editproduct.jsp").forward(req, resp);
    }
}
