package com.example.controller.user;

import com.example.dao.CategoryDAO;
import com.example.dao.FavoriteDAO;
import com.example.dao.ProductDAO;
import com.example.dao.impl.CategoryDAOImpl;
import com.example.dao.impl.FavoriteDAOIpml;
import com.example.dao.impl.ProductDAOImpl;
import com.example.entity.Account;
import com.example.entity.Category;
import com.example.entity.Favorite;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

@WebServlet(urlPatterns = {"","/view/user/index"})
public class HomeControllerUser extends HttpServlet {
    ProductDAO productDAO = new ProductDAOImpl();
    CategoryDAO categoryDAO = new CategoryDAOImpl();
    FavoriteDAO favoriteDAO= new FavoriteDAOIpml();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        List<Category> listC = categoryDAO.getAllCategory();
        HttpSession session = req.getSession();
        if((Account)session.getAttribute("account") != null){
            Account account=(Account)session.getAttribute("account");
            List<Favorite> listF = favoriteDAO.getAllFavoriteOfUser(account.getId());
            session.setAttribute("listF", listF);
        }
        req.setAttribute("listC", listC);
        HashMap<Integer, Integer> listQ = categoryDAO.getQuantityOfEachCategory();

        req.setAttribute("listQ", listQ); // quantity of each category
        req.setAttribute("activenav", "home");
        req.getRequestDispatcher("/view/user/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
