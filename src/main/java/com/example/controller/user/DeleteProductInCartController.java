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
import java.util.List;

@WebServlet(urlPatterns = {"/view/user/delete-in-cart"})
public class DeleteProductInCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        HttpSession session= req.getSession();
        Order order = (Order) session.getAttribute("order");
        List<Item> listItem = order.getListItem();
        for(Item item : listItem){
            if(item.getProduct().getId() == id){
                order.setSumPrice(order.getSumPrice()-item.getPrice());
                listItem.remove(item);break;
            }
        }
        order.setListItem(listItem);
        session.setAttribute("order", order);
        session.setAttribute("sum_price", order.getSumPrice());
        resp.sendRedirect(req.getContextPath()+"/view/user/cart");
    }
}
