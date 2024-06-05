package org.example.televecinosunidos_appweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.televecinosunidos_appweb.model.beans.IncidenciasB;
import org.example.televecinosunidos_appweb.model.daos.IncidenCoordDao;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CoordIncidServlet", value = "/CoordIncidServlet")
public class CoordIncidServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IncidenCoordDao incidenciaDao = new IncidenCoordDao();
        ArrayList<IncidenciasB> listaIncidencias = incidenciaDao.listarIncidencia();
        String vista = "";

        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        switch (action) {
            case "listarIncidencia":
                vista = "WEB-INF/Coordinadora/listaIncidencias_C.jsp";
                request.setAttribute("lista", listaIncidencias);
                break;
            case "verIncidencia":
                String idIncidencia = request.getParameter("idIncidencia");
                vista = "WEB-INF/Coordinadora/verIncidencia_C.jsp";
                request.setAttribute("incidencia", incidenciaDao.buscarIncidenciaPorId(idIncidencia));
                break;
            case "crearIncidencia":
                vista = "WEB-INF/Coordinadora/generarIncidencia_C.jsp";
                break;
            case "editarIncidencia":
                String id = request.getParameter("idIncidencia");
                IncidenciasB incidenciaB = incidenciaDao.buscarIncidenciaPorId(id);
                if (incidenciaB != null) {
                    request.setAttribute("incidenciaB", incidenciaB);
                    request.getRequestDispatcher("WEB-INF/Coordinadora/actualizarIncidencia_C.jsp").forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/CoordIncidServlet");
                }
                break;
            default:
                throw new IllegalArgumentException("Acción no reconocida: " + action);
        }
        request.getRequestDispatcher(vista).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        IncidenCoordDao incidenciaDao = new IncidenCoordDao();

        String action = request.getParameter("action") == null ? "crear" : request.getParameter("action");

        switch (action) {
            case "crear":
                String nombre = request.getParameter("nombre");
                String lugarExacto = request.getParameter("lugarExacto");
                String referencia = request.getParameter("referencia");
                String foto = request.getParameter("foto");
                boolean ambulancia = Boolean.parseBoolean(request.getParameter("ambulancia"));
                String numeroContacto = request.getParameter("numeroContacto");
                int tipoIncidenciaId = Integer.parseInt(request.getParameter("tipoIncidenciaId"));
                boolean incidenciaPersonal = Boolean.parseBoolean(request.getParameter("incidenciaPersonal"));

                incidenciaDao.crearIncidencia(nombre, lugarExacto, referencia, foto, ambulancia, numeroContacto, tipoIncidenciaId, incidenciaPersonal);
                response.sendRedirect(request.getContextPath() + "/CoordIncidServlet");
                break;
            case "editar":
                int id = Integer.parseInt(request.getParameter("idIncidencia"));
                String nombre2 = request.getParameter("nombre");
                String lugarExacto2 = request.getParameter("lugarExacto");
                String referencia2 = request.getParameter("referencia");
                String foto2 = request.getParameter("foto");
                boolean ambulancia2 = Boolean.parseBoolean(request.getParameter("ambulancia"));
                String numeroContacto2 = request.getParameter("numeroContacto");
                int tipoIncidenciaId2 = Integer.parseInt(request.getParameter("tipoIncidenciaId"));
                int estadosIncidenciaId2 = Integer.parseInt(request.getParameter("estadosIncidenciaId"));
                int serenazgoId2 = Integer.parseInt(request.getParameter("serenazgoId"));
                int usuarioId2 = Integer.parseInt(request.getParameter("usuarioId"));
                boolean incidenciaPersonal2 = Boolean.parseBoolean(request.getParameter("incidenciaPersonal"));

                IncidenciasB incidenciaB = new IncidenciasB(id, nombre2, lugarExacto2, referencia2, foto2, ambulancia2, numeroContacto2, criticidadId2, tipoIncidenciaId2, estadosIncidenciaId2, serenazgoId2, usuarioId2, incidenciaPersonal2, fechaHora2);
                incidenciaDao.actualizarIncidencia(incidenciaB);
                response.sendRedirect(request.getContextPath() + "/IncidenciaServlet");
                break;
        }
    }
}
