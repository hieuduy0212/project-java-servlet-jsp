package com.example.controller.user;

import com.example.dao.ProductDAO;
import com.example.dao.impl.ProductDAOImpl;
import com.example.entity.Favorite;
import com.example.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

@WebServlet(urlPatterns = {"/view/user/favorite"})
public class FavoriteController extends HttpServlet {
    ProductDAO productDAO = new ProductDAOImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<Favorite> listF = (List<Favorite>)session.getAttribute("listF");
        //list san pham yeu thich
        List<Product> listFP = new LinkedList<>();
        for (Favorite f : listF){
            listFP.add(productDAO.getProductByID(f.getProduct_id()));
        }
        session.setAttribute("listFP", listFP);
        req.getRequestDispatcher("/view/user/favorite.jsp").forward(req, resp);
    }
}
