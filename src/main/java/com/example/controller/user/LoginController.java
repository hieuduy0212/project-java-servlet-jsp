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

@WebServlet(urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
    AccountDAO accountDAO = new AccountDAOImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/admin/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String pass = req.getParameter("pass");
        Account account = accountDAO.login(email, pass);
        if(account == null){
            req.setAttribute("email", email);
            req.setAttribute("message", "wrongAccount");
            req.getRequestDispatcher("view/admin/login.jsp").forward(req, resp);
        }else{
            HttpSession session = req.getSession();
            session.setAttribute("account", account);
            if(account.getIsAdmin() == 1){
                resp.sendRedirect("view/admin/index");
            }else{
                resp.sendRedirect("view/user/index");
            }
        }
    }
}
