package org.example.televecinosunidos_appweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.televecinosunidos_appweb.model.daos.IncidenciaDao;

import java.io.IOException;

@WebServlet(name = "SerenazgoServlet", value = "/SerenazgoServlet")
public class SerenazgoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IncidenciaDao incidenciaDao = new IncidenciaDao();

        String action = request.getParameter("action")==null?"inicioSerenazgo":request.getParameter("action");
        String vista;
        switch (action) {
            case "listaIncidencias_S":
                vista = "WEB-INF/Serenazgo/listaIncidencias_S.jsp";
                request.setAttribute("lista",incidenciaDao.listarIncidencias());
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            default:
                request.getRequestDispatcher("WEB-INF/Serenazgo/" + action + ".jsp").forward(request,response);
        }
    }


}
