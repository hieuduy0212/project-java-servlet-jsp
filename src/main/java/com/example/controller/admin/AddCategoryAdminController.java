package com.example.controller.admin;

import com.example.dao.CategoryDAO;
import com.example.dao.impl.CategoryDAOImpl;
import com.example.entity.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

@WebServlet(urlPatterns = {"/view/admin/add-category"})
@MultipartConfig
public class AddCategoryAdminController extends HttpServlet {
    CategoryDAO categoryDAO = new CategoryDAOImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/admin/addcategory.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("utf-8");
        String name = req.getParameter("name");
        String filename = "default.png";
        Category lastestCategory = categoryDAO.getLatestCategory();
        int maxid = 1;
        if(lastestCategory != null){
            maxid = lastestCategory.getId()  + 1;
        }

        Part part = req.getPart("file-image");
        if(part.getSubmittedFileName().length() > 0){
            String realpath = req.getServletContext().getRealPath("/view/admin/img/category");
            filename = maxid + ".png";
            part.write(realpath + "/" + filename);
        }

        Category category = new Category();
        category.setId(maxid);
        category.setCname(name);
        category.setCimage(filename);

        boolean ss = categoryDAO.addCategory(category);
        if (ss) {
            req.setAttribute("message", "successAddCategory");
        } else {
            req.setAttribute("message", "errorAddCategory");
        }
        req.getRequestDispatcher("/view/admin/addcategory.jsp").forward(req, resp);
    }
}
