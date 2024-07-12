package org.example.televecinosunidos_appweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.televecinosunidos_appweb.model.beans.IncidenciasB;
import org.example.televecinosunidos_appweb.model.beans.SerenazgoB;
import org.example.televecinosunidos_appweb.model.beans.UsuarioB;
import org.example.televecinosunidos_appweb.model.daos.IncidenciaDao;
import org.example.televecinosunidos_appweb.model.daos.SerenazgoDao;
import org.example.televecinosunidos_appweb.model.daos.UsuarioDao;
import org.example.televecinosunidos_appweb.model.daos.VecinoDao;
import org.example.televecinosunidos_appweb.model.dto.SerenazgoDTO;
import org.example.televecinosunidos_appweb.util.GeneraContrasena;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "SerenazgoServlet", value = "/SerenazgoServlet")
public class SerenazgoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IncidenciaDao incidenciaDao = new IncidenciaDao();
        VecinoDao vecinoDao = new VecinoDao();
        UsuarioDao usuarioDao = new UsuarioDao();
        SerenazgoDao serenazgoDao = new SerenazgoDao();


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
                request.setAttribute("lista",serenazgoDao.listarVecinosPorCantidadIncidenciasFalsas());
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
            case "verDetalleIncidencia":
                String idIncidencia = request.getParameter("idIncidencia");
                String idVecinoDuenoIncidencia = request.getParameter("idVecinoDuenoIncidencia");
                vista = "WEB-INF/Serenazgo/verIncidencia_S.jsp";
                request.setAttribute("incidencia",incidenciaDao.buscarPorId(idIncidencia));
                request.setAttribute("nombreVecinoDuenoIncidencia",vecinoDao.buscarVecinoPorId(idVecinoDuenoIncidencia).getNombre()+" " + vecinoDao.buscarVecinoPorId(idVecinoDuenoIncidencia).getApellido());
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "dashboard":
                //request.setAttribute("parametros",incidenciaDao.listar());
                ArrayList<Double> tabla1 = incidenciaDao.DashboardTabla1234(1);
                ArrayList<Double> tabla2 = incidenciaDao.DashboardTabla1234(2);
                ArrayList<Double> tabla3 = incidenciaDao.DashboardTabla1234(3);
                ArrayList<Double> tabla4 = incidenciaDao.DashboardTabla1234(4);
                request.setAttribute("tabla1", tabla1);
                request.setAttribute("tabla2", tabla2);
                request.setAttribute("tabla3", tabla3);
                request.setAttribute("tabla4", tabla4);

                ArrayList<Integer> tabla7_tipo1 = incidenciaDao.DashboardTabla7(1);
                ArrayList<Integer> tabla7_tipo2 = incidenciaDao.DashboardTabla7(2);
                ArrayList<Integer> tabla7_tipo3 = incidenciaDao.DashboardTabla7(3);
                ArrayList<Integer> tabla7_tipo4 = incidenciaDao.DashboardTabla7(4);
                request.setAttribute("tabla7_tipo1", tabla7_tipo1);
                request.setAttribute("tabla7_tipo2", tabla7_tipo2);
                request.setAttribute("tabla7_tipo3", tabla7_tipo3);
                request.setAttribute("tabla7_tipo4", tabla7_tipo4);


                vista = "WEB-INF/Serenazgo/dashboard.jsp";
                request.getRequestDispatcher(vista).forward(request, response);

                break;
            case "cambiarContrasena":
                vista = "WEB-INF/Serenazgo/cambioContrasena_S.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "perfil_S":
                vista = "WEB-INF/Serenazgo/perfil_S.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "cambiarTelefono_S":
                String idSereno = request.getParameter("idSereno");
                request.setAttribute("telefonoSereno",serenazgoDao.buscarSerenazgoPorId(idSereno).getNumTelefono());
                vista = "WEB-INF/Serenazgo/cambiarTelefono_S.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;


            default:
              request.getRequestDispatcher("WEB-INF/Serenazgo/" + action + ".jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        IncidenciaDao incidenciaDao = new IncidenciaDao();
        SerenazgoDao serenazgoDao = new SerenazgoDao();
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
                int idIncidencia = Integer.parseInt(request.getParameter("idIncidencia"));//
                String solucionADar = request.getParameter("solucionADar");//
                String criticidadIncidencia = request.getParameter("criticidadIncidencia");//
                String nombrePersonalDeTurno =request.getParameter("nombrePersonalDeTurno");//
                String idSerenazgo = request.getParameter("idSerenazgo");//
                String personalRequerido = request.getParameter("personalRequerido");//
                String movilidadIncidencia = request.getParameter("movilidadIncidencia");//
                String estadoIncidenci = request.getParameter("estadoIncidencia");

                //validamos
                if (solucionADar == null || solucionADar.isEmpty()) {
                    response.sendRedirect(request.getContextPath() + "/SerenazgoServlet?action=gestionar_Incidencia_S&id=" + idIncidencia + "&err=" + URLEncoder.encode("Colocar la solucion a dar es obligatorio", StandardCharsets.UTF_8.toString()));
                    return;
                } else if (solucionADar.length() > 100) {
                    response.sendRedirect(request.getContextPath() + "/SerenazgoServlet?action=gestionar_Incidencia_S&id=" + idIncidencia + "&err=" + URLEncoder.encode("La solucion a dar no puede tener más de 100 caracteres", StandardCharsets.UTF_8.toString()));
                    return;
                }
                if (criticidadIncidencia == null || criticidadIncidencia.isEmpty()) {
                    response.sendRedirect(request.getContextPath() + "/SerenazgoServlet?action=gestionar_Incidencia_S&id=" + idIncidencia + "&err=" + URLEncoder.encode("Elegir la criticidad de la incidencia es obligatorio", StandardCharsets.UTF_8.toString()));
                    return;
                }
                if (personalRequerido == null || personalRequerido.isEmpty()) {
                    response.sendRedirect(request.getContextPath() + "/SerenazgoServlet?action=gestionar_Incidencia_S&id=" + idIncidencia + "&err=" + URLEncoder.encode("Elegir el personal requerido de la incidencia es obligatorio", StandardCharsets.UTF_8.toString()));
                    return;
                }
                if (movilidadIncidencia == null || movilidadIncidencia.isEmpty()) {
                    response.sendRedirect(request.getContextPath() + "/SerenazgoServlet?action=gestionar_Incidencia_S&id=" + idIncidencia + "&err=" + URLEncoder.encode("Elegir la movilidad de la incidencia es obligatorio", StandardCharsets.UTF_8.toString()));
                    return;
                }
                if (estadoIncidenci == null || estadoIncidenci.isEmpty()) {
                    response.sendRedirect(request.getContextPath() + "/SerenazgoServlet?action=gestionar_Incidencia_S&id=" + idIncidencia + "&err=" + URLEncoder.encode("Elegir el estado de la incidencia es obligatorio", StandardCharsets.UTF_8.toString()));
                    return;
                }

                incidenciaB.setIdIncidencias(idIncidencia);
                incidenciaB.setSolucionADar(solucionADar);
                incidenciaB.setNombrePersonalTurno(nombrePersonalDeTurno);
                incidenciaB.setCriticidadIncidencia_idCriticidadIncidencia(Integer.parseInt(criticidadIncidencia));
                incidenciaB.setSerenazgo_idSerenazgo(Integer.parseInt(idSerenazgo));
                incidenciaB.setPersonalRequerido(Integer.parseInt(personalRequerido));
                incidenciaB.setTipoMovilidadRequerido(Integer.parseInt(movilidadIncidencia));
                incidenciaB.setEstadosIncidencia_idEstadoIncidencia(Integer.parseInt(estadoIncidenci));

                incidenciaDao.actualizarIncidenciaS(incidenciaB);
                response.sendRedirect(request.getContextPath() + "/SerenazgoServlet?action=gestionar_Incidencia_S&id=" + idIncidencia+"&success=" + URLEncoder.encode("La incidencia ha sido gestionada exitosamente",StandardCharsets.UTF_8.toString()));
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
                idUsuario = request.getParameter("UsrID");
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
            case "cambiarTelefono":
                String nuevoTelefono = request.getParameter("nuevoTelefono");
                if (nuevoTelefono == null || nuevoTelefono.isEmpty()) {
                    request.setAttribute("err", "Es obligatorio llenar el nuevo teléfono");
                    request.getRequestDispatcher("WEB-INF/Serenazgo/cambiarTelefono_S.jsp").forward(request, response);
                    return;
                } else if (nuevoTelefono.length() != 9) {
                    request.setAttribute("err", "El teléfono debe tener 9 dígitos.");
                    request.getRequestDispatcher("WEB-INF/Serenazgo/cambiarTelefono_S.jsp").forward(request, response);
                    return;
                }else{
                    SerenazgoDTO serenazgoDTO1 = (SerenazgoDTO) session.getAttribute("serenazgoLogeado");
                    String num = String.valueOf(serenazgoDTO1.getIdSerenazgo());
                    serenazgoDao.cambiarTelefono(nuevoTelefono,String.valueOf(serenazgoDao.buscarSerenazgoPorId(num).getIdSerenazgo()));
                    session.setAttribute("success", "Telefono cambiado exitosamente");
                    response.sendRedirect(request.getContextPath() + "/SerenazgoServlet?action=cambiarTelefono_S");
                }

                break;
            case "cambiarContrasena":
                String nuevaContrasena = request.getParameter("nuevaContrasena");
                String confirmarContrasena = request.getParameter("confirmarContrasena");

                // Validaciones de contraseña
                if (nuevaContrasena == null || nuevaContrasena.isEmpty() || confirmarContrasena == null || confirmarContrasena.isEmpty()) {
                    request.setAttribute("err", "Ambos campos son obligatorios.");
                    request.getRequestDispatcher("WEB-INF/Serenazgo/cambioContrasena_S.jsp").forward(request, response);
                    return;
                } else if (nuevaContrasena.length() < 8) {
                    request.setAttribute("err", "La contraseña debe tener al menos 8 caracteres.");
                    request.getRequestDispatcher("WEB-INF/Serenazgo/cambioContrasena_S.jsp").forward(request, response);
                    return;
                } else if (!nuevaContrasena.matches("^(?=.*[0-9])(?=.*[a-zA-Z])(?!.*\\s).*$")) {
                    request.setAttribute("err", "La contraseña debe contener al menos un número y una letra, sin espacios ni caracteres especiales.");
                    request.getRequestDispatcher("WEB-INF/Serenazgo/cambioContrasena_S.jsp").forward(request, response);
                    return;
                } else if (!nuevaContrasena.equals(confirmarContrasena)) {
                    request.setAttribute("err", "Las contraseñas no coinciden.");
                    request.getRequestDispatcher("WEB-INF/Serenazgo/cambioContrasena_S.jsp").forward(request, response);
                    return;
                } else {
                    // Proceso de cambio de contraseña
                    UsuarioDao usuarioDao = new UsuarioDao();

                    SerenazgoDTO serenazgoDTO = (SerenazgoDTO) session.getAttribute("serenazgoLogeado");

                    UsuarioB usuario = usuarioDao.obtenerUsuario(String.valueOf(serenazgoDTO.getIdUsuario()));

                    if (usuario != null) {
                        String hashedPassword;
                        try {
                            hashedPassword = GeneraContrasena.hashPassword(nuevaContrasena);
                        } catch (NoSuchAlgorithmException e) {
                            throw new RuntimeException(e);
                        }
                        usuario.setContrasenia(hashedPassword);

                        usuarioDao.actualizarContrasena(usuario);
                        session.setAttribute("success", "Contraseña cambiada exitosamente");
                        response.sendRedirect(request.getContextPath() + "/SerenazgoServlet?action=cambiarContrasena");
                    } else {
                        request.setAttribute("err", "Usuario no encontrado en la sesión.");
                        request.getRequestDispatcher("WEB-INF/Serenazgo/cambioContrasena_S.jsp").forward(request, response);
                    }
                }
                break;

        }


    }







}
