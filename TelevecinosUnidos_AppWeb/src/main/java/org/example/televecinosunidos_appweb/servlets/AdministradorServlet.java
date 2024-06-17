package org.example.televecinosunidos_appweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.televecinosunidos_appweb.model.beans.EventoB;
import org.example.televecinosunidos_appweb.model.beans.ProfesoresEvento;
import org.example.televecinosunidos_appweb.model.beans.SerenazgoB;
import org.example.televecinosunidos_appweb.model.beans.UsuarioB;
import org.example.televecinosunidos_appweb.model.daos.*;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "AdministradorServlet", urlPatterns = {"/AdministradorServlet", ""})
public class AdministradorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UsuarioDao usuarioDao = new UsuarioDao();
        SerenazgoDao serenazgoDao = new SerenazgoDao();
        CoordinadoraDao coordinadoraDao = new CoordinadoraDao();
        VecinoDao vecinoDao = new VecinoDao();
        InstructorDao instructorDao = new InstructorDao();
        SolicitanteDao solicitanteDao = new SolicitanteDao();


        ArrayList<SerenazgoB> listarSerenazgos = serenazgoDao.listarSerenazgos();
        String idCoordinadora;
        String action = request.getParameter("action")==null?"inicioAdmin":request.getParameter("action");
        String vista ;
        switch (action) {
            case "listaSerenazgo_A":
                vista = "WEB-INF/Administrador/listaSerenazgo_A.jsp";
                request.setAttribute("lista",listarSerenazgos);
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "verSerenazgo":
                String idSerenazgo = request.getParameter("idSerenazgo");
                request.setAttribute("serenazgo",serenazgoDao.buscarSerenazgoPorId(idSerenazgo));
                vista = "WEB-INF/Administrador/DetalleSerenazgo_A.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "registroSerenazgo":
                request.getRequestDispatcher("WEB-INF/Administrador/registroSerenazgo.jsp").forward(request,response);
                break;
            case "listaCoordinadorasCultura_A":
                vista = "WEB-INF/Administrador/listaCoordinadorasCultura_A.jsp";
                ArrayList<UsuarioB> listarCoordinadorasCultura = coordinadoraDao.listarCoordinadorasCultura();
                request.setAttribute("lista",listarCoordinadorasCultura);
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "listaCoordinadorasDeportes_A":
                vista = "WEB-INF/Administrador/listaCoordinadorasDeportes_A.jsp";
                ArrayList<UsuarioB> listarCoordinadorasDeportes = coordinadoraDao.listarCoordinadorasDeportes();
                request.setAttribute("lista",listarCoordinadorasDeportes);
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "DetalleCoordinadoraCultura_A":
                idCoordinadora = request.getParameter("idCoordinadora");
                request.setAttribute("coordinadora",coordinadoraDao.buscarCoordinadoraPorId(idCoordinadora));
                vista = "WEB-INF/Administrador/DetalleCoordinadoraCultura_A.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "DetalleCoordinadoraDeportes_A":
                idCoordinadora = request.getParameter("idCoordinadora");
                request.setAttribute("coordinadora",coordinadoraDao.buscarCoordinadoraPorId(idCoordinadora));
                vista = "WEB-INF/Administrador/DetalleCoordinadoraDeportes_A.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "listaVecinos_A":
                vista = "WEB-INF/Administrador/listaVecinos_A.jsp";
                request.setAttribute("lista",vecinoDao.listarVecinos());
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "DetalleVecinos_A":
                String idVecino = request.getParameter("idVecino");
                request.setAttribute("vecino",vecinoDao.buscarVecinoPorId(idVecino));
                vista = "WEB-INF/Administrador/DetalleVecinos_A.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "listaInstructores_A":
                vista = "WEB-INF/Administrador/listaInstructores_A.jsp";
                request.setAttribute("lista",instructorDao.listarProfesores());
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "registroInstructor":
                request.getRequestDispatcher("WEB-INF/Administrador/registroInstructor.jsp").forward(request,response);
                break;
            case "nuevasSolicitudes_A":
                vista = "WEB-INF/Administrador/nuevasSolicitudes_A.jsp";
                request.setAttribute("lista",solicitanteDao.listarSolicitantes());
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "usuariosBaneados_A":
                vista = "WEB-INF/Administrador/usuariosBaneados_A.jsp";
                request.setAttribute("lista",usuarioDao.listarBaneados());
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "solicitanteAVecinoAceptar":
                String solicitanteId = request.getParameter("idSolicitante");
                if (solicitanteDao.obtenerSolicitante(solicitanteId) != null) {
                    try {
                        solicitanteDao.aceptarSolicitud(solicitanteId);
                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("msg","Solicitud aprobada exitosamente");
                        response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=nuevasSolicitudes_A");
                    } catch (SQLException e) {
                        response.sendRedirect(request.getContextPath() + "/AdministradorServlet?err=Error al aprobar solicitud");
                    }
                }
                break;
            case "solicitanteAVecinoDenegar":
                String solicitanteId2 = request.getParameter("idSolicitante");
                if (solicitanteDao.obtenerSolicitante(solicitanteId2) != null) {
                    try {
                        solicitanteDao.denegarSolicitud(solicitanteId2);
                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("msg","Solicitud denegada exitosamente");
                        response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=nuevasSolicitudes_A");
                    } catch (SQLException e) {
                        response.sendRedirect(request.getContextPath() + "/AdministradorServlet?err=Error al denegadar solicitud");
                    }
                }
                break;
            case "banearVecino":
                String vecinoId = request.getParameter("idVecino");
                if (usuarioDao.obtenerUsuario(vecinoId) != null) {
                    try {
                        usuarioDao.banearUsuario(vecinoId);
                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("msg","Vecino baneado exitosomente");
                        response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=listaVecinos_A");
                    } catch (SQLException e) {
                        response.sendRedirect(request.getContextPath() + "/AdministradorServlet?err=Error al denegadar solicitud");
                    }
                }
                break;
            case "banearCoordinadoraCultura":
                String cordiCulturaId = request.getParameter("idCoordinadora");
                if (usuarioDao.obtenerUsuario(cordiCulturaId) != null) {
                    try {
                        usuarioDao.banearUsuario(cordiCulturaId);
                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("msg","Coordinadora baneada exitosomente");
                        response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=listaCoordinadorasCultura_A");
                    } catch (SQLException e) {
                        response.sendRedirect(request.getContextPath() + "/AdministradorServlet?err=Error al denegadar solicitud");
                    }
                }
                break;
            case "banearCoordinadoraDeporte":
                String cordiDeporteId = request.getParameter("idCoordinadora");
                if (usuarioDao.obtenerUsuario(cordiDeporteId) != null) {
                    try {
                        usuarioDao.banearUsuario(cordiDeporteId);
                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("msg","Coordinadora baneada exitosomente");
                        response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=listaCoordinadorasDeportes_A");
                    } catch (SQLException e) {
                        response.sendRedirect(request.getContextPath() + "/AdministradorServlet?err=Error al denegadar solicitud");
                    }
                }
                break;
            case "banearSerenazgo":
                String serenazgoId = request.getParameter("idSerenazgo");
                if (usuarioDao.obtenerUsuario(serenazgoId) != null) {
                    try {
                        usuarioDao.banearUsuario(serenazgoId);
                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("msg","Serenazgo baneado exitosomente");
                        response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=listaSerenazgo_A");
                    } catch (SQLException e) {
                        response.sendRedirect(request.getContextPath() + "/AdministradorServlet?err=Error al denegadar solicitud");
                    }
                }
                break;
            case "desbanearUsuario":
                String usuarioId = request.getParameter("idUsuario");
                if (usuarioDao.obtenerUsuario(usuarioId) != null) {
                    try {
                        usuarioDao.desbanearUsuario(usuarioId);
                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("msg","Usuario desbaneado exitosomente");
                        response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=usuariosBaneados_A");
                    } catch (SQLException e) {
                        response.sendRedirect(request.getContextPath() + "/AdministradorServlet?err=Error al denegadar solicitud");
                    }
                }
                break;

            case "promoverAcoordinadorCultura":
                vecinoId = request.getParameter("idVecino");
                if (usuarioDao.obtenerUsuario(vecinoId) != null) {
                    try {
                        vecinoDao.promoverACoordinadorCultura(vecinoId);
                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("msg","Vecino promovido exitosomente");
                        response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=listaVecinos_A");
                    } catch (SQLException e) {
                        response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=listaVecinos_A&err=Error al promover");
                    }
                }
                break;

            case "promoverAcoordinadorDeporte":
                vecinoId = request.getParameter("idVecino");
                if (usuarioDao.obtenerUsuario(vecinoId) != null) {
                    try {
                        vecinoDao.promoverACoordinadorDeportes(vecinoId);
                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("msg","Vecino promovido exitosomente");
                        response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=listaVecinos_A");
                    } catch (SQLException e) {
                        response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=listaVecinos_A&err=Error al promover");
                    }
                }
                break;


            default:
                request.getRequestDispatcher("WEB-INF/Administrador/" + action + ".jsp").forward(request,response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        UsuarioDao usuarioDao = new UsuarioDao();
        SerenazgoDao serenazgoDao = new SerenazgoDao();
        CoordinadoraDao coordinadoraDao = new CoordinadoraDao();
        VecinoDao vecinoDao = new VecinoDao();
        InstructorDao instructorDao = new InstructorDao();
        SolicitanteDao solicitanteDao = new SolicitanteDao();

        String action = request.getParameter("action") == null ? "registrarSerenazgo" : request.getParameter("action");
        String textoBuscar;

        switch (action){
            case "registrarSerenazgo":

                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String dni = request.getParameter("dni");
                String direccion = request.getParameter("direccion");
                String numTelefono = request.getParameter("numTelefono");
                String fechaNacimiento = request.getParameter("fechaNacimiento");
                int turno = Integer.parseInt(request.getParameter("turno"));
                int tipo = Integer.parseInt(request.getParameter("tipo"));
                String correo = request.getParameter("correo");
                String contrasenia = request.getParameter("contrasenia");
                int pregFrecuentes = 1;
                int idRol = 4;
                int isBan = 0;


                UsuarioB us = new UsuarioB();
                us.setNombre(nombre);
                us.setApellido(apellido);
                us.setDni(dni);
                us.setDireccion(direccion);
                us.setCorreo(correo);
                us.setContrasenia(contrasenia);
                us.setPreguntasFrecuentes_idTable2(pregFrecuentes);
                us.setIdRol(idRol);
                us.setIsBan(isBan);

                SerenazgoB serenazgoB = new SerenazgoB();
                serenazgoB.setNumTelefono(numTelefono);
                serenazgoB.setFechaNacimiento(fechaNacimiento);
                serenazgoB.setIdTurnoSerenazgo(turno);
                serenazgoB.setIdTipoSerenazgo(tipo);

                serenazgoB.setUsuario(us);
                serenazgoDao.registrarSerenazgo(serenazgoB);

                response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=listaSerenazgo_A");
                break;
            case "registroInstructor":

                String nombre1 = request.getParameter("nombre");
                String apellido1 = request.getParameter("apellido");
                String curso = request.getParameter("curso");
                ProfesoresEvento profesoresEvento = new ProfesoresEvento();
                profesoresEvento.setNombre(nombre1);
                profesoresEvento.setApellido(apellido1);
                profesoresEvento.setCurso(curso);
                instructorDao.registrarNuevoProfesor(profesoresEvento);
                response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=listaInstructores_A");
                break;
            case "buscarVecinoPorNombre":
                textoBuscar= request.getParameter("textoBuscar");
                if (textoBuscar == null) {
                    response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=listaVecinos_A");
                } else {
                    request.setAttribute("textoBusqueda",textoBuscar);
                    request.setAttribute("lista", vecinoDao.buscarVecinoPorNombre(textoBuscar));
                    RequestDispatcher view = request.getRequestDispatcher("WEB-INF/Administrador/listaVecinos_A.jsp");
                    view.forward(request, response);
                }
                break;

            case "buscarSerenazgoPorNombre":
                textoBuscar= request.getParameter("textoBuscarSerenazgo");
                if (textoBuscar == null) {
                    response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=listaSerenazgo_A");
                } else {
                    request.setAttribute("textoBusqueda",textoBuscar);
                    request.setAttribute("lista", serenazgoDao.listarSerenazgosPorNombre(textoBuscar));
                    RequestDispatcher view = request.getRequestDispatcher("WEB-INF/Administrador/listaSerenazgo_A.jsp");
                    view.forward(request, response);
                }
                break;
            case "buscarCoordiCulturaPorNombre":
                textoBuscar= request.getParameter("textoBuscar");
                if (textoBuscar == null) {
                    response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=listaCoordinadorasCultura_A");
                } else {
                    request.setAttribute("textoBusqueda",textoBuscar);
                    request.setAttribute("lista", coordinadoraDao.listarCoordinadorasCulturaPorNombre(textoBuscar));
                    RequestDispatcher view = request.getRequestDispatcher("WEB-INF/Administrador/listaCoordinadorasCultura_A.jsp");
                    view.forward(request, response);
                }
                break;
            case "buscarCoordiDeportesPorNombre":
                textoBuscar= request.getParameter("textoBuscar");
                if (textoBuscar == null) {
                    response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=listaCoordinadorasDeportes_A");
                } else {
                    request.setAttribute("textoBusqueda",textoBuscar);
                    request.setAttribute("lista", coordinadoraDao.listarCoordinadorasDeportesPorNombre(textoBuscar));
                    RequestDispatcher view = request.getRequestDispatcher("WEB-INF/Administrador/listaCoordinadorasDeportes_A.jsp");
                    view.forward(request, response);
                }
                break;
            case "buscarUsuariosBaneadosPorNombre":
                textoBuscar= request.getParameter("textoBuscar");
                if (textoBuscar == null) {
                    response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=usuariosBaneados_A");
                } else {
                    request.setAttribute("textoBusqueda",textoBuscar);
                    request.setAttribute("lista", usuarioDao.listarBaneadosPorNombre(textoBuscar));
                    RequestDispatcher view = request.getRequestDispatcher("WEB-INF/Administrador/usuariosBaneados_A.jsp");
                    view.forward(request, response);
                }
                break;
            case "buscarNuevasSolicitudesPorNombre":
                textoBuscar= request.getParameter("textoBuscar");
                if (textoBuscar == null) {
                    response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=nuevasSolicitudes_A");
                } else {
                    request.setAttribute("textoBusqueda",textoBuscar);
                    request.setAttribute("lista", solicitanteDao.listarSolicitantesPorNombre(textoBuscar));
                    RequestDispatcher view = request.getRequestDispatcher("WEB-INF/Administrador/nuevasSolicitudes_A.jsp");
                    view.forward(request, response);
                }
                break;
            case "buscarInstructoresPorNombre":
                textoBuscar= request.getParameter("textoBuscar");
                if (textoBuscar == null) {
                    response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=listaInstructores_A");
                } else {
                    request.setAttribute("textoBusqueda",textoBuscar);
                    request.setAttribute("lista", solicitanteDao.listarSolicitantesPorNombre(textoBuscar));
                    RequestDispatcher view = request.getRequestDispatcher("WEB-INF/Administrador/listaInstructores_A.jsp");
                    view.forward(request, response);
                }
                break;

        }
    }
}
