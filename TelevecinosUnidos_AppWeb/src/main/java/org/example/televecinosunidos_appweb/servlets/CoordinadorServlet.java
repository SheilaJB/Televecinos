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
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        //JobDao jobDao = new JobDao();
        EventoDao eventoDao =  new EventoDao();

        String action = request.getParameter("action") == null ? "crear" : request.getParameter("action");

        switch (action){
            case "crear"://voy a crear un nuevo evento

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
                 eventoDao.crearEvento(nombreEvento, descripcionEvento, Integer.parseInt(idCoordinador), Integer.parseInt(idProfesor),lugar,Integer.parseInt(cantidadVacantes), fechaHoraInicioStr, fechaHoraFinStr, foto, materiales, Integer.parseInt(idFrecuencia), estado);
                response.sendRedirect(request.getContextPath() + "/CoordinadorServlet");

                break;
            case "e": //voy a actualizar
                String nombre2 = request.getParameter("nombre");
                String descripcion2 = request.getParameter("descripcion");
                String lugar2 = request.getParameter("lugar");
                String Coordinador_idUsuario2 = request.getParameter("Coordinador_idUsuario");
                String fecha_inicio2 = request.getParameter("fecha_inicio");
                String fecha_fin2 = request.getParameter("fecha_fin");
                String frecuencia2 = request.getParameter("frecuencia");
                String cantidadVacantes2 = request.getParameter("cantidadVacantes");
                String foto2 = request.getParameter("foto");
                String listaMateriales2 = request.getParameter("listaMateriales");
                String EventFrecuencia_idEventFrecuencia2 = request.getParameter("EventFrecuencia_idEventFrecuencia");
                String ProfesoresEvento_idProfesoresEvento2 = request.getParameter("ProfesoresEvento_idProfesoresEvento");


                boolean isAllValid2 = true;

                /*if(jobTitle2.length() > 35){
                    isAllValid2 = false;
                }*/

                if(nombre2.length() > 10){
                    isAllValid2 = false;
                }
                if(isAllValid2){

                    EventoB eventoB = new EventoB();

                    eventoB.setNombre(nombre2);
                    eventoB.setDescripcion(descripcion2);
                    eventoB.setLugar(lugar2);
                    //eventoB.setCoordinador_idUsuario(Coordinador_idUsuario2); ACA VERIFICAR, integer.parseint???
                    eventoB.setFecha_inicio(fecha_inicio2);
                    eventoB.setFecha_fin(fecha_fin2);
                    eventoB.setFrecuenciaString(frecuencia2);
                   // eventoB.setCantidadVacantes(cantidadVacantes2); ACA VERIFICAR
                    eventoB.setFoto(foto2);
                    eventoB.setListaMateriales(listaMateriales2);
                    eventoB.setEventFrecuencia_idEventFrecuencia(Integer.parseInt(EventFrecuencia_idEventFrecuencia2));
                    eventoB.setProfesoresEvento_idProfesoresEvento(Integer.parseInt(ProfesoresEvento_idProfesoresEvento2));


                    //falta crear el metodo actualizar en el dao
                   // EventoDao.actualizar(eventoB);
                    response.sendRedirect(request.getContextPath() + "/CoordinadorServlet");
                }else{
                    //request.setAttribute("job",jobDao.buscarPorId(jobId2));
                    request.setAttribute("job",eventoDao.buscarEventoPorId(nombre2));
                    request.getRequestDispatcher("WEB-INF/Coordinadora/creacionEvento.jsp").forward(request,response);
                }
                break;

            /*case "s":
                String textBuscar = request.getParameter("textoBuscar");
                ArrayList<Job> lista = jobDao.buscarIdOrTitle(textBuscar);

                request.setAttribute("lista",lista);
                request.setAttribute("busqueda",textBuscar);
                request.getRequestDispatcher("job/lista.jsp").forward(request,response);

                break;*/
        }


    }
}
