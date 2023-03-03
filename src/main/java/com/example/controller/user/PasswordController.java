package com.example.controller.user;

import com.example.dao.AccountDAO;
import com.example.dao.impl.AccountDAOImpl;
import com.example.entity.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = {"/view/user/password"})
public class PasswordController extends HttpServlet {
    AccountDAO accountDAO = new AccountDAOImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/admin/password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        String curPass = req.getParameter("curpass");
        if(account.getPassword().equals(curPass)){
            String newPass = req.getParameter("newpass");
            account.setPassword(newPass);
            accountDAO.editPassword(account);
            req.setAttribute("message", "successChangePass");
            req.getRequestDispatcher("/view/admin/password.jsp").forward(req, resp);
        }else{
            req.setAttribute("message", "errorCurrentPass");
            req.getRequestDispatcher("/view/admin/password.jsp").forward(req, resp);
        }

    }
}
