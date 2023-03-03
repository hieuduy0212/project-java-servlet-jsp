package com.example.controller.admin;

import com.example.dao.AccountDAO;
import com.example.dao.impl.AccountDAOImpl;
import com.example.entity.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/view/admin/delete-user"})
public class DeleteUserAdminController extends HttpServlet {
    AccountDAO accountDAO = new AccountDAOImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        accountDAO.deleteById(Integer.parseInt(id));
        resp.sendRedirect(req.getContextPath()+ "/"  + "view/admin/user");
    }
}
