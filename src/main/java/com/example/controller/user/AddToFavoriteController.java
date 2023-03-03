package com.example.controller.user;

import com.example.dao.FavoriteDAO;
import com.example.dao.impl.FavoriteDAOIpml;
import com.example.entity.Account;
import com.example.entity.Favorite;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/view/user/add-to-favorite"})
public class AddToFavoriteController extends HttpServlet {
    FavoriteDAO favoriteDAO = new FavoriteDAOIpml();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            int product_id = Integer.parseInt(req.getParameter("product_id"));
            int user_id = account.getId();
            List<Favorite> listF = (List<Favorite>) session.getAttribute("listF");
            boolean ok = true;
            for (Favorite f : listF) {
                if (f.getProduct_id() == product_id) { // da co san pham roi
                    ok = false;
                    break;
                }
            }
            if (ok) {
                favoriteDAO.addProductToFavorite(user_id, product_id);
                listF.add(new Favorite(user_id, product_id));
            }
            session.setAttribute("listF", listF);
            session.setAttribute("size_favorite", listF.size());
            resp.sendRedirect(req.getContextPath() + "/view/user/shop?c");
        } else {
            resp.sendRedirect(req.getContextPath() + "/login");
        }
    }
}
