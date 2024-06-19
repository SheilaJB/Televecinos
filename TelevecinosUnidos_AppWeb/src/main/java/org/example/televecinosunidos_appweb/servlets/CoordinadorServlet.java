package org.example.televecinosunidos_appweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import org.example.televecinosunidos_appweb.model.beans.EventoB;
import org.example.televecinosunidos_appweb.model.beans.IncidenciasB;
import org.example.televecinosunidos_appweb.model.beans.ProfesoresEvento;
import org.example.televecinosunidos_appweb.model.daos.EventoDao;
import org.example.televecinosunidos_appweb.model.daos.IncidenCoordDao;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CoordinadorServlet", value = "/CoordinadorServlet")
public class CoordinadorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EventoDao eventoDao = new EventoDao();
        IncidenCoordDao incidenciaDao = new IncidenCoordDao();
        ArrayList<EventoB> listaEventosPropios = eventoDao.listarEventosPropios();
        String vista ="";
        String action = request.getParameter("action") == null ? "inicioCoordinador" : request.getParameter("action");

        switch (action) {
            //Inicio
            case "inicioCoordinador":
                ArrayList<IncidenciasB> listaIncidenciasRecientes = incidenciaDao.listarIncidenciaRecientes();
                ArrayList<EventoB> listaEventospRropiosRecientes = eventoDao.listarEventosPropiosRecientes();
                request.setAttribute("listaIncidencia", listaIncidenciasRecientes);
                request.setAttribute("listaEvento", listaEventospRropiosRecientes);
                vista = "WEB-INF/Coordinadora/InicioCoordinador.jsp";
                request.getRequestDispatcher(vista).forward(request, response);

                break;
            // NavBar
            case "perfilC":
                vista = "WEB-INF/Coordinadora/perfil_C.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "Index":
                vista = "index.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            // Eventos
            case "eventoGeneralesC":
                vista = "WEB-INF/Coordinadora/EventoGenerales_C.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;

            case "lista":
                vista = "WEB-INF/Coordinadora/ListaEvent-Coordinador.jsp";
                request.setAttribute("lista", listaEventosPropios);
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "verEvento":
                String idEvento = request.getParameter("idEvento");
                vista = "WEB-INF/Coordinadora/eventoPropio.jsp";
                request.setAttribute("evento", eventoDao.buscarEventoPorId(idEvento));
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "crearEvento":
                ArrayList<ProfesoresEvento> listaProfesores = eventoDao.listarProfesores();
                request.setAttribute("lista", listaProfesores);
                vista = "WEB-INF/Coordinadora/creacionEvento.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "editarEvento":
                String id = request.getParameter("idEvento");
                EventoB eventoB = eventoDao.buscarEventoPorId(id);
                if (eventoB != null) {
                    ArrayList<ProfesoresEvento> listaProfesoresEdit = eventoDao.listarProfesores();
                    request.setAttribute("eventoB", eventoB);
                    request.setAttribute("lista", listaProfesoresEdit);
                    vista = "WEB-INF/Coordinadora/editarEvento.jsp";
                } else {
                    response.sendRedirect(request.getContextPath() + "/CoordinadorServlet");
                    return;
                }
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "borrarEvento":
                String idBorrar = request.getParameter("idEvento");
                eventoDao.borrarEvento(Integer.parseInt(idBorrar));
                response.sendRedirect(request.getContextPath() + "/CoordinadorServlet");
                return;

            //Incidencia
            case "listarIncidencia":
                ArrayList<IncidenciasB> listaIncidencias = incidenciaDao.listarIncidencia();
                request.setAttribute("lista", listaIncidencias);
                vista = "WEB-INF/Coordinadora/listaIncidencias_C.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "verIncidencia":
                String idIncidencia = request.getParameter("idIncidencia");
                IncidenciasB incidencia = incidenciaDao.buscarIncidenciaPorId(idIncidencia);
                request.setAttribute("incidencia", incidencia);
                vista = "WEB-INF/Coordinadora/verIncidencia_C.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "generarIncidenciaC":
                vista = "WEB-INF/Coordinadora/generarIncidencia_C.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "editarIncidencia":
                String idIncid = request.getParameter("idIncidencia");
                IncidenciasB incidenciaB = incidenciaDao.buscarIncidenciaPorId(idIncid);
                if (incidenciaB != null) {
                    request.setAttribute("incidenciaB", incidenciaB);
                    request.getRequestDispatcher("WEB-INF/Coordinadora/actualizarIncidencia_C.jsp").forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/CoordIncidServlet");
                }
                return;
            case "borrarIncidencia": //Revisar este caso
                String idd = request.getParameter("idIncidencia");
                IncidenCoordDao.buscarIncidenciaPorId(idd);
                response.sendRedirect(request.getContextPath() + "/CoordIncidServlet");
                break;

            //Preguntas Frecuentes
            case "preguntasFrecuentesC":
                vista = "WEB-INF/Coordinadora/preguntasFrecuentes_C.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            default:
                throw new IllegalArgumentException("Acción no reconocida: " + action);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        IncidenCoordDao incidenciaDao = new IncidenCoordDao();
        EventoDao eventoDao = new EventoDao();
        String action = request.getParameter("action") == null ? "crear" : request.getParameter("action");

        switch (action) {

            //Evento
            case "crear":
                String nombreEvento = request.getParameter("nombreEvento");
                String descripcionEvento = request.getParameter("descripcionEvento");
                String lugar = request.getParameter("lugar");
                String idCoordinador = "1";
                String idProfesor = request.getParameter("nombreProfesor");
                String fecha_inicio = request.getParameter("fecha_inicio");
                String fecha_fin = request.getParameter("fecha_fin");
                String hora_inicio = request.getParameter("hora_inicio");
                String hora_fin = request.getParameter("hora_fin");
                String idFrecuencia = request.getParameter("frecuencia");
                String opcionesDias = null;
                if (idFrecuencia.equals("2")){
                    opcionesDias = request.getParameter("opcionesDias");
                }else{
                    opcionesDias = request.getParameter("opcionesDias1");
                }

                String cantidadVacantes = request.getParameter("cantidadVacantes");
                String foto = request.getParameter("foto");
                String materiales = request.getParameter("materiales");

                EventoB eventoB0 = new EventoB();

                eventoB0.setNombre(nombreEvento);
                eventoB0.setDescripcion(descripcionEvento);
                eventoB0.setLugar(lugar);
                eventoB0.setCoordinador_idUsuario(Integer.parseInt(idCoordinador));
                eventoB0.setProfesoresEvento_idProfesoresEvento(Integer.parseInt(idProfesor));
                eventoB0.setFecha_inicio(fecha_inicio);
                eventoB0.setFecha_fin(fecha_fin);
                eventoB0.setHora_inicio(hora_inicio);
                eventoB0.setHora_fin(hora_fin);
                eventoB0.setEventFrecuencia_idEventFrecuencia(Integer.parseInt(idFrecuencia));
                eventoB0.setDiaEvento(opcionesDias);
                eventoB0.setCantidadVacantes(Integer.parseInt(cantidadVacantes));
                eventoB0.setFoto(foto);
                eventoB0.setListaMateriales(materiales);


                int estado = 1;
                eventoDao.crearEvento(eventoB0);
                response.sendRedirect(request.getContextPath() + "/CoordinadorServlet");
                break;

            case "editar":
                int idEvento = Integer.parseInt(request.getParameter("idEvento"));
                String nombre = request.getParameter("nombre");
                String descripcion = request.getParameter("descripcion");
                String lugar2 = request.getParameter("lugar");
                // int Coordinador_idUsuario = Integer.parseInt(request.getParameter("Coordinador_idUsuario"));
                String fecha_inicio2 = request.getParameter("fecha_inicio");
                String fecha_fin2 = request.getParameter("fecha_fin");
                String hora_inicio2 = request.getParameter("hora_inicio");
                String hora_fin2 = request.getParameter("hora_fin");
                String frecuencia2 = request.getParameter("frecuencia");
                int cantidadVacantes2 = Integer.parseInt(request.getParameter("cantidadVacantes"));
                String foto2 = request.getParameter("foto");
                String listaMateriales2 = request.getParameter("listaMateriales");
                int EventFrecuencia_idEventFrecuencia2 = Integer.parseInt(request.getParameter("frecuencia"));
                int ProfesoresEvento_idProfesoresEvento2 = Integer.parseInt(request.getParameter("ProfesoresEvento_idProfesoresEvento"));
                String opcionesDias2 = null;
                if (frecuencia2.equals("2")){
                    opcionesDias2 = request.getParameter("opcionesDias");
                }else{
                    opcionesDias2 = request.getParameter("opcionesDias1");
                }

                EventoB eventoB = new EventoB();
                eventoB.setIdEvento(idEvento);
                eventoB.setNombre(nombre);
                eventoB.setDescripcion(descripcion);
                eventoB.setLugar(lugar2);
                // eventoB.setCoordinador_idUsuario(Coordinador_idUsuario); // Comentar si no es necesario
                eventoB.setFecha_inicio(fecha_inicio2);
                eventoB.setFecha_fin(fecha_fin2);
                eventoB.setFrecuenciaString(frecuencia2);
                eventoB.setCantidadVacantes(cantidadVacantes2);
                eventoB.setFoto(foto2);
                eventoB.setListaMateriales(listaMateriales2);
                eventoB.setEventFrecuencia_idEventFrecuencia(EventFrecuencia_idEventFrecuencia2);
                eventoB.setProfesoresEvento_idProfesoresEvento(ProfesoresEvento_idProfesoresEvento2);
                eventoB.setDiaEvento(opcionesDias2);
                eventoB.setHora_inicio(hora_inicio2);
                eventoB.setHora_fin(hora_fin2);

                eventoDao.eliminarFechasEventoPorIdEvento(idEvento);
                eventoDao.actualizarEvento(eventoB);
                response.sendRedirect(request.getContextPath() + "/CoordinadorServlet");
                break;

            //Incidencia


            default:
                response.sendRedirect(request.getContextPath() + "/CoordinadorServlet");
                break;

        }
    }
}
