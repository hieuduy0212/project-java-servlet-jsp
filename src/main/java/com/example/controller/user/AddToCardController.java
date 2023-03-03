package com.example.controller.user;

import com.example.dao.ProductDAO;
import com.example.dao.impl.ProductDAOImpl;
import com.example.entity.Account;
import com.example.entity.Item;
import com.example.entity.Order;
import com.example.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/view/user/add-to-cart"})

public class AddToCardController extends HttpServlet {
    ProductDAO productDAO = new ProductDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            int qty = 1;
            DecimalFormat df = new DecimalFormat("#.00");
            String id = req.getParameter("id");

            Product product = null;
            if (id != null) {
                product = productDAO.getProductByID(Integer.parseInt(id));
            }
            if (product != null) {
                if (req.getParameter("qty") != null) {
                    qty = Integer.parseInt(req.getParameter("qty"));
                }
                Order order = (Order) session.getAttribute("order");
                if (order != null) { //da tung bam them vao gio hang
                    boolean check = false;//sp chua co trong gio hang
                    List<Item> listItem = order.getListItem();
                    for (Item item : listItem) {
                        if (item.getProduct().getId() == Integer.parseInt(id)) {
                            check = true;// da co trong order
                        }
                    }
                    //th1: product da co trong order
                    if (check == true) {
                        for (Item item : listItem) {
                            if (item.getProduct().getId() == Integer.parseInt(id)) {
                                order.setSumPrice(order.getSumPrice() - item.getPrice());
                                item.setQty(item.getQty() + qty);
                                item.setPrice(item.getQty() * product.getPrice());
                                order.setSumPrice(order.getSumPrice() + item.getPrice());
                                break;
                            }
                        }
                    } else {//th2: product chua co trong order
                        Item item = new Item(product, qty, qty * product.getPrice());
                        listItem.add(item);
                        order.setListItem(listItem);
                        order.setSumPrice(order.getSumPrice() + item.getPrice());
                    }
                    int size_order = order.getListItem().size();
                    session.setAttribute("order", order);
                    session.setAttribute("size_order", size_order);
                    session.setAttribute("sum_price", df.format(order.getSumPrice()));
                } else { // lan dau bam them vao gio hang
                    order = new Order();
                    List<Item> listItem = new ArrayList<>();
                    Item item = new Item(product, qty, qty * product.getPrice());
                    listItem.add(item);
                    order.setListItem(listItem);
                    order.setSumPrice(0);
                    order.setSumPrice(item.getPrice());
                    int size_order = 1;
                    session.setAttribute("order", order);
                    session.setAttribute("size_order", size_order);
                    session.setAttribute("sum_price", df.format(order.getSumPrice()));
                }
                resp.sendRedirect(req.getContextPath() + "/view/user/shop?c=0");
            } else {
                resp.sendRedirect(req.getContextPath() + "/view/user/shop?c=0");
            }
        }else{
            resp.sendRedirect(req.getContextPath() + "/login");
        }
    }
}
