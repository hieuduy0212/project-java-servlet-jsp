package com.example.controller.user;

import com.example.dao.TransactionDAO;
import com.example.dao.OrderedDAO;
import com.example.dao.impl.OrderedDAOImpl;
import com.example.dao.impl.TransactionDAOImpl;
import com.example.entity.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = {"/view/user/checkout"})
public class CheckoutController extends HttpServlet {
    TransactionDAO transactionDAO = new TransactionDAOImpl();
    OrderedDAO orderedDAO = new OrderedDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("activenav", "checkout");
        req.getRequestDispatcher("/view/user/checkout.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        if (session.getAttribute("order") != null) {
            Order order = (Order) session.getAttribute("order");
            //ten nguoi nhan hang
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phone_number = req.getParameter("phone_number");
            String address1 = req.getParameter("address1");
            String country = req.getParameter("country");
            String city = req.getParameter("city");
            String zipcode = req.getParameter("zipcode");
            String payment = req.getParameter("payment");
            //thoi gian thanh toan
            Date created = new Date(System.currentTimeMillis());
            //tai khoan id
            Account account = (Account) session.getAttribute("account");
            int user_id = account.getId();

            Transaction transactionLatest = transactionDAO.getLatest();
            int maxid = 1;
            if (transactionLatest != null) {
                maxid = transactionLatest.getId() + 1;
            }
            Transaction transaction = new Transaction();
            transaction.setId(maxid);
            transaction.setUser_id(user_id);
            transaction.setName(name);
            transaction.setEmail(email);
            transaction.setPhone_number(phone_number);
            transaction.setAddress1(address1);
            transaction.setCountry(country);
            transaction.setCity(city);
            transaction.setZipcode(zipcode);
            transaction.setPayment(payment);
            transaction.setTotal(order.getSumPrice() + 10);

            boolean ss = transactionDAO.insert(transaction);
            if (ss) {
                req.setAttribute("message", "successCheckout");
                req.getRequestDispatcher("/view/user/checkout.jsp").forward(req, resp);
            } else {
                req.setAttribute("message", "errorCheckout");
                req.getRequestDispatcher("/view/user/checkout.jsp").forward(req, resp);
            }
            List<Item> listItem = order.getListItem();
            for (Item item : listItem) {
                Ordered ordered = new Ordered();
                ordered.setTransaction_id(maxid);
                ordered.setProduct_id(item.getProduct().getId());
                ordered.setQty(item.getQty());
                orderedDAO.insert(ordered);
            }
            if (session != null) {
                session.removeAttribute("order");
                session.removeAttribute("sum_price");
                session.removeAttribute("size_order");
            }
        } else{
            resp.sendRedirect(req.getContextPath() + "/view/user/checkout");
        }
    }
}
