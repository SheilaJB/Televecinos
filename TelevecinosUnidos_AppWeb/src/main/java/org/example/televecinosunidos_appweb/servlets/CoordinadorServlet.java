package org.example.televecinosunidos_appweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.televecinosunidos_appweb.model.beans.EventoB;
import org.example.televecinosunidos_appweb.model.daos.EventoDao;


import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CoordinadorServlet", value = "/CoordinadorServlet")
public class CoordinadorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EventoDao eventoDao = new EventoDao();
        ArrayList<EventoB> listaEventosPropios = eventoDao.listarEventosPropios();
        String vista = "";

        String action = request.getParameter("action")==null?"lista":request.getParameter("action");
        switch (action) {
            case "lista":
                vista = "WEB-INF/Coordinadora/ListaEvent-Coordinador.jsp";
                request.setAttribute("lista",listaEventosPropios);
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "verEvento":
                String idEvento = request.getParameter("idEvento");
                vista = "WEB-INF/Coordinadora/eventoPropio.jsp";
                request.setAttribute("evento",eventoDao.buscarEventoPorId(idEvento));
                request.getRequestDispatcher(vista).forward(request, response);
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
