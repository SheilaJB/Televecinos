package org.example.televecinosunidos_appweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import org.example.televecinosunidos_appweb.model.beans.EventoB;
import org.example.televecinosunidos_appweb.model.beans.ProfesoresEvento;
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
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");

        switch (action) {
            case "lista":
                vista = "WEB-INF/Coordinadora/ListaEvent-Coordinador.jsp";
                request.setAttribute("lista", listaEventosPropios);
                break;
            case "verEvento":
                String idEvento = request.getParameter("idEvento");
                vista = "WEB-INF/Coordinadora/eventoPropio.jsp";
                request.setAttribute("evento", eventoDao.buscarEventoPorId(idEvento));
                break;
            case "crearEvento":
                ArrayList<ProfesoresEvento> listaProfesores = eventoDao.listarProfesores();
                request.setAttribute("lista", listaProfesores);
                vista = "WEB-INF/Coordinadora/creacionEvento.jsp";
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
                break;
            case "borrarEvento":
                String idBorrar = request.getParameter("idEvento");
                eventoDao.borrarEvento(Integer.parseInt(idBorrar));
                response.sendRedirect(request.getContextPath() + "/CoordinadorServlet");
                return;
            default:
                throw new IllegalArgumentException("Acción no reconocida: " + action);
        }
        request.getRequestDispatcher(vista).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        EventoDao eventoDao = new EventoDao();
        String action = request.getParameter("action") == null ? "crear" : request.getParameter("action");

        switch (action) {
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
                String cantidadVacantes = request.getParameter("cantidadVacantes");
                String foto = request.getParameter("foto");
                String materiales = request.getParameter("materiales");

                String fechaHoraInicioStr = fecha_inicio + " " + hora_inicio + ":00"; // formato: yyyy-MM-dd HH:mm:ss
                String fechaHoraFinStr = fecha_fin + " " + hora_fin + ":00";          // formato: yyyy-MM-dd HH:mm:ss
                int estado = 1;
                eventoDao.crearEvento(nombreEvento, descripcionEvento, Integer.parseInt(idCoordinador), Integer.parseInt(idProfesor),
                        lugar, Integer.parseInt(cantidadVacantes), fechaHoraInicioStr, fechaHoraFinStr, foto, materiales, Integer.parseInt(idFrecuencia), estado);
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
                String frecuencia2 = request.getParameter("frecuencia");
                int cantidadVacantes2 = Integer.parseInt(request.getParameter("cantidadVacantes"));
                String foto2 = request.getParameter("foto");
                String listaMateriales2 = request.getParameter("listaMateriales");
                int EventFrecuencia_idEventFrecuencia2 = Integer.parseInt(request.getParameter("frecuencia"));
                int ProfesoresEvento_idProfesoresEvento2 = Integer.parseInt(request.getParameter("ProfesoresEvento_idProfesoresEvento"));

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

                eventoDao.actualizarEvento(eventoB);
                response.sendRedirect(request.getContextPath() + "/CoordinadorServlet");
                break;

            default:
                response.sendRedirect(request.getContextPath() + "/CoordinadorServlet");
                break;

        }
    }
}
