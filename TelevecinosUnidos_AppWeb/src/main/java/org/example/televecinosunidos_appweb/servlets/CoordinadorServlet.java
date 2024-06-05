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
                break;
            case "verEvento":
                String idEvento = request.getParameter("idEvento");
                vista = "WEB-INF/Coordinadora/eventoPropio.jsp";
                request.setAttribute("evento",eventoDao.buscarEventoPorId(idEvento));
                break;
            case "crearEvento":
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

                String nombre = request.getParameter("nombre");
                String descripcion = request.getParameter("descripcion");
                String lugar = request.getParameter("lugar");
                String Coordinador_idUsuario = request.getParameter("Coordinador_idUsuario");
                String fecha_inicio = request.getParameter("fecha_inicio");
                String fecha_fin = request.getParameter("fecha_fin");
                String cantidadVacantes = request.getParameter("cantidadVacantes");
                String foto = request.getParameter("foto");
                String listaMateriales = request.getParameter("listaMateriales");
                String EventFrecuencia_idEventFrecuencia = request.getParameter("EventFrecuencia_idEventFrecuencia");
                String ProfesoresEvento_idProfesoresEvento = request.getParameter("ProfesoresEvento_idProfesoresEvento");

                /*
                boolean isAllValid = true;

                if(nombre.length() > 35){
                    isAllValid = false;
                }

                /*if(idEvento.length() > 10){
                    isAllValid = false;
                }*/

                /*
                if(isAllValid){

                    Job job = jobDao.buscarPorId(jobId);

                    if(job == null){
                        jobDao.crear(jobId,jobTitle,Integer.parseInt(minSalary),Integer.parseInt(maxSalary));
                        response.sendRedirect(request.getContextPath() + "/JobServlet");
                    }else{
                        request.getRequestDispatcher("job/form_new.jsp").forward(request,response);
                    }
                }else{
                    request.getRequestDispatcher("job/form_new.jsp").forward(request,response);
                }
                break;
            case "e": //voy a actualizar
                String jobId2 = request.getParameter("jobId");
                String jobTitle2 = request.getParameter("jobTitle");
                String minSalary2 = request.getParameter("minSalary");
                String maxSalary2 = request.getParameter("maxSalary");

                boolean isAllValid2 = true;

                if(jobTitle2.length() > 35){
                    isAllValid2 = false;
                }

                if(jobId2.length() > 10){
                    isAllValid2 = false;
                }
                if(isAllValid2){
                    Job job = new Job();
                    job.setJobId(jobId2);
                    job.setJobTitle(jobTitle2);
                    job.setMinSalary(Integer.parseInt(minSalary2));
                    job.setMaxSalary(Integer.parseInt(maxSalary2));

                    jobDao.actualizar(job);
                    response.sendRedirect(request.getContextPath() + "/JobServlet");
                }else{
                    request.setAttribute("job",jobDao.buscarPorId(jobId2));
                    request.getRequestDispatcher("job/form_edit.jsp").forward(request,response);
                }
                break;*/

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
