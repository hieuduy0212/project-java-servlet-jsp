package com.example.controller.user;

import com.example.entity.Item;
import com.example.entity.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.LinkedList;
import java.util.List;

@WebServlet(urlPatterns = {"/view/user/update-cart"})
public class UpdateCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(req.getContextPath() + "/view/user/cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("order") != null) {
            DecimalFormat df = new DecimalFormat("#.00");
            Order order = (Order) session.getAttribute("order");
            List<Item> listItem = order.getListItem();
            order.setSumPrice(0);
            List<Item> newListItem = new LinkedList<>();
            for (Item item : listItem) {
                int qty = Integer.parseInt(req.getParameter(item.getProduct().getId() + ""));
                if (qty == 0) {
                    continue;
                } else {
                    Item item1 = item;
                    item1.setQty(qty);
                    item1.setPrice(qty * item1.getProduct().getPrice());
                    order.setSumPrice(order.getSumPrice() + item1.getPrice());
                    newListItem.add(item1);
                }
            }
            order.setListItem(newListItem);
            session.setAttribute("order", order);
            session.setAttribute("size_order", order.getListItem().size());
            session.setAttribute("sum_price", df.format(order.getSumPrice()));
        }
        resp.sendRedirect(req.getContextPath() + "/view/user/cart");
    }
}
