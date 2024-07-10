package org.example.televecinosunidos_appweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.televecinosunidos_appweb.model.beans.IncidenciasB;
import org.example.televecinosunidos_appweb.model.beans.SerenazgoB;
import org.example.televecinosunidos_appweb.model.beans.UsuarioB;
import org.example.televecinosunidos_appweb.model.daos.IncidenciaDao;
import org.example.televecinosunidos_appweb.model.daos.UsuarioDao;
import org.example.televecinosunidos_appweb.model.daos.VecinoDao;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "SerenazgoServlet", value = "/SerenazgoServlet")
public class SerenazgoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IncidenciaDao incidenciaDao = new IncidenciaDao();
        VecinoDao vecinoDao = new VecinoDao();
        UsuarioDao usuarioDao = new UsuarioDao();

        String action = request.getParameter("action")==null?"inicioSerenazgo":request.getParameter("action");
        String vista;
        switch (action) {
            case "listaIncidencias_S":
                vista = "WEB-INF/Serenazgo/listaIncidencias_S.jsp";
                request.setAttribute("lista",incidenciaDao.listarIncidencias());
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "gestionar_Incidencia_S":
                String id = request.getParameter("id");
                IncidenciasB incidenciasB = incidenciaDao.buscarPorId(id);

                if(incidenciasB != null){
                    request.setAttribute("incidencia",incidenciasB);
                    request.getRequestDispatcher("WEB-INF/Serenazgo/gestionar_Incidencia_S.jsp").forward(request,response);
                }else{
                    response.sendRedirect(request.getContextPath() + "/SerenazgoServlet");
                }
                break;
            case "listaVecinos_S":
                vista = "WEB-INF/Serenazgo/listaVecinos_S.jsp";
                request.setAttribute("lista",vecinoDao.listarVecinos());
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "banearVecino":
                String vecinoId = request.getParameter("idVecino");
                if (usuarioDao.obtenerUsuario(vecinoId) != null) {
                    try {
                        usuarioDao.banearUsuario(vecinoId);
                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("msg","Vecino baneado exitosomente");
                        response.sendRedirect(request.getContextPath() + "/SerenazgoServlet?action=listaVecinos_S");
                    } catch (SQLException e) {
                        response.sendRedirect(request.getContextPath() + "/SerenazgoServlet?err=Error al denegadar solicitud");
                    }
                }
                break;


            default:
              request.getRequestDispatcher("WEB-INF/Serenazgo/" + action + ".jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        IncidenciaDao incidenciaDao = new IncidenciaDao();
        VecinoDao vecinoDao = new VecinoDao();
        String action = request.getParameter("action") == null ? "buscarIncidenciaPorNombre" : request.getParameter("action");
        String textoBuscar;
        String incidenciaId;
        String idUsuario;
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
                int idIncidencia = Integer.parseInt(request.getParameter("idIncidencia"));
                String solucionADar = request.getParameter("solucionADar");
                String criticidadIncidencia = request.getParameter("criticidadIncidencia");
                String nombrePersonalDeTurno =request.getParameter("nombrePersonalDeTurno");
                String idSerenazgo = request.getParameter("idSerenazgo");
                String personalRequerido = request.getParameter("personalRequerido");
                String movilidadIncidencia = request.getParameter("movilidadIncidencia");
                String estadoIncidenci = request.getParameter("estadoIncidencia");



                incidenciaB.setIdIncidencias(idIncidencia);
                incidenciaB.setSolucionADar(solucionADar);
                incidenciaB.setNombrePersonalTurno(nombrePersonalDeTurno);
                incidenciaB.setCriticidadIncidencia_idCriticidadIncidencia(Integer.parseInt(criticidadIncidencia));
                incidenciaB.setSerenazgo_idSerenazgo(Integer.parseInt(idSerenazgo));
                incidenciaB.setPersonalRequerido(Integer.parseInt(personalRequerido));
                incidenciaB.setTipoMovilidadRequerido(Integer.parseInt(movilidadIncidencia));
                incidenciaB.setEstadosIncidencia_idEstadoIncidencia(Integer.parseInt(estadoIncidenci));

                /*
                if (criticidadIncidencia != null) {
                    incidenciaB.setCriticidadIncidencia_idCriticidadIncidencia(Integer.parseInt(criticidadIncidencia));
                }

                if (idSerenazgo != null) {
                    incidenciaB.setSerenazgo_idSerenazgo(Integer.parseInt(idSerenazgo));
                }

                if (personalRequerido != null) {
                    incidenciaB.setPersonalRequerido(Integer.parseInt(personalRequerido));
                }

                if (movilidadIncidencia != null) {
                    incidenciaB.setTipoMovilidadRequerido(Integer.parseInt(movilidadIncidencia));
                }

                if (estadoIncidenci != null) {
                    incidenciaB.setEstadosIncidencia_idEstadoIncidencia(Integer.parseInt(estadoIncidenci));
                }
                */


                incidenciaDao.actualizarIncidenciaS(incidenciaB);
                response.sendRedirect(request.getContextPath() + "/SerenazgoServlet?action=listaIncidencias_S");
                break;
            case "buscarVecinoPorNombre":
                textoBuscar= request.getParameter("textoBuscar");
                if (textoBuscar == null) {
                    response.sendRedirect(request.getContextPath() + "/SerenazgoServlet?action=listaVecinos_S");
                } else {
                    request.setAttribute("textoBusqueda",textoBuscar);
                    request.setAttribute("lista", vecinoDao.buscarVecinoPorNombre(textoBuscar));
                    request.getRequestDispatcher("WEB-INF/Serenazgo/listaVecinos_S.jsp").forward(request, response);

                }
                break;
            case "seleccionarInicidenciaFalsa":
                incidenciaId = request.getParameter("incidenciaId");
                idUsuario = request.getParameter("idUsuario");
                incidenciaDao.actualizarIncidenciaComoFalsa(incidenciaId,idUsuario);
                request.setAttribute("lista",incidenciaDao.listarIncidencias());
                request.getRequestDispatcher("WEB-INF/Serenazgo/listaIncidencias_S.jsp").forward(request, response);
                break;
            case "borrarIncidencia":
                incidenciaId = request.getParameter("incidenciaId");
                incidenciaDao.borradorLogicoIncidencia(incidenciaId);
                request.setAttribute("lista",incidenciaDao.listarIncidencias());
                request.getRequestDispatcher("WEB-INF/Serenazgo/listaIncidencias_S.jsp").forward(request, response);


                break;

        }


    }







}
