package com.example.controller.user;

import com.example.dao.ContactDAO;
import com.example.dao.impl.ContactDAOImpl;
import com.example.entity.Contact;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/view/user/contact"})
public class AddContactController extends HttpServlet {
    ContactDAO contactDAO = new ContactDAOImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("activenav", "contact");
        req.getRequestDispatcher("/view/user/contact.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String subject = req.getParameter("subject");
        String message = req.getParameter("message");
        contactDAO.add(new Contact(name, email, subject, message));
        resp.sendRedirect(req.getContextPath()+"/view/user/contact");
    }
}
