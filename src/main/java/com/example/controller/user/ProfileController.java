package com.example.controller.user;

import com.example.dao.AccountDAO;
import com.example.dao.impl.AccountDAOImpl;
import com.example.entity.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(urlPatterns = {"/view/user/profile"})
@MultipartConfig
public class ProfileController extends HttpServlet {
    AccountDAO accountDAO = new AccountDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/admin/profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        HttpSession session = req.getSession();

        Account account = (Account) session.getAttribute("account");

        String name = req.getParameter("name");
        String email = req.getParameter("email");

        Part part = req.getPart("fileavatar");

        if (part.getSubmittedFileName().length() > 0) {
            String filename = account.getId() + ".png";
            String filePath = req.getServletContext().getRealPath("/view/admin/img");
            part.write(filePath + "/" + filename);
            account.setAvatar(filename);
        }
        if (!account.getName().equals(name)) account.setName(name);
        if (!account.getEmail().equals(email)) account.setName(email);

        accountDAO.editProfile(account);

        session.setAttribute("account", account);
        resp.sendRedirect(req.getContextPath() + "/view/user/profile");
    }

}
