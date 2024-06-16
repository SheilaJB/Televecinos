package org.example.televecinosunidos_appweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SerenazgoServlet", value = "/SerenazgoServlet")
public class SerenazgoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action")==null?"inicioSerenazgo":request.getParameter("action");

        switch (action) {

            default:
                request.getRequestDispatcher("WEB-INF/Serenazgo/" + action + ".jsp").forward(request,response);
        }
    }


}
