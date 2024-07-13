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
import java.util.logging.ErrorManager;
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
                ArrayList<EventoB> eventosInscritos2 = eventoDao.obtenerEventosInscritos(userId);
                request.setAttribute("listaIncidencia", listaIncidenciasRecientes);
                request.setAttribute("eventosInscritos", eventosInscritos2);
                vista = "WEB-INF/Vecino/inicioVecino.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;

            case "contrasenaActual":
                vista = "WEB-INF/Vecino/contrasenaActual.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "cambiarContrasena":
                vista = "WEB-INF/Vecino/cambioContrasena.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "verEventos":
                ArrayList<EventoB> listaEventosGenerales = eventoDao.listarTodosEventos();
                ArrayList<EventoB> eventosNoInscritos = new ArrayList<>();
                for (EventoB evento : listaEventosGenerales) {
                    boolean estaInscrito = eventoDao.estaInscrito(userId, evento.getIdEvento());
                    if (!estaInscrito) {
                        eventosNoInscritos.add(evento);
                    }
                }
                request.setAttribute("listaEventos", eventosNoInscritos); // Pasar la nueva lista al JSP
                vista = "WEB-INF/Vecino/Evento-D-Vecino.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "verEvento":
                String idEvento = request.getParameter("idEvento");
                request.setAttribute("evento", eventoDao.buscarEventoPorId(idEvento));
                vista = "WEB-INF/Vecino/EventoActual-Vecino.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;

            case "verEventoInscrito":
                String idEvento2 = request.getParameter("idEvento");
                request.setAttribute("evento", eventoDao.buscarEventoPorId(idEvento2));
                vista = "WEB-INF/Vecino/EventFut.jsp";
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
                ArrayList<EventoB> eventosInscritos = eventoDao.obtenerEventosInscritos(userId);
                System.out.println("Eventos inscritos en el servlet: " + eventosInscritos);
                request.setAttribute("eventosInscritos", eventosInscritos);
                request.getRequestDispatcher("WEB-INF/Vecino/ListaEvent-Vecino.jsp").forward(request, response);
                break;
            case "inscribirEvento":
                String idEv = request.getParameter("idEvento");
                response.sendRedirect(request.getContextPath() + "/VecinoServlet?action=verEvento&idEvento=" + idEv);
                return;
            /*----------------Incidencias----------------*/
            case "listarIncidencia":
                int paginaActualI = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
                int eventosPorPaginaI = 5; // Número de eventos por página

                // Obtener la lista completa de incidencias
                ArrayList<IncidenciasB> listaIncidencias = incidenciaDao.listarIncidencia(userId);

                // Calcular total de páginas
                int totalEventosI = listaIncidencias.size();
                int totalPaginasI = (int) Math.ceil((double) totalEventosI / eventosPorPaginaI);

                // Si no hay eventos, asegurarse de que la página actual sea 1
                if (totalEventosI == 0) {
                    paginaActualI = 1;
                }

                // Obtener las incidencias de la página actual
                int desdeI = (paginaActualI - 1) * eventosPorPaginaI;
                int hastaI = Math.min(desdeI + eventosPorPaginaI, totalEventosI);
                ArrayList<IncidenciasB> incidenciaPaginados = new ArrayList<>(listaIncidencias.subList(desdeI, hastaI));

                // Enviar atributos al JSP
                vista = "WEB-INF/Vecino/listaIncidencias_V.jsp";
                request.setAttribute("lista", incidenciaPaginados);
                request.setAttribute("paginaActual", paginaActualI);
                request.setAttribute("totalPaginas", totalPaginasI);
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
                response.sendRedirect(request.getContextPath() + "/VecinoServlet?action=listarIncidencia");
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
        UsuarioDao usuarioDao = new UsuarioDao();
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
                    request.setAttribute("foto", part);
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

                incidenciaDao.generarIncidenciaC(incidencia, userId);
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

                    request.setAttribute("incidenciaB", incidencia2);

                    request.getRequestDispatcher("WEB-INF/Vecino/actualizarIncidencia_V.jsp").forward(request, response);
                    return;
                }


                int incidenciaPersonal2 = Integer.parseInt(incidenciaPersonalStr2);
                int ambulancia2 = Integer.parseInt(ambulanciaStr2);

                IncidenciasB incidenciaB = new IncidenciasB();
                incidenciaB.setIdIncidencias(id);
                incidenciaB.setNombreIncidencia(nombreIncidencia2);
                if (fileName2 == null || fileName2.isEmpty()) {
                    incidenciaB.setFoto(incidencia2.getFoto());
                    incidenciaB.setNombreFoto(incidencia2.getNombreFoto());
                } else {
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
                String textBuscarI = request.getParameter("textoBuscarIncidencia");
                String filtroFechaI = request.getParameter("fecha");
                String filtroTipoI = request.getParameter("tipo");
                String filtroEstadoI = request.getParameter("estado");
                int paginaI = request.getParameter("pagina") != null ? Integer.parseInt(request.getParameter("pagina")) : 1;

                if ((textBuscarI == null || textBuscarI.isEmpty()) && (filtroFechaI == null || filtroFechaI.isEmpty())
                        && (filtroTipoI == null || filtroTipoI.isEmpty()) && (filtroEstadoI == null || filtroEstadoI.isEmpty())) {
                    response.sendRedirect(request.getContextPath() + "/VecinoServlet?action=listarIncidencia");
                } else {
                    request.setAttribute("textoBuscarIncidencia", textBuscarI);
                    request.setAttribute("fecha", filtroFechaI);
                    request.setAttribute("tipo", filtroTipoI);
                    request.setAttribute("estado", filtroEstadoI);

                    // Obtener la lista filtrada de incidencias
                    ArrayList<IncidenciasB> incidencias = incidenciaDao.listarIncidenciasFiltro(textBuscarI, filtroFechaI, filtroTipoI, filtroEstadoI, userId, paginaI);

                    // Contar el número total de registros filtrados
                    int totalRegistros = incidenciaDao.contarIncidenciasFiltradas(textBuscarI, filtroFechaI, filtroTipoI, filtroEstadoI, userId);

                    // Calcular el número total de páginas
                    int totalPaginas = (int) Math.ceil((double) totalRegistros / 5); // Ajustado para 5 registros por página

                    // Enviar atributos al JSP
                    request.setAttribute("lista", incidencias);
                    request.setAttribute("paginaActual", paginaI);
                    request.setAttribute("totalPaginas", totalPaginas);
                    request.getRequestDispatcher("WEB-INF/Vecino/listaIncidencias_V.jsp").forward(request, response);
                }
                break;

            case "inscribirEvento":
                EventoB evento = eventoDao.buscarEventoPorId(request.getParameter("idEvento"));
                int idEvento = Integer.parseInt(request.getParameter("idEvento"));
                System.out.printf("iddd :" + idEvento);
                if (evento != null) {

                    if (evento.getCantDisponibles() > 0) {
                        boolean hayTraslape = eventoDao.hayTraslape(userId, idEvento);
                        if (!hayTraslape) {
                            boolean yaEstaInscrito = eventoDao.estaInscrito(userId, idEvento);
                            evento.setYaInscrito(String.valueOf(yaEstaInscrito));
                            if (!yaEstaInscrito) {
                                boolean success = eventoDao.inscribirUsuarioEvento(usuarioLogueado.getIdUsuario(), evento.getIdEvento());
                                if (success) {
                                    eventoDao.updateVacantesDisponibles(evento.getIdEvento());
                                    request.getSession().setAttribute("info", "Inscripción exitosa");
                                } else {
                                    request.getSession().setAttribute("err", "Error al inscribirse en el evento. Intente de nuevo más tarde.");
                                }
                            } else {
                                request.getSession().setAttribute("err", "Ya estás inscrito(a) en este evento");
                            }
                        } else{
                            request.getSession().setAttribute("err", "Estás inscrito en un evento que se superpone con este. Revisa las fechas de los eventos a los cuales te has inscrito");
                        }

                    } else {
                        request.getSession().setAttribute("err", "No hay cupos disponibles para este evento");
                    }

                } else {
                    request.getSession().setAttribute("err", "Usuario o evento no encontrado");
                }

                response.sendRedirect(request.getContextPath() + "/VecinoServlet?action=verEvento&idEvento=" + idEvento);
                break;

            case "contrasenaActual":
                String correo = request.getParameter("correo");
                String contrasenaActual = request.getParameter("contrasenaActual");
                if (usuarioLogueado != null) {
                    // Verificar si se proporcionó la contraseña actual
                    if (contrasenaActual == null || contrasenaActual.isEmpty() || correo == null || correo.isEmpty()) {
                        request.setAttribute("err", "Por favor, ingrese sus credenciales completas");
                        request.getRequestDispatcher("WEB-INF/Vecino/contrasenaActual.jsp").forward(request, response);
                        return;
                    } else {
                        if (usuarioDao.validarUsuarioPassword(correo, contrasenaActual)) {
                            session.setAttribute("success", "Validación exitosa, proceda a cambiar su contraseña");
                            //response.sendRedirect(request.getContextPath() + "/VecinoServlet?action=cambiarContrasena");
                            request.getRequestDispatcher("WEB-INF/Vecino/contrasenaActual.jsp").forward(request, response);
                        } else {
                            request.setAttribute("err", "Su correo o contraseña son inválidos");
                            request.getRequestDispatcher("WEB-INF/Vecino/contrasenaActual.jsp").forward(request, response);
                        }
                    }
                }
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
                } else if (!nuevaContrasena.matches("^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9]+$")) {
                    request.setAttribute("err", "La contraseña debe contener al menos un número y una letra, sin espacios ni caracteres especiales.");
                    request.getRequestDispatcher("WEB-INF/Vecino/cambioContrasena.jsp").forward(request, response);
                    return;
                } else if (!nuevaContrasena.equals(confirmarContrasena)) {
                    request.setAttribute("err", "Las contraseñas no coinciden.");
                    request.getRequestDispatcher("WEB-INF/Vecino/cambioContrasena.jsp").forward(request, response);
                    return;
                } else {

                    if (usuarioLogueado != null) {
                        String hashedPassword;
                        try {
                            hashedPassword = GeneraContrasena.hashPassword(nuevaContrasena);
                        } catch (NoSuchAlgorithmException e) {
                            throw new RuntimeException(e);
                        }
                        usuarioLogueado.setContrasenia(hashedPassword);

                        usuarioDao.actualizarContrasena(usuarioLogueado);
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
