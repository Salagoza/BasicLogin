package io.muic.ssc.webapp.servlet;

import io.muic.ssc.webapp.Routable;
import io.muic.ssc.webapp.model.User;
import io.muic.ssc.webapp.service.SecurityService;
import io.muic.ssc.webapp.service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class HomeServlet extends HttpServlet implements Routable {

    private SecurityService securityService;

    private UserService userService;

    @Override
    public String getMapping() {
        return "/index.jsp";
    }

    @Override
    public void setSecurityService(SecurityService securityService) {
        this.securityService = securityService;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        boolean authorized = securityService.isAuthorized(request);
        if(authorized){
            String username = (String) request.getSession().getAttribute("username");
            UserService userService = UserService.getInstance();

            request.setAttribute("currentUser",userService.findbyUsername(username));
            request.setAttribute("users",userService.findAll());

            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/home.jsp");
            rd.include(request,response);

            request.getSession().removeAttribute("hasError");
            request.getSession().removeAttribute("message");

        }else{
            request.removeAttribute("hasError");
            request.removeAttribute("message");
            response.sendRedirect("/login");
        }
    }
}
