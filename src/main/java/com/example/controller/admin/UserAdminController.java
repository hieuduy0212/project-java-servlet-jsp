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
import java.util.List;

@WebServlet(urlPatterns = {"/view/admin/user"})
public class UserAdminController extends HttpServlet {
    AccountDAO accountDAO = new AccountDAOImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Account> listA = accountDAO.getAll();
        req.setAttribute("listA", listA);
        req.getRequestDispatcher("/view/admin/user.jsp").forward(req, resp);
    }
}
