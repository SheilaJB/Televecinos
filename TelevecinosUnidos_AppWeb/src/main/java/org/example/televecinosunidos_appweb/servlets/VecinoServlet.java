package org.example.televecinosunidos_appweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.televecinosunidos_appweb.model.beans.EventoB;
import org.example.televecinosunidos_appweb.model.beans.IncidenciasB;
import org.example.televecinosunidos_appweb.model.daos.*;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "VecinoServlet", value = "/VecinoServlet")
public class VecinoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IncidenCoordDao incidenciaDao = new IncidenCoordDao();
        String action = request.getParameter("action")==null?"inicioVecino":request.getParameter("action");
        String vista ;

        switch (action) {
            /*------------------Página principal------------------*/
            case "inicioVecino":
                vista = "WEB-INF/Vecino/inicioVecino.jsp";
                break;
            case "eventoDeporte":
                vista = "WEB-INF/Vecino/Evento-D-Vecino.jsp";
                break;
            case "eventoCultura":
                vista = "WEB-INF/Vecino/Evento-C-Vecino.jsp";
                break;
            case "preguntasFrecuentes":
                vista = "WEB-INF/Vecino/preguntasFrecuentes_V.jsp";
                break;
            case "verPerfil":
                vista = "WEB-INF/Vecino/perfil_V.jsp";
                break;
            /*-------------fin Página principal-------------------*/

            /* falta seguir el flujo total de eventos*/
            case "eventosInscritos":
                //lógica para listar los eventos a los que se inscribe
                vista = "WEB-INF/Vecino/ListaEvent-Vecino.jsp";

            /*----------------Incidencias----------------*/
            case "listarIncidencia":
                ArrayList<IncidenciasB> listaIncidencias = incidenciaDao.listarIncidencia();
                request.setAttribute("lista", listaIncidencias);
                vista = "WEB-INF/Vecino/listaIncidencias_V.jsp";
                break;
            case "verIncidencia":
                String idIncidencia = request.getParameter("idIncidencia");
                IncidenciasB incidencia = incidenciaDao.buscarIncidenciaPorId(idIncidencia);
                request.setAttribute("incidencia", incidencia);
                vista = "WEB-INF/Vecino/verIncidencia_V.jsp";
                break;
            case "generarIncidencia":
                vista = "WEB-INF/Vecino/generarIncidencia_V.jsp";
                break;
            case "editarIncidencia":
                String id = request.getParameter("idIncidencia");
                IncidenciasB incidenciaB = incidenciaDao.buscarIncidenciaPorId(id);
                if (incidenciaB != null) {
                    request.setAttribute("incidenciaB", incidenciaB);
                    request.getRequestDispatcher("WEB-INF/Vecino/actualizarIncidencia_V.jsp").forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/VecinoServlet");
                }
                return;
            case "borrarIncidencia":
                String idBorrar = request.getParameter("idEvento");
                /*
                incidenciaDao.borrarIncidencia(Integer.parseInt(idBorrar));
                */
                response.sendRedirect(request.getContextPath() + "/VecinoServlet");
                return;
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
                String nombreIncidencia = request.getParameter("nombreIncidencia");
                String foto = request.getParameter("foto");
                String tipoIncidencia = request.getParameter("TipoIncidencia_idTipoIncidencia");
                String urbanizacion = request.getParameter("urbanizacion_idUrbanizacion");
                int incidenciaPersonal = Integer.parseInt(request.getParameter("incidenciaPersonal"));
                String lugarExacto = request.getParameter("lugarExacto");
                String referencia = request.getParameter("referencia");
                String numeroContacto = request.getParameter("numeroContacto");
                int ambulancia = Integer.parseInt(request.getParameter("ambulancia"));

                IncidenciasB incidencia = new IncidenciasB();
                incidencia.setNombreIncidencia(nombreIncidencia);
                incidencia.setFoto(foto);
                incidencia.setTipoIncidencia(tipoIncidencia);
                incidencia.setUrbanizacion(urbanizacion);
                incidencia.setIncidenciaPersonal(incidenciaPersonal);
                incidencia.setLugarExacto(lugarExacto);
                incidencia.setReferencia(referencia);
                incidencia.setNumeroContacto(numeroContacto);
                incidencia.setAmbulancia(ambulancia);

                incidenciaDao.generarIncidenciaC(incidencia);
                // Agregar mensaje a la sesión
                request.getSession().setAttribute("info", "Incidencia creada de manera exitosa");

                // Redirigir a la lista de incidencias
                response.sendRedirect(request.getContextPath() + "/VecinoServlet?action=listarIncidencia");
                break;

            case "editar":
                int id = Integer.parseInt(request.getParameter("idIncidencia"));
                String nombreIncidencia2 = request.getParameter("nombreIncidencia");
                String foto2 = request.getParameter("foto");
                String tipoIncidencia2 = request.getParameter("TipoIncidencia_idTipoIncidencia");
                String urbanizacion2 = request.getParameter("urbanizacion_idUrbanizacion");
                int incidenciaPersonal2 = Integer.parseInt(request.getParameter("incidenciaPersonal"));
                String lugarExacto2 = request.getParameter("lugarExacto");
                String referencia2 = request.getParameter("referencia");
                String numeroContacto2 = request.getParameter("numeroContacto");
                int ambulancia2 = Integer.parseInt(request.getParameter("ambulancia"));

                IncidenciasB incidenciaB = new IncidenciasB();
                incidenciaB.setIdIncidencias(id);
                incidenciaB.setNombreIncidencia(nombreIncidencia2);
                incidenciaB.setFoto(foto2);
                incidenciaB.setTipoIncidencia(tipoIncidencia2);
                incidenciaB.setUrbanizacion(urbanizacion2);
                incidenciaB.setIncidenciaPersonal(incidenciaPersonal2);
                incidenciaB.setLugarExacto(lugarExacto2);
                incidenciaB.setReferencia(referencia2);
                incidenciaB.setNumeroContacto(numeroContacto2);
                incidenciaB.setAmbulancia(ambulancia2);

                incidenciaDao.actualizarIncidencia(incidenciaB);
                request.getSession().setAttribute("info", "Incidencia editada de manera exitosa");
                response.sendRedirect(request.getContextPath() + "/VecinoServlet?action=listarIncidencia");
                break;
        }
    }
}
