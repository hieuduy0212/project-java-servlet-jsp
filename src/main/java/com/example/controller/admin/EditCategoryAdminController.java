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

@WebServlet(urlPatterns = {"/view/admin/edit-category"})
@MultipartConfig
public class EditCategoryAdminController extends HttpServlet {
    CategoryDAO categoryDAO = new CategoryDAOImpl();
    String id_req = null;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        id_req = req.getParameter("id");
        Category category = categoryDAO.getCategoryById(Integer.parseInt(id_req));
        req.setAttribute("category", category);
        req.getRequestDispatcher("/view/admin/editcategory.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");


        Category category = categoryDAO.getCategoryById(Integer.parseInt(id_req));

        String name = req.getParameter("name").trim();
        category.setCname(name);

        Part part = req.getPart("file-image");
        if (part.getSubmittedFileName().length() > 0) {
            String realpath = req.getServletContext().getRealPath("/view/admin/img/category");
            String filename = category.getId() + ".png";
            part.write(realpath + "/" + filename);
            category.setCimage(filename);
        }
        boolean ss = categoryDAO.editCategory(category);
        if (ss) {
            req.setAttribute("message", "successEditCategory");
        } else {
            req.setAttribute("message", "errorEditCategory");
        }
        req.setAttribute("category", category);
        req.getRequestDispatcher("/view/admin/editcategory.jsp").forward(req, resp);
    }
}
