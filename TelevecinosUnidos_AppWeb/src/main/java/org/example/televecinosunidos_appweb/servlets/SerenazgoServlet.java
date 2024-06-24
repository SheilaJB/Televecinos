package org.example.televecinosunidos_appweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.televecinosunidos_appweb.model.beans.IncidenciasB;
import org.example.televecinosunidos_appweb.model.daos.IncidenciaDao;

import java.io.IOException;

@WebServlet(name = "SerenazgoServlet", value = "/SerenazgoServlet")
public class SerenazgoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IncidenciaDao incidenciaDao = new IncidenciaDao();

        String action = request.getParameter("action")==null?"inicioSerenazgo":request.getParameter("action");
        String vista;
        switch (action) {
            case "listaIncidencias_S":
                vista = "WEB-INF/Serenazgo/listaIncidencias_S.jsp";
                request.setAttribute("lista",incidenciaDao.listarIncidencias());
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            //default:
            //  request.getRequestDispatcher("WEB-INF/Serenazgo/" + action + ".jsp").forward(request,response);

            /*case "new":
                request.getRequestDispatcher("job/form_new.jsp").forward(request,response);
                break;*/
            //break;

            case "gestionar_Incidencia_S":
                String id = request.getParameter("id");
                //Job job = jobDao.buscarPorId(id);
                IncidenciasB incidenciasB = incidenciaDao.buscarPorId(id);

                if(incidenciasB != null){
                    request.getAttribute("incidencias");
                    request.getRequestDispatcher("WEB-INF/Serenazgo/gestionar_Incidencia_S.jsp").forward(request,response);
                }else{
                    response.sendRedirect(request.getContextPath() + "/SerenazgoServlet");
                }
                break;


            default:
              request.getRequestDispatcher("WEB-INF/Serenazgo/" + action + ".jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        IncidenciaDao incidenciaDao = new IncidenciaDao();

        String action = request.getParameter("action") == null ? "buscarIncidenciaPorNombre" : request.getParameter("action");
        String textoBuscar;

        switch (action){
            case "buscarIncidenciaFiltro":
                textoBuscar= request.getParameter("textoBuscarIncidencia");
                String criticidad =  request.getParameter("criticidad");
                String tipoIncidencia =  request.getParameter("tipoIncidencia");
                String estadoIncidencia =  request.getParameter("estadoIncidencia");
                String urbanizacion =  request.getParameter("urbanizacion");

                if (textoBuscar == null && criticidad == null && tipoIncidencia == null && estadoIncidencia == null && urbanizacion == null) {
                    response.sendRedirect(request.getContextPath() + "/SerenazgoServlet?action=listaIncidencias_S");
                } else {
                    request.setAttribute("textoBusqueda",textoBuscar);

                    request.setAttribute("criticidad",criticidad);
                    request.setAttribute("tipo",tipoIncidencia);
                    request.setAttribute("estado",estadoIncidencia);
                    request.setAttribute("urbanizacion",urbanizacion);

                    request.setAttribute("lista", incidenciaDao.listarIncidenciasFiltro(textoBuscar,criticidad,tipoIncidencia,estadoIncidencia,urbanizacion));
                    RequestDispatcher view = request.getRequestDispatcher("WEB-INF/Serenazgo/listaIncidencias_S.jsp");
                    view.forward(request, response);
                }
                break;
            case "gestionarIncidencia":
                IncidenciasB incidenciaB = new IncidenciasB();
                String solucionADar = request.getParameter("solucionADar");
                String criticidadIncidencia = request.getParameter("criticidadIncidencia");
                String personalRequerido = request.getParameter("personalRequerido");
                String movilidadIncidencia = request.getParameter("movilidadIncidencia");
                String estadoIncidenci = request.getParameter("estadoIncidencia");


                incidenciaB.setCriticidadIncidencia_idCriticidadIncidenciaStr(criticidadIncidencia);
                incidenciaB.setSolucionADar(solucionADar);
                incidenciaB.setPersonalRequeridoStr(personalRequerido);
                incidenciaB.setTipoMovilidadRequerido(movilidadIncidencia);
                incidenciaB.setEstadosIncidencia_idEstadoIncidenciaStr(estadoIncidenci);

                incidenciaDao.actualizarIncidenciaS(incidenciaB);
                response.sendRedirect(request.getContextPath() + "/SerenazgoServlet?action=listaIncidencias_S");
                break;
        }


    }







}
