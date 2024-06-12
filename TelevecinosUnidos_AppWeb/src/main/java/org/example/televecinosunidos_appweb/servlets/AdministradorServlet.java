package org.example.televecinosunidos_appweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.televecinosunidos_appweb.model.beans.EventoB;
import org.example.televecinosunidos_appweb.model.beans.ProfesoresEvento;
import org.example.televecinosunidos_appweb.model.beans.SerenazgoB;
import org.example.televecinosunidos_appweb.model.daos.SerenazgoDao;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AdministradorServlet", value = "/AdministradorServlet")
public class AdministradorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SerenazgoDao serenazgoDao = new SerenazgoDao();

        ArrayList<SerenazgoB> listarSerenazgos = serenazgoDao.listarSerenazgos();

        String action = request.getParameter("action")==null?"lista":request.getParameter("action");
        String vista ;
        switch (action) {
            case "lista":
                vista = "WEB-INF/Administrador/ListaSerenazgo_A.jsp";
                request.setAttribute("lista",listarSerenazgos);
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "verSerenazgo":
                String idSerenazgo = request.getParameter("idSerenazgo");
                request.setAttribute("serenazgo",serenazgoDao.buscarSerenazgoPorId(idSerenazgo));
                vista = "WEB-INF/Administrador/DetalleSerenazgo_A.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "registrarSerenazgo":
                request.getRequestDispatcher("WEB-INF/Administrador/registroSerenazgo.jsp").forward(request,response);
                break;
            case "banearSerenazgo":
                break;

            default:
                throw new IllegalArgumentException("Acción no reconocida: " + action);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        SerenazgoDao serenazgoDao = new SerenazgoDao();

        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String dni = request.getParameter("dni");
        int turno = Integer.parseInt(request.getParameter("turno"));
        int tipo = Integer.parseInt(request.getParameter("tipo"));

        SerenazgoB serenazgoB = new SerenazgoB(nombre,apellido,dni,turno,tipo);

        serenazgoDao.registrarSerenazgo(serenazgoB);




    }
}
