package org.example.televecinosunidos_appweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.televecinosunidos_appweb.model.beans.EventoB;
import org.example.televecinosunidos_appweb.model.beans.IncidenciasB;
import org.example.televecinosunidos_appweb.model.beans.UsuarioB;
import org.example.televecinosunidos_appweb.model.daos.*;
import org.example.televecinosunidos_appweb.util.GeneraContrasena;

import java.io.IOException;
import java.io.InputStream;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

@MultipartConfig
@WebServlet(name = "VecinoServlet", value = "/VecinoServlet")
public class VecinoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IncidenCoordDao incidenciaDao = new IncidenCoordDao();
        EventoDao eventoDao = new EventoDao();
        HttpSession session = request.getSession();
        String action = request.getParameter("action") == null ? "inicioVecino" : request.getParameter("action");
        String vista;

        UsuarioB usuarioLogueado = (UsuarioB) session.getAttribute("usuarioLogueado");
        if (usuarioLogueado == null) {
            response.sendRedirect("/LoginServlet");
            return;
        }
        int userId = usuarioLogueado.getIdUsuario();

        switch (action) {
            /*------------------Página principal------------------*/
            case "inicioVecino":
                ArrayList<IncidenciasB> listaIncidenciasRecientes = incidenciaDao.listarIncidenciaRecientes(userId);
                request.setAttribute("listaIncidencia", listaIncidenciasRecientes);
                vista = "WEB-INF/Vecino/inicioVecino.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "cambiarContrasena":
                vista = "WEB-INF/Vecino/cambioContrasena.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "verEventos":
                ArrayList<EventoB> listaEventos = eventoDao.listarTodosEventos();
                request.setAttribute("listaEventos", listaEventos);
                vista = "WEB-INF/Vecino/Evento-D-Vecino.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "verEvento":
                String idEvento = request.getParameter("idEvento");
                EventoB evento = eventoDao.buscarEventoPorId(idEvento);
                request.setAttribute("evento", evento);
                vista = "WEB-INF/Vecino/EventoActual-Vecino.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "preguntasFrecuentes":
                vista = "WEB-INF/Vecino/preguntasFrecuentes_V.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;

            case "verPerfil":
                vista = "WEB-INF/Vecino/perfil_V.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;

            /*-------------fin Página principal-------------------*/
            case "eventosInscritos":
                // Lógica para listar los eventos a los que se inscribe
                vista = "WEB-INF/Vecino/ListaEvent-Vecino.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;

            /*----------------Incidencias----------------*/
            case "listarIncidencia":
                ArrayList<IncidenciasB> listaIncidencias = incidenciaDao.listarIncidencia(userId);
                request.setAttribute("lista", listaIncidencias);
                vista = "WEB-INF/Vecino/listaIncidencias_V.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;

            case "verIncidencia":
                String idIncidencia = request.getParameter("idIncidencia");
                IncidenciasB incidencia = incidenciaDao.buscarIncidenciaPorId(idIncidencia);
                request.setAttribute("incidencia", incidencia);
                vista = "WEB-INF/Vecino/verIncidencia_V.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;

            case "generarIncidencia":
                vista = "WEB-INF/Vecino/generarIncidencia_V.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
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
                request.getRequestDispatcher("WEB-INF/Vecino/" + action + ".jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        IncidenCoordDao incidenciaDao = new IncidenCoordDao();
        EventoDao eventoDao = new EventoDao();
        HttpSession session = request.getSession();
        String action = request.getParameter("action") == null ? "crear" : request.getParameter("action");

        UsuarioB usuarioLogueado = (UsuarioB) session.getAttribute("usuarioLogueado");
        if (usuarioLogueado == null) {
            response.sendRedirect("/LoginServlet");
            return;
        }
        int userId = usuarioLogueado.getIdUsuario();

        switch (action) {
            // Incidencia
            case "crearIncidencia":
                Map<String, String> errores = new HashMap<>();

                String nombreIncidencia = request.getParameter("nombreIncidencia");
                String tipoIncidencia = request.getParameter("TipoIncidencia_idTipoIncidencia");
                String urbanizacion = request.getParameter("urbanizacion_idUrbanizacion");
                String incidenciaPersonalStr = request.getParameter("incidenciaPersonal");
                String lugarExacto = request.getParameter("lugarExacto");
                String referencia = request.getParameter("referencia");
                String numeroContacto = request.getParameter("numeroContacto");
                String ambulanciaStr = request.getParameter("ambulancia");

                Part part = request.getPart("foto");
                String fileName = part.getSubmittedFileName();
                InputStream fileInputStream = part.getInputStream();

                // Validaciones
                if (nombreIncidencia == null || nombreIncidencia.isEmpty()) {
                    errores.put("nombreIncidencia", "El nombre de la incidencia es obligatorio");
                } else if (nombreIncidencia.length() > 100) {
                    errores.put("nombreIncidencia", "El nombre de la incidencia no puede tener más de 100 caracteres");
                }

                if (tipoIncidencia == null || tipoIncidencia.isEmpty()) {
                    errores.put("tipoIncidencia", "El tipo de incidencia es obligatorio");
                }

                if (urbanizacion == null || urbanizacion.isEmpty()) {
                    errores.put("urbanizacion", "La urbanización es obligatoria");
                }

                if (incidenciaPersonalStr == null || incidenciaPersonalStr.isEmpty()) {
                    errores.put("incidenciaPersonal", "Debe indicar si la incidencia es para usted u otra persona");
                }

                if (lugarExacto == null || lugarExacto.isEmpty()) {
                    errores.put("lugarExacto", "El lugar exacto es obligatorio");
                } else if (lugarExacto.length() > 100) {
                    errores.put("lugarExacto", "El nombre de la incidencia no puede tener más de 100 caracteres");
                }

                if (referencia == null || referencia.isEmpty()) {
                    errores.put("referencia", "La referencia es obligatoria");
                }

                if (numeroContacto != null && !numeroContacto.isEmpty()) {
                    Pattern pattern = Pattern.compile("\\d{9}");
                    if (!pattern.matcher(numeroContacto).matches()) {
                        errores.put("numeroContacto", "El número de contacto debe tener 9 dígitos");
                    }
                }

                if (ambulanciaStr == null || ambulanciaStr.isEmpty()) {
                    errores.put("ambulancia", "Debe indicar si se requiere ambulancia");
                }

                if (!errores.isEmpty()) {
                    request.setAttribute("errores", errores);
                    request.setAttribute("nombreIncidencia", nombreIncidencia);
                    request.setAttribute("foto",part);
                    request.setAttribute("tipoIncidencia", tipoIncidencia);
                    request.setAttribute("urbanizacion", urbanizacion);
                    request.setAttribute("incidenciaPersonal", incidenciaPersonalStr);
                    request.setAttribute("lugarExacto", lugarExacto);
                    request.setAttribute("referencia", referencia);
                    request.setAttribute("numeroContacto", numeroContacto);
                    request.setAttribute("ambulancia", ambulanciaStr);
                    request.setAttribute("nombreFoto", fileName);
                    request.getRequestDispatcher("WEB-INF/Vecino/generarIncidencia_V.jsp").forward(request, response);
                    return;
                }

                int incidenciaPersonal = Integer.parseInt(incidenciaPersonalStr);
                int ambulancia = Integer.parseInt(ambulanciaStr);

                IncidenciasB incidencia = new IncidenciasB();
                incidencia.setNombreIncidencia(nombreIncidencia);
                incidencia.setFoto(fileInputStream);
                incidencia.setTipoIncidencia(tipoIncidencia);
                incidencia.setUrbanizacion(urbanizacion);
                incidencia.setIncidenciaPersonal(incidenciaPersonal);
                incidencia.setLugarExacto(lugarExacto);
                incidencia.setReferencia(referencia);
                incidencia.setNumeroContacto(numeroContacto);
                incidencia.setAmbulancia(ambulancia);
                incidencia.setNombreFoto(fileName);

                incidenciaDao.generarIncidenciaC(incidencia,userId);
                // Agregar mensaje a la sesión
                request.getSession().setAttribute("info", "Incidencia creada de manera exitosa");

                // Redirigir a la lista de incidencias
                response.sendRedirect(request.getContextPath() + "/VecinoServlet?action=listarIncidencia");
                break;

            case "editarIncidencia":
                Map<String, String> errores2 = new HashMap<>();

                IncidenciasB incidencia2 = incidenciaDao.buscarIncidenciaPorId(request.getParameter("idIncidencia"));
                int id = Integer.parseInt(request.getParameter("idIncidencia"));
                String nombreIncidencia2 = request.getParameter("nombreIncidencia");
                String tipoIncidencia2 = request.getParameter("TipoIncidencia_idTipoIncidencia");
                String urbanizacion2 = request.getParameter("urbanizacion_idUrbanizacion");
                String incidenciaPersonalStr2 = request.getParameter("incidenciaPersonal");
                String lugarExacto2 = request.getParameter("lugarExacto");
                String referencia2 = request.getParameter("referencia");
                String numeroContacto2 = request.getParameter("numeroContacto");
                String ambulanciaStr2 = request.getParameter("ambulancia");

                Part part2 = request.getPart("foto");
                String fileName2 = part2.getSubmittedFileName();
                InputStream fileInputStream2 = part2.getInputStream();

                // Validaciones
                if (nombreIncidencia2 == null || nombreIncidencia2.isEmpty()) {
                    errores2.put("nombreIncidencia2", "El nombre de la incidencia es obligatorio");
                } else if (nombreIncidencia2.length() > 100) {
                    errores2.put("nombreIncidencia2", "El nombre de la incidencia no puede tener más de 100 caracteres");
                }

                if (tipoIncidencia2 == null || tipoIncidencia2.isEmpty()) {
                    errores2.put("tipoIncidencia2", "El tipo de incidencia es obligatorio");
                }

                if (urbanizacion2 == null || urbanizacion2.isEmpty()) {
                    errores2.put("urbanizacion2", "La urbanización es obligatoria");
                }

                if (incidenciaPersonalStr2 == null || incidenciaPersonalStr2.isEmpty()) {
                    errores2.put("incidenciaPersonal2", "Debe indicar si la incidencia es para usted u otra persona");
                }

                if (lugarExacto2 == null || lugarExacto2.isEmpty()) {
                    errores2.put("lugarExacto2", "El lugar exacto es obligatorio");
                } else if (lugarExacto2.length() > 100) {
                    errores2.put("lugarExacto2", "El lugar exacto no puede tener más de 100 caracteres");
                }

                if (referencia2 == null || referencia2.isEmpty()) {
                    errores2.put("referencia2", "La referencia es obligatoria");
                }

                if (numeroContacto2 != null && !numeroContacto2.isEmpty()) {
                    Pattern pattern = Pattern.compile("\\d{9}");
                    if (!pattern.matcher(numeroContacto2).matches()) {
                        errores2.put("numeroContacto2", "El número de contacto debe tener 9 dígitos");
                    }
                }

                if (ambulanciaStr2 == null || ambulanciaStr2.isEmpty()) {
                    errores2.put("ambulancia2", "Debe indicar si se requiere ambulancia");
                }

                if (!errores2.isEmpty()) {
                    request.setAttribute("errores2", errores2);
                    request.setAttribute("nombreIncidencia2", nombreIncidencia2);
                    request.setAttribute("foto", part2);
                    request.setAttribute("tipoIncidencia2", tipoIncidencia2);
                    request.setAttribute("urbanizacion2", urbanizacion2);
                    request.setAttribute("incidenciaPersonal2", incidenciaPersonalStr2);
                    request.setAttribute("lugarExacto2", lugarExacto2);
                    request.setAttribute("referencia2", referencia2);
                    request.setAttribute("numeroContacto2", numeroContacto2);
                    request.setAttribute("ambulancia2", ambulanciaStr2);
                    request.setAttribute("nombreFoto", fileName2);
                    request.getRequestDispatcher("WEB-INF/Vecino/actualizarIncidencia_V.jsp").forward(request, response);
                    return;
                }

                int incidenciaPersonal2 = Integer.parseInt(incidenciaPersonalStr2);
                int ambulancia2 = Integer.parseInt(ambulanciaStr2);

                IncidenciasB incidenciaB = new IncidenciasB();
                incidenciaB.setIdIncidencias(id);
                incidenciaB.setNombreIncidencia(nombreIncidencia2);
                if (fileName2 == null || fileName2.isEmpty()){
                    incidenciaB.setFoto(incidencia2.getFoto());
                    incidenciaB.setNombreFoto(incidencia2.getNombreFoto());
                }else {
                    incidenciaB.setNombreFoto(fileName2);
                    incidenciaB.setFoto(fileInputStream2);
                }
                incidenciaB.setTipoIncidencia(tipoIncidencia2);
                incidenciaB.setUrbanizacion(urbanizacion2);
                incidenciaB.setIncidenciaPersonal(incidenciaPersonal2);
                incidenciaB.setLugarExacto(lugarExacto2);
                incidenciaB.setReferencia(referencia2);
                incidenciaB.setNumeroContacto(numeroContacto2);
                incidenciaB.setAmbulancia(ambulancia2);


                incidenciaDao.actualizarIncidencia(incidenciaB, userId);
                request.getSession().setAttribute("info", "Incidencia editada de manera exitosa");
                response.sendRedirect(request.getContextPath() + "/VecinoServlet?action=listarIncidencia");
                break;

            case "buscarIncidenciaPorNombre":
                String textBuscar = request.getParameter("textoBuscarIncidencia");
                String filtroFecha = request.getParameter("fecha");
                String filtroTipo = request.getParameter("tipo");
                String filtroEstado = request.getParameter("estado");
                if (textBuscar == null && filtroFecha == null && filtroTipo == null && filtroEstado == null) {
                    response.sendRedirect(request.getContextPath() + "/VecinoServlet?action=listarIncidencia");
                } else {
                    request.setAttribute("textoBuscarIncidencia", textBuscar);
                    request.setAttribute("lista", incidenciaDao.listarIncidenciasFiltro(textBuscar, filtroFecha, filtroTipo, filtroEstado,userId));
                    request.getRequestDispatcher("WEB-INF/Vecino/listaIncidencias_V.jsp").forward(request, response);
                }
                break;

            case "inscribirEvento":
                int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
                int idEvento = Integer.parseInt(request.getParameter("idEvento"));
                EventoDao eventoDao2 = new EventoDao();
                boolean success = eventoDao2.inscribirUsuarioEvento(idUsuario, idEvento);
                if (success) {
                    request.getSession().setAttribute("info", "Te has inscrito al evento exitosamente");
                } else {
                    request.getSession().setAttribute("error", "No se pudo inscribir al evento. Inténtalo de nuevo más tarde.");
                }
                response.sendRedirect(request.getContextPath() + "/VecinoServlet?action=verEvento&idEvento=" + idEvento);
                break;

            case "cambiarContrasena":
                String nuevaContrasena = request.getParameter("nuevaContrasena");
                String confirmarContrasena = request.getParameter("confirmarContrasena");

                // Validaciones de contraseña
                if (nuevaContrasena == null || nuevaContrasena.isEmpty() || confirmarContrasena == null || confirmarContrasena.isEmpty()) {
                    request.setAttribute("err", "Ambos campos son obligatorios.");
                    request.getRequestDispatcher("WEB-INF/Vecino/cambioContrasena.jsp").forward(request, response);
                    return;
                } else if (nuevaContrasena.length() < 8) {
                    request.setAttribute("err", "La contraseña debe tener al menos 8 caracteres.");
                    request.getRequestDispatcher("WEB-INF/Vecino/cambioContrasena.jsp").forward(request, response);
                    return;
                } else if (!nuevaContrasena.matches("^(?=.*[0-9])(?=.*[a-zA-Z])(?!.*\\s).*$")) {
                    request.setAttribute("err", "La contraseña debe contener al menos un número y una letra, sin espacios ni caracteres especiales.");
                    request.getRequestDispatcher("WEB-INF/Vecino/cambioContrasena.jsp").forward(request, response);
                    return;
                } else if (!nuevaContrasena.equals(confirmarContrasena)) {
                    request.setAttribute("err", "Las contraseñas no coinciden.");
                    request.getRequestDispatcher("WEB-INF/Vecino/cambioContrasena.jsp").forward(request, response);
                    return;
                } else {
                    // Proceso de cambio de contraseña
                    UsuarioDao usuarioDao = new UsuarioDao();
                    UsuarioB usuario = (UsuarioB) session.getAttribute("usuarioLogueado");

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
                        response.sendRedirect(request.getContextPath() + "/VecinoServlet?action=cambiarContrasena");
                    } else {
                        request.setAttribute("err", "Usuario no encontrado en la sesión.");
                        request.getRequestDispatcher("WEB-INF/Vecino/cambioContrasena.jsp").forward(request, response);
                    }
                }
                break;

            default:
                response.sendRedirect(request.getContextPath() + "/VecinoServlet");
                break;
        }
    }
}