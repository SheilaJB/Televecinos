package org.example.televecinosunidos_appweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "VistaServlet", value = "/VistaServlet")
public class VistaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idVista = (request.getParameter("idVista"));
        String vista = "";
        switch(idVista){
            case "inicioCoordinador":
                vista = "WEB-INF/Coordinadora/InicioCoordinador.jsp";
                break;
            case "eventoGeneralesC":
                vista = "WEB-INF/Coordinadora/EventoGenerales_C.jsp";
                break;
            case "creacionEventoC":
                vista = "WEB-INF/Coordinadora/creacionEvento.jsp";
                break;
            case "listaEventoCoordinador":
                vista = "WEB-INF/Coordinadora/ListaEvent-Coordinador.jsp";
                break;
            case "generarIncidenciaC":
                vista = "WEB-INF/Coordinadora/generarIncidencia_C.jsp";
                break;
            case "listaIncidenciaC":
                vista = "WEB-INF/Coordinadora/listaIncidencias_C.jsp";
                break;

            case "preguntasFrecuentesC":
                vista = "WEB-INF/Coordinadora/preguntasFrecuentes_C.jsp";
                break;
        }

        RequestDispatcher rd = request.getRequestDispatcher(vista);
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
