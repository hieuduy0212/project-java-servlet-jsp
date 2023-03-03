package com.example.controller.admin;

import com.example.dao.ContactDAO;
import com.example.dao.impl.ContactDAOImpl;
import com.example.entity.Contact;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/view/admin/contact"})
public class ContactAdminController extends HttpServlet {
    ContactDAO contactDAO = new ContactDAOImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Contact> listCt = contactDAO.getAllContact();
        req.setAttribute("listCt", listCt);
        req.getRequestDispatcher("/view/admin/contact.jsp").forward(req, resp);
    }
}
