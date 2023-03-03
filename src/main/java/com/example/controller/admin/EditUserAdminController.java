package com.example.controller.admin;

import com.example.dao.AccountDAO;
import com.example.dao.impl.AccountDAOImpl;
import com.example.entity.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.applet.Applet;
import java.io.IOException;
@MultipartConfig
@WebServlet(urlPatterns = {"/view/admin/edit-user"})
public class EditUserAdminController extends HttpServlet {
    AccountDAO accountDAO = new AccountDAOImpl();
    private String id_req = null;
    private Account account = null;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        id_req = req.getParameter("id");
        int id = Integer.parseInt(id_req);
        account = accountDAO.getAccountById(id);
        req.setAttribute("account", account);
        req.getRequestDispatcher("/view/admin/edituser.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        Account account = accountDAO.getAccountById(Integer.parseInt(id_req));
        String name = req.getParameter("name").trim();
        String email = req.getParameter("email").trim();
        account.setName(name);
        account.setEmail(email);


        Part part = req.getPart("file-avatar");
        if(part.getSubmittedFileName().length() > 0){
            String filename = account.getId()+".png";
            String realPath = req.getServletContext().getRealPath("/view/admin/img");
            part.write(realPath + "/" + filename);
            account.setAvatar(filename);
        }
        boolean ss = accountDAO.editAccount(account);
        if(ss){
            req.setAttribute("message", "successEditAccount");
        }else{
            req.setAttribute("message", "errorEditAccount");
        }
        req.setAttribute("account", account);
        req.getRequestDispatcher("/view/admin/edituser.jsp").forward(req, resp);
    }
}
