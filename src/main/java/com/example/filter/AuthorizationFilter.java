package com.example.filter;

import com.example.entity.Account;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.MalformedURLException;

@WebFilter(filterName = "AuthorizationFilter", urlPatterns = "/*")
public class AuthorizationFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        String url = req.getServletPath();
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            if (url.contains("/view/admin")) {
                resp.sendRedirect(req.getContextPath() + "/login");
            } else {
                chain.doFilter(request, response);
            }
        } else {
            if (account.getIsAdmin() == 1) {
                if (url.contains("/view/user")) {
                    resp.sendRedirect(req.getContextPath() + "/view/admin/index");
                } else {
                    chain.doFilter(request, response);
                }

            } else {
                if (url.contains("/view/admin") && !url.contains("/img")) {
                    resp.sendRedirect(req.getContextPath() + "/view/user/index");
                } else {
                    chain.doFilter(request, response);
                }
            }
        }
    }
}
