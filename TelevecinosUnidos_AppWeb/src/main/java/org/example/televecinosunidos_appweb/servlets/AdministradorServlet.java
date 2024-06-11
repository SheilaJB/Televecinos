package org.example.televecinosunidos_appweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.televecinosunidos_appweb.model.beans.EventoB;
import org.example.televecinosunidos_appweb.model.beans.ProfesoresEvento;
import org.example.televecinosunidos_appweb.model.daos.SerenazgoDao;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AdministradorServlet", value = "/AdministradorServlet")
public class AdministradorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SerenazgoDao serenazgoDao = new SerenazgoDao();
        /*
        ArrayList<EventoB> listaEventosPropios = eventoDao.listarEventosPropios();
        String vista = "";
        String action = request.getParameter("action")==null?"lista":request.getParameter("action");
        switch (action) {
            case "lista":
                vista = "WEB-INF/Coordinadora/ListaEvent-Coordinador.jsp";
                request.setAttribute("lista",listaEventosPropios);
                break;
            case "verEvento":
                String idEvento = request.getParameter("idEvento");
                vista = "WEB-INF/Coordinadora/eventoPropio.jsp";
                request.setAttribute("evento",eventoDao.buscarEventoPorId(idEvento));
                break;
            case "crearEvento":
                ArrayList<ProfesoresEvento> list =eventoDao.listarProfesores();
                request.setAttribute("lista",list);
                vista ="WEB-INF/Coordinadora/creacionEvento.jsp";
                break;
            case "editarEvento":
                String id = request.getParameter("idEvento");
                EventoB eventoB = eventoDao.buscarEventoPorId(id);
                //EventoB event = eventoDao.buscarPorId(id);

                if(eventoB != null){
                    request.setAttribute("eventoB",eventoB);
                    request.getRequestDispatcher("WEB-INF/Coordinadora/editarEvento.jsp").forward(request,response);
                }else{
                    response.sendRedirect(request.getContextPath() + "/CoordinadorServlet");
                }
                break;

            default:
                throw new IllegalArgumentException("Acción no reconocida: " + action);
        }
        request.getRequestDispatcher(vista).forward(request,response);
        */
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
