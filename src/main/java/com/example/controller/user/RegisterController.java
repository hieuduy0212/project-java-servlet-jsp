package com.example.controller.user;

import com.example.dao.AccountDAO;
import com.example.dao.impl.AccountDAOImpl;
import com.example.entity.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/register")
public class RegisterController extends HttpServlet {
    AccountDAO accountDAO = new AccountDAOImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/admin/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        String name = req.getParameter("name");
        System.out.println(name);
        String email = req.getParameter("email");
        String avatar = "default.jpg";
        String pass = req.getParameter("pass");

        int totalA = accountDAO.getNumberOfAccount();
        Account account = new Account(totalA + 1, name, email, pass, avatar, 0);
        boolean success = accountDAO.register(account);

        if(success == true){
            resp.sendRedirect("login");
        }else{
            req.setAttribute("message", "emailExists");
            req.getRequestDispatcher("/view/admin/register.jsp").forward(req, resp);
        }
    }
}
