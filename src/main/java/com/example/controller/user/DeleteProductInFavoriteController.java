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
import java.util.List;

@WebServlet(urlPatterns = {"/view/user/delete-in-favorite"})
public class DeleteProductInFavoriteController extends HttpServlet {
    FavoriteDAO favoriteDAO = new FavoriteDAOIpml();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        HttpSession session= req.getSession();
        List<Favorite> listF = (List<Favorite>) session.getAttribute("listF");
        Account account = (Account)session.getAttribute("account");
        for(Favorite f : listF){
            if(f.getProduct_id() == id){
                listF.remove(f);
                favoriteDAO.deleteFavoriteById(account.getId(), id);
                break;
            }
        }
        session.setAttribute("listF", listF);
//        req.getRequestDispatcher("/view/user/favorite.jsp").forward(req, resp);
        resp.sendRedirect(req.getContextPath()+"/view/user/favorite");
    }
}
