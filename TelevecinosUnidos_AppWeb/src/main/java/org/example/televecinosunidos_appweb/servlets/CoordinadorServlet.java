package org.example.televecinosunidos_appweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import org.example.televecinosunidos_appweb.model.beans.*;
import org.example.televecinosunidos_appweb.model.daos.EventoDao;
import org.example.televecinosunidos_appweb.model.daos.IncidenCoordDao;
import org.example.televecinosunidos_appweb.model.daos.UsuarioDao;
import org.example.televecinosunidos_appweb.util.GeneraContrasena;

import java.io.IOException;
import java.io.InputStream;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;
@MultipartConfig
@WebServlet(name = "CoordinadorServlet", value = "/CoordinadorServlet")
public class CoordinadorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EventoDao eventoDao = new EventoDao();
        IncidenCoordDao incidenciaDao = new IncidenCoordDao();

        ArrayList<EventoB> listarEventosDisponibles = eventoDao.listarEventosDisponibles();
        String vista ="";
        String action = request.getParameter("action") == null ? "inicioCoordinador" : request.getParameter("action");
        HttpSession httpSession = request.getSession();
        UsuarioB usuarioLogged = (UsuarioB) httpSession.getAttribute("usuarioLogueado");

        UsuarioB usuarioLogueado = (UsuarioB) httpSession.getAttribute("usuarioLogueado");
        if (usuarioLogueado == null) {
            response.sendRedirect("/LoginServlet");
            return;
        }
        int userId = usuarioLogueado.getIdUsuario();
        int idTipoCoord = usuarioLogueado.getTipoCoordinador_idTipoCoordinador();
        switch (action) {
            //Inicio
            case "inicioCoordinador":
                ArrayList<IncidenciasB> listaIncidenciasRecientes = incidenciaDao.listarIncidenciaRecientes(userId);
                ArrayList<EventoB> listaEventospRropiosRecientes = eventoDao.listarEventosPropiosRecientes(userId,idTipoCoord);
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
                int idTipoEventoG = usuarioLogged.getTipoCoordinador_idTipoCoordinador();
                int paginaActualG = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
                int eventosPorPaginaG = 8; // Número de eventos por página

                // Obtener la lista completa de eventos
                ArrayList<EventoB> listaEventosGenerales = eventoDao.listarTodosEventosCoordinador(idTipoEventoG);

                // Calcular total de páginas
                int totalEventosG = listaEventosGenerales.size();
                int totalPaginasG = (int) Math.ceil((double) totalEventosG / eventosPorPaginaG);

                // Verificar si la página actual está fuera del rango o si no hay eventos
                if (totalEventosG == 0 || paginaActualG > totalPaginasG) {
                    paginaActualG = 1;
                }

                // Obtener los eventos de la página actual
                int desdeG = (paginaActualG - 1) * eventosPorPaginaG;
                int hastaG = Math.min(desdeG + eventosPorPaginaG, totalEventosG);
                ArrayList<EventoB> eventosPaginadosG = new ArrayList<>(listaEventosGenerales.subList(desdeG, hastaG));

                // Enviar atributos al JSP
                vista = "WEB-INF/Coordinadora/EventoGenerales_C.jsp";
                request.setAttribute("listaEventos", eventosPaginadosG);
                request.setAttribute("paginaActual", paginaActualG);
                request.setAttribute("totalPaginas", totalPaginasG);
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "lista":
                int idTipoEvento = usuarioLogged.getTipoCoordinador_idTipoCoordinador();
                int paginaActual = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
                int eventosPorPagina = 5; // Número de eventos por página

                // Obtener la lista completa de eventos
                ArrayList<EventoB> listaEventosPropios = eventoDao.listarEventosPropios(idTipoEvento,userId);

                // Calcular total de páginas
                int totalEventos = listaEventosPropios.size();
                int totalPaginas = (int) Math.ceil((double) totalEventos / eventosPorPagina);

                // Obtener los eventos de la página actual
                int desde = (paginaActual - 1) * eventosPorPagina;
                int hasta = Math.min(desde + eventosPorPagina, totalEventos);
                ArrayList<EventoB> eventosPaginados = new ArrayList<>(listaEventosPropios.subList(desde, hasta));

                // Enviar atributos al JSP
                vista = "WEB-INF/Coordinadora/ListaEvent-Coordinador.jsp";
                request.setAttribute("lista", eventosPaginados);
                request.setAttribute("paginaActual", paginaActual);
                request.setAttribute("totalPaginas", totalPaginas);
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "registrarAsistencia":
                vista = "WEB-INF/Coordinadora/registroAsistencia.jsp" ;

                request.setAttribute("lista", listarEventosDisponibles);
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "listaInscritos":
                vista = "WEB-INF/Coordinadora/listaInscritos.jsp";
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
                    response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=lista");
                    return;
                }
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "borrarEvento":
                String idBorrar = request.getParameter("idEvento");
                eventoDao.borrarEvento(Integer.parseInt(idBorrar));
                response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=lista");
                return;

            case "subirGaleria":
                int idTipoEvento1 = usuarioLogged.getTipoCoordinador_idTipoCoordinador();
                int paginaActual1 = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
                int eventosPorPagina1 = 5; // Número de eventos por página

                // Obtener la lista completa de eventos
                ArrayList<EventoB> listaEventosPropios1 = eventoDao.listarEventosPropiosFinalizado(idTipoEvento1,userId);

                // Calcular total de páginas
                int totalEventos1 = listaEventosPropios1.size();
                int totalPaginas1 = (int) Math.ceil((double) totalEventos1 / eventosPorPagina1);

                // Obtener los eventos de la página actual
                int desde1 = (paginaActual1 - 1) * eventosPorPagina1;
                int hasta1 = Math.min(desde1 + eventosPorPagina1, totalEventos1);
                ArrayList<EventoB> eventosPaginados1 = new ArrayList<>(listaEventosPropios1.subList(desde1, hasta1));

                // Enviar atributos al JSP
                vista = "WEB-INF/Coordinadora/subirGaleria.jsp";
                request.setAttribute("lista", eventosPaginados1);
                request.setAttribute("paginaActual", paginaActual1);
                request.setAttribute("totalPaginas", totalPaginas1);
                request.getRequestDispatcher(vista).forward(request, response);
                break;

            //Incidencia
            case "listarIncidencia":
                int paginaActualI = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
                int eventosPorPaginaI = 5; // Número de eventos por página
                ArrayList<IncidenciasB> listarIncidencia = incidenciaDao.listarIncidencia(userId);

                // Calcular total de páginas
                int totalEventosI = listarIncidencia.size();
                int totalPaginasI = (int) Math.ceil((double) totalEventosI / eventosPorPaginaI);

                // Verificar si la página actual está fuera del rango o si no hay eventos
                if (totalEventosI == 0 || paginaActualI > totalPaginasI) {
                    paginaActualI = 1;
                }

                // Obtener los eventos de la página actual
                int desdeI = (paginaActualI - 1) * eventosPorPaginaI;
                int hastaI = Math.min(desdeI + eventosPorPaginaI, totalEventosI);
                ArrayList<IncidenciasB> incidenciaPaginados = new ArrayList<>(listarIncidencia.subList(desdeI, hastaI));

                request.setAttribute("lista", incidenciaPaginados);
                request.setAttribute("paginaActual", paginaActualI);
                request.setAttribute("totalPaginas", totalPaginasI);
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
                    response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=listarIncidencia");
                }
                return;
            case "borrarIncidencia":
                String idd = request.getParameter("idIncidencia");
                System.out.println("ID a borrar: " + idd); // Log para verificar el ID
                try {
                    IncidenCoordDao.borrarIncidencia(idd,userId);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=listarIncidencia");
                break;

            //Preguntas Frecuentes
            case "preguntasFrecuentesC":
                vista = "WEB-INF/Coordinadora/preguntasFrecuentes_C.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "asistencia":
                int idEventoX = Integer.parseInt(request.getParameter("idEventoX"));
                ArrayList<AsistenciaCoordB> listaFechasEvento = eventoDao.listarFechasEvento(idEventoX);
                request.setAttribute("listaFechasEvento",listaFechasEvento);
                vista = "WEB-INF/Coordinadora/listaFechasEvento_C.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "contrasenaActual":
                vista = "WEB-INF/Coordinadora/contrasenaActual.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "cambiarContrasena":
                vista = "WEB-INF/Coordinadora/cambioContrasena.jsp";
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
        UsuarioDao usuarioDao = new UsuarioDao();
        String action = request.getParameter("action") == null ? "crear" : request.getParameter("action");
        HttpSession httpSession = request.getSession();
        UsuarioB usuarioLogged = (UsuarioB) httpSession.getAttribute("usuarioLogueado");

        if (usuarioLogged == null) {
            response.sendRedirect("/LoginServlet");
            return;
        }
        int userId = usuarioLogged.getIdUsuario();

        switch (action) {
            //Evento
            case "crear":
                try {
                    Map<String, String> erroresEvento = new HashMap<>();
                    String nombreEvento = request.getParameter("nombreEvento");
                    String descripcionEvento = request.getParameter("descripcionEvento");
                    String lugar = request.getParameter("lugar");
                    String idCoordinador = request.getParameter("idCoordinador");;
                    String idProfesor = request.getParameter("nombreProfesor");
                    String fecha_inicio = request.getParameter("fecha_inicio");
                    String fecha_fin = request.getParameter("fecha_fin");
                    String hora_inicio = request.getParameter("hora_inicio");
                    String hora_fin = request.getParameter("hora_fin");
                    String idFrecuencia = request.getParameter("frecuencia");
                    String idTipoEvento = request.getParameter("tipoCoordinador");
                    String opcionesDias = null;
                    if (idFrecuencia.equals("2")){
                        opcionesDias = request.getParameter("opcionesDias");
                    }else{
                        opcionesDias = request.getParameter("opcionesDias1");
                    }

                    String cantidadVacantes = request.getParameter("cantidadVacantes");
                    Part part = request.getPart("foto");
                    String fileName = part.getSubmittedFileName();
                    InputStream fileInputStream = part.getInputStream();

                    String materiales = request.getParameter("materiales");
                    //Validaciones
                    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                    DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");

                    LocalDate fechaInicio = LocalDate.parse(fecha_inicio, dateFormatter);
                    LocalDate fechaFin = LocalDate.parse(fecha_fin, dateFormatter);
                    LocalTime horaInicio = LocalTime.parse(hora_inicio, timeFormatter);
                    LocalTime horaFin = LocalTime.parse(hora_fin, timeFormatter);
                    LocalDate hoy = LocalDate.now();

                    if (idFrecuencia.equals("2")){
                        opcionesDias = request.getParameter("opcionesDias");
                    }else if (idFrecuencia.equals("1")){
                        opcionesDias = request.getParameter("opcionesDias1");
                    }else{
                        opcionesDias="Domingo";
                        erroresEvento.put("errorFrecuencia", "Error: Seleccione una frecuencia");
                    }
                    if (fechaInicio.isBefore(hoy)) {
                        erroresEvento.put("fechaInicio", "Error: la fecha de inicio no puede ser antes de hoy");
                        // Error: la fecha de inicio no puede ser antes de hoy
                    }

                    if (fechaFin.isBefore(fechaInicio)) {
                        erroresEvento.put("fechaFin", "Error: la fecha de finalización no puede ser antes de la fecha de inicio");
                        // Error: la fecha de finalización no puede ser antes de la fecha de inicio
                    }
                    LocalTime treintaMinutosDespues = horaInicio.plusMinutes(30);
                    if (horaFin.isBefore(treintaMinutosDespues)) {
                        erroresEvento.put("horaFin30Min", "Error: la hora de finalización debe ser al menos 30 minutos después de la hora de inicio.");
                    }
                    DayOfWeek dayOfWeekInicio = fechaInicio.getDayOfWeek();
                    DayOfWeek dayOfWeekFin = fechaFin.getDayOfWeek();

                    String diaInicioEsperado = opcionesDias.split("-")[0];  // "Lunes" en "Lunes-Miércoles"
                    String diaFinEsperado = opcionesDias.contains("-") ? opcionesDias.split("-")[1] : diaInicioEsperado; // "Miércoles" en "Lunes-Miércoles", o "Lunes" en "Lunes"
                    String diaInicio = null;
                    String diaFin = null;
                    switch (diaInicioEsperado){
                        case "Lunes":
                            diaInicio = "MONDAY";
                            break;
                        case "Martes":
                            diaInicio = "TUESDAY";
                            break;
                        case "Miércoles":
                            diaInicio = "WEDNESDAY";
                            break;
                        case "Jueves":
                            diaInicio = "THURSDAY";
                            break;
                        case "Viernes":
                            diaInicio = "FRIDAY";
                            break;
                    }
                    switch (diaFinEsperado){
                        case "Lunes":
                            diaFin = "MONDAY";
                            break;
                        case "Martes":
                            diaFin = "TUESDAY";
                            break;
                        case "Miércoles":
                            diaFin = "WEDNESDAY";
                            break;
                        case "Jueves":
                            diaFin = "THURSDAY";
                            break;
                        case "Viernes":
                            diaFin = "FRIDAY";
                            break;
                    }

                    if (!dayOfWeekInicio.toString().equals(diaInicio)) {
                        erroresEvento.put("errorFechaInicio", "Error: la fecha de inicio no coincide con el día esperado");
                        // Error: la fecha de inicio no coincide con el día esperado
                    }

                    if (!dayOfWeekFin.toString().equals(diaFin)) {
                        erroresEvento.put("errorFechaFin", "Error: la fecha de fin no coincide con el día esperado");
                        // Error: la fecha de fin no coincide con el día esperado
                    }
                    if (horaInicio.isAfter(horaFin)) {
                        erroresEvento.put("errorHoraFin", "Error: la hora de inicio no puede ser después de la hora de fin");
                        // Error: la hora de inicio no puede ser después de la hora de fin
                    }

                    if (!erroresEvento.isEmpty()) {
                        ArrayList<ProfesoresEvento> listaProfesores = eventoDao.listarProfesores();
                        request.setAttribute("lista", listaProfesores);
                        request.setAttribute("erroresEvento", erroresEvento);
                        request.setAttribute("nombreEvento", nombreEvento);
                        request.setAttribute("descripcionEvento", descripcionEvento);
                        request.setAttribute("lugar", lugar);
                        request.setAttribute("nombreProfesor", idProfesor);
                        request.setAttribute("frecuencia", idFrecuencia);
                        request.setAttribute("fecha_inicio", fecha_inicio);
                        request.setAttribute("fecha_fin", fecha_fin);
                        request.setAttribute("hora_inicio", hora_inicio);
                        request.setAttribute("hora_fin", hora_fin);
                        request.setAttribute("cantidadVacantes", cantidadVacantes);
                        request.setAttribute("materiales", materiales);

                        String NO= "NO";
                        if (idFrecuencia.equals("2")){
                            request.setAttribute("opcionesDias", opcionesDias);
                            request.setAttribute("opcionesDias1", NO);
                        }else{
                            request.setAttribute("opcionesDias", NO);
                            request.setAttribute("opcionesDias1", opcionesDias);
                        }
                        request.getRequestDispatcher("WEB-INF/Coordinadora/creacionEvento.jsp").forward(request, response);
                        return;
                    } else {
                        // 1. Verificar traslape de eventos ANTES de crear el evento
                        DateTimeFormatter dateFormatter1 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                        DateTimeFormatter timeFormatter1 = DateTimeFormatter.ofPattern("HH:mm:ss");

                        String fechaInicioStr = fechaInicio.format(dateFormatter1);
                        String fechaFinStr = fechaFin.format(dateFormatter1);
                        String horaInicioStr = horaInicio.format(timeFormatter1);
                        String horaFinStr = horaFin.format(timeFormatter1);

                        int idEvento1 = -1;
                        boolean hayTraslape = eventoDao.hayTraslapeCoordinador(usuarioLogged.getIdUsuario(), idEvento1, fechaInicioStr, fechaFinStr, horaInicioStr, horaFinStr, Integer.parseInt(idFrecuencia));
                        if (hayTraslape) {
                            request.getSession().setAttribute("err", "Error: Ya existe un evento propio programado en el mismo horario.");
                            ArrayList<ProfesoresEvento> listaProfesores = eventoDao.listarProfesores();
                            request.setAttribute("lista", listaProfesores);
                            request.setAttribute("erroresEvento", erroresEvento);
                            request.setAttribute("nombreEvento", nombreEvento);
                            request.setAttribute("descripcionEvento", descripcionEvento);
                            request.setAttribute("lugar", lugar);
                            request.setAttribute("nombreProfesor", idProfesor);
                            request.setAttribute("frecuencia", idFrecuencia);
                            request.setAttribute("fecha_inicio", fecha_inicio);
                            request.setAttribute("fecha_fin", fecha_fin);
                            request.setAttribute("hora_inicio", hora_inicio);
                            request.setAttribute("hora_fin", hora_fin);
                            request.setAttribute("cantidadVacantes", cantidadVacantes);
                            request.setAttribute("materiales", materiales);

                            String NO= "NO";
                            if (idFrecuencia.equals("2")){
                                request.setAttribute("opcionesDias", opcionesDias);
                                request.setAttribute("opcionesDias1", NO);
                            }else{
                                request.setAttribute("opcionesDias", NO);
                                request.setAttribute("opcionesDias1", opcionesDias);
                            }
                            request.getRequestDispatcher("WEB-INF/Coordinadora/creacionEvento.jsp").forward(request, response);
                            return;
                        }

                        boolean hayTraslapeProfesor = eventoDao.hayTraslapeProfesor(Integer.parseInt(idProfesor), fechaInicioStr, fechaFinStr, horaInicioStr, horaFinStr);
                        if (hayTraslapeProfesor) {
                            request.getSession().setAttribute("err", "Error: El profesor ya tiene otro evento programado en el mismo horario.");
                            ArrayList<ProfesoresEvento> listaProfesores = eventoDao.listarProfesores();
                            request.setAttribute("lista", listaProfesores);
                            request.setAttribute("erroresEvento", erroresEvento);
                            request.setAttribute("nombreEvento", nombreEvento);
                            request.setAttribute("descripcionEvento", descripcionEvento);
                            request.setAttribute("lugar", lugar);
                            request.setAttribute("nombreProfesor", idProfesor);
                            request.setAttribute("frecuencia", idFrecuencia);
                            request.setAttribute("fecha_inicio", fecha_inicio);
                            request.setAttribute("fecha_fin", fecha_fin);
                            request.setAttribute("hora_inicio", hora_inicio);
                            request.setAttribute("hora_fin", hora_fin);
                            request.setAttribute("cantidadVacantes", cantidadVacantes);
                            request.setAttribute("materiales", materiales);

                            String NO= "NO";
                            if (idFrecuencia.equals("2")){
                                request.setAttribute("opcionesDias", opcionesDias);
                                request.setAttribute("opcionesDias1", NO);
                            }else{
                                request.setAttribute("opcionesDias", NO);
                                request.setAttribute("opcionesDias1", opcionesDias);
                            }
                            request.getRequestDispatcher("WEB-INF/Coordinadora/creacionEvento.jsp").forward(request, response);
                            return;
                        }

                        // 2. Crear el evento si no hay traslapes
                        EventoB eventoB0 = new EventoB();
                        eventoB0.setFoto(fileInputStream);
                        eventoB0.setNombre(nombreEvento);
                        eventoB0.setTipoEvento_idTipoEvento(Integer.parseInt(idTipoEvento));
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
                        eventoB0.setListaMateriales(materiales);
                        eventoB0.setNombreFoto(fileName);
                        eventoDao.crearEvento(eventoB0);

                        // 3. Redirigir o mostrar un mensaje de éxito
                        request.getSession().setAttribute("success", "Evento creado exitosamente.");
                        response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=lista");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;

            case "editar":
                try {
                    Map<String, String> erroresEvento2 = new HashMap<>();
                    EventoB evento = eventoDao.buscarEventoPorId(request.getParameter("idEvento"));
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
                    Part part2 = request.getPart("foto");
                    String fileName2 = part2.getSubmittedFileName();
                    InputStream fileInputStream2 = part2.getInputStream();
                    String listaMateriales2 = request.getParameter("listaMateriales");
                    String idTipoEvento2 = request.getParameter("tipoCoordinador");
                    String idProfesor2 = request.getParameter("ProfesoresEvento_idProfesoresEvento");

                    int ProfesoresEvento_idProfesoresEvento2 = Integer.parseInt(request.getParameter("ProfesoresEvento_idProfesoresEvento"));
                    String opcionesDias2 = null;
                    //Validaciones
                    if (frecuencia2.equals("2")){
                        opcionesDias2 = request.getParameter("opcionesDias");
                    }else if (frecuencia2.equals("1")){
                        opcionesDias2 = request.getParameter("opcionesDias1");
                    }else{
                        opcionesDias2="Domingo";
                        erroresEvento2.put("errorFrecuencia", "Error: Seleccione una frecuencia");
                    }

                    if (cantidadVacantes2<evento.getCantidadVacantes()){
                        erroresEvento2.put("errorVacantes","Error: La cantidad de vacantes no debe disminuir");
                    }

                    DateTimeFormatter dateFormatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                    DateTimeFormatter timeFormatter2 = DateTimeFormatter.ofPattern("HH:mm[:ss]");

                    LocalDate fechaInicio2 = LocalDate.parse(fecha_inicio2, dateFormatter2);
                    LocalDate fechaFin2 = LocalDate.parse(fecha_fin2, dateFormatter2);
                    LocalTime horaInicio2 = LocalTime.parse(hora_inicio2, timeFormatter2);
                    LocalTime horaFin2 = LocalTime.parse(hora_fin2, timeFormatter2);
                    LocalDate hoy2 = LocalDate.now();

                    if (fechaInicio2.isBefore(hoy2)) {
                        erroresEvento2.put("fechaInicio", "Error: la fecha de inicio no puede ser antes de hoy");
                        // Error: la fecha de inicio no puede ser antes de hoy
                    }

                    if (fechaFin2.isBefore(fechaInicio2)) {
                        erroresEvento2.put("fechaFin", "Error: la fecha de finalización no puede ser antes de la fecha de inicio");
                        // Error: la fecha de finalización no puede ser antes de la fecha de inicio
                    }

                    DayOfWeek dayOfWeekInicio2 = fechaInicio2.getDayOfWeek();
                    DayOfWeek dayOfWeekFin2 = fechaFin2.getDayOfWeek();

                    String diaInicioEsperado2 = opcionesDias2.split("-")[0];  // "Lunes" en "Lunes-Miércoles"
                    String diaFinEsperado2 = opcionesDias2.contains("-") ? opcionesDias2.split("-")[1] : diaInicioEsperado2; // "Miércoles" en "Lunes-Miércoles", o "Lunes" en "Lunes"
                    String diaInicio2 = null;
                    String diaFin2 = null;
                    switch (diaInicioEsperado2){
                        case "Lunes":
                            diaInicio2 = "MONDAY";
                            break;
                        case "Martes":
                            diaInicio2 = "TUESDAY";
                            break;
                        case "Miércoles":
                            diaInicio2 = "WEDNESDAY";
                            break;
                        case "Jueves":
                            diaInicio2 = "THURSDAY";
                            break;
                        case "Viernes":
                            diaInicio2 = "FRIDAY";
                            break;
                    }
                    switch (diaFinEsperado2){
                        case "Lunes":
                            diaFin2 = "MONDAY";
                            break;
                        case "Martes":
                            diaFin2 = "TUESDAY";
                            break;
                        case "Miércoles":
                            diaFin2 = "WEDNESDAY";
                            break;
                        case "Jueves":
                            diaFin2 = "THURSDAY";
                            break;
                        case "Viernes":
                            diaFin2 = "FRIDAY";
                            break;
                    }

                    if (!dayOfWeekInicio2.toString().equals(diaInicio2)) {
                        erroresEvento2.put("errorFechaInicio", "Error: la fecha de inicio no coincide con el día esperado");
                        // Error: la fecha de inicio no coincide con el día esperado
                    }

                    if (!dayOfWeekFin2.toString().equals(diaFin2)) {
                        erroresEvento2.put("errorFechaFin", "Error: la fecha de fin no coincide con el día esperado");
                        // Error: la fecha de fin no coincide con el día esperado
                    }
                    if (horaInicio2.isAfter(horaFin2)) {
                        erroresEvento2.put("errorHoraFin", "Error: la hora de inicio no puede ser después de la hora de fin");
                        // Error: la hora de inicio no puede ser después de la hora de fin
                    }
                    LocalTime treintaMinutosDespues2 = horaInicio2.plusMinutes(30);
                    if (horaFin2.isBefore(treintaMinutosDespues2)) {
                        erroresEvento2.put("horaFin30Min", "Error: la hora de finalización debe ser al menos 30 minutos después de la hora de inicio.");
                    }

                    if (!erroresEvento2.isEmpty()) {
                        ArrayList<ProfesoresEvento> listaProfesores = eventoDao.listarProfesores();
                        request.setAttribute("eventoB", evento);
                        request.setAttribute("lista", listaProfesores);
                        request.setAttribute("erroresEvento", erroresEvento2);
                        request.setAttribute("nombreEvento", nombre);
                        request.setAttribute("descripcionEvento", descripcion);
                        request.setAttribute("lugar", lugar2);
                        request.setAttribute("nombreProfesor", idProfesor2);
                        request.setAttribute("frecuencia", frecuencia2);
                        request.setAttribute("fecha_inicio", fecha_inicio2);
                        request.setAttribute("fecha_fin", fecha_fin2);
                        request.setAttribute("hora_inicio", hora_inicio2);
                        request.setAttribute("hora_fin", hora_fin2);
                        request.setAttribute("cantVacantes", String.valueOf(cantidadVacantes2));
                        request.setAttribute("materiales", listaMateriales2);

                        String NO= "NO";
                        if (frecuencia2.equals("2")){
                            request.setAttribute("opcionesDias", opcionesDias2);
                            request.setAttribute("opcionesDias1", NO);
                        }else{
                            request.setAttribute("opcionesDias", NO);
                            request.setAttribute("opcionesDias1", opcionesDias2);
                        }
                        request.getRequestDispatcher("WEB-INF/Coordinadora/editarEvento.jsp").forward(request, response);
                        return;
                    } else {
                        // 1. Verificar traslape de eventos ANTES de crear el evento
                        DateTimeFormatter dateFormatter3 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                        DateTimeFormatter timeFormatter3 = DateTimeFormatter.ofPattern("HH:mm:ss");

                        String fechaInicioStr2 = fechaInicio2.format(dateFormatter3);
                        String fechaFinStr2 = fechaFin2.format(dateFormatter3);
                        String horaInicioStr2 = horaInicio2.format(timeFormatter3);
                        String horaFinStr2 = horaFin2.format(timeFormatter3);

                        boolean hayTraslape2 = eventoDao.hayTraslapeCoordinador(usuarioLogged.getIdUsuario(), idEvento, fechaInicioStr2, fechaFinStr2, horaInicioStr2, horaFinStr2, Integer.parseInt(frecuencia2));
                        if (hayTraslape2) {
                            request.setAttribute("err", "Ya existe un evento con fechas y horas que se superponen.");
                            request.setAttribute("eventoB", evento);
                            ArrayList<ProfesoresEvento> listaProfesores = eventoDao.listarProfesores();
                            request.setAttribute("lista", listaProfesores);
                            request.setAttribute("erroresEvento", erroresEvento2);
                            request.setAttribute("nombreEvento", nombre);
                            request.setAttribute("descripcionEvento", descripcion);
                            request.setAttribute("lugar", lugar2);
                            request.setAttribute("nombreProfesor", idProfesor2);
                            request.setAttribute("frecuencia", frecuencia2);
                            request.setAttribute("fecha_inicio", fecha_inicio2);
                            request.setAttribute("fecha_fin", fecha_fin2);
                            request.setAttribute("hora_inicio", hora_inicio2);
                            request.setAttribute("hora_fin", hora_fin2);
                            request.setAttribute("cantVacantes", String.valueOf(cantidadVacantes2));
                            request.setAttribute("materiales", listaMateriales2);

                            String NO= "NO";
                            if (frecuencia2.equals("2")){
                                request.setAttribute("opcionesDias", opcionesDias2);
                                request.setAttribute("opcionesDias1", NO);
                            }else{
                                request.setAttribute("opcionesDias", NO);
                                request.setAttribute("opcionesDias1", opcionesDias2);
                            }
                            request.getRequestDispatcher("WEB-INF/Coordinadora/editarEvento.jsp").forward(request, response);
                            return;
                        }

                        boolean hayTraslapeProfesor2 = eventoDao.hayTraslapeProfesor(Integer.parseInt(idProfesor2), fechaInicioStr2, fechaFinStr2, horaInicioStr2, horaFinStr2);
                        if (hayTraslapeProfesor2) {
                            request.setAttribute("err", "Ya existe un evento con fechas y horas que se superponen.");
                            request.setAttribute("eventoB", evento);
                            ArrayList<ProfesoresEvento> listaProfesores = eventoDao.listarProfesores();
                            request.setAttribute("lista", listaProfesores);
                            request.setAttribute("erroresEvento", erroresEvento2);
                            request.setAttribute("nombreEvento", nombre);
                            request.setAttribute("descripcionEvento", descripcion);
                            request.setAttribute("lugar", lugar2);
                            request.setAttribute("nombreProfesor", idProfesor2);
                            request.setAttribute("frecuencia", frecuencia2);
                            request.setAttribute("fecha_inicio", fecha_inicio2);
                            request.setAttribute("fecha_fin", fecha_fin2);
                            request.setAttribute("hora_inicio", hora_inicio2);
                            request.setAttribute("hora_fin", hora_fin2);
                            request.setAttribute("cantVacantes", String.valueOf(cantidadVacantes2));
                            request.setAttribute("materiales", listaMateriales2);

                            String NO= "NO";
                            if (frecuencia2.equals("2")){
                                request.setAttribute("opcionesDias", opcionesDias2);
                                request.setAttribute("opcionesDias1", NO);
                            }else{
                                request.setAttribute("opcionesDias", NO);
                                request.setAttribute("opcionesDias1", opcionesDias2);
                            }
                            request.getRequestDispatcher("WEB-INF/Coordinadora/editarEvento.jsp").forward(request, response);
                            return;
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
                        if (fileName2 == null || fileName2.isEmpty()){
                            eventoB.setFoto(evento.getFoto());
                            eventoB.setNombreFoto(evento.getNombreFoto());
                        }else {
                            eventoB.setNombreFoto(fileName2);
                            eventoB.setFoto(fileInputStream2);
                        }
                        int EventFrecuencia_idEventFrecuencia2 = Integer.parseInt(request.getParameter("frecuencia"));
                        eventoB.setListaMateriales(listaMateriales2);
                        eventoB.setEventFrecuencia_idEventFrecuencia(EventFrecuencia_idEventFrecuencia2);
                        eventoB.setProfesoresEvento_idProfesoresEvento(ProfesoresEvento_idProfesoresEvento2);
                        eventoB.setDiaEvento(opcionesDias2);
                        eventoB.setHora_inicio(hora_inicio2);
                        eventoB.setHora_fin(hora_fin2);

                        eventoDao.eliminarFechasEventoPorIdEvento(idEvento);
                        eventoDao.eliminarFechasAsistencia(idEvento);
                        eventoDao.actualizarEvento(eventoB);
                        eventoDao.updateVacantesDisponibles(eventoB.getIdEvento());
                        // Agregar mensaje a la sesión
                        request.getSession().setAttribute("info", "Evento editado de manera exitosa");
                        response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=lista");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            //Filtros
            case "buscarEventoPorNombre":
                String textBuscar = request.getParameter("textoBuscarEvento");
                String filtroFrecuencia = request.getParameter("frecuencia");
                String filtroEstado = request.getParameter("estado");
                String filtroFecha = request.getParameter("fecha");
                int pagina = request.getParameter("pagina") != null ? Integer.parseInt(request.getParameter("pagina")) : 1;

                if (textBuscar == null && filtroFrecuencia == null && filtroEstado == null && filtroFecha==null) {
                    response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=lista");
                } else {
                    request.setAttribute("textoBuscarEvento", textBuscar);
                    request.setAttribute("frecuencia", filtroFrecuencia);
                    request.setAttribute("estado", filtroEstado);
                    request.setAttribute("fecha", filtroFecha);
                    ArrayList<EventoB> eventos = eventoDao.listarEventoFiltro(textBuscar, filtroFecha,filtroFrecuencia, filtroEstado, usuarioLogged.getTipoCoordinador_idTipoCoordinador(), pagina);
                    int totalRegistros = eventoDao.contarEventosFiltrados(textBuscar, filtroFecha,filtroFrecuencia, filtroEstado, usuarioLogged.getTipoCoordinador_idTipoCoordinador()); // Método adicional para contar total de registros
                    int totalPaginas = (int) Math.ceil((double) totalRegistros / 5); // Ajustado para 5 registros por página

                    request.setAttribute("lista", eventos);
                    request.setAttribute("paginaActual", pagina);
                    request.setAttribute("totalPaginas", totalPaginas);
                    request.getRequestDispatcher("WEB-INF/Coordinadora/ListaEvent-Coordinador.jsp").forward(request, response);
                }
                break;
            case "buscarEvento":
                String textBuscarG = request.getParameter("textoBuscarEventoG");
                String filtroFechaG = request.getParameter("fechaG");
                String filtroFrecuenciaG = request.getParameter("frecuenciaG");
                String filtroEstadoG = request.getParameter("estadoG");
                int paginaG = request.getParameter("pagina") != null ? Integer.parseInt(request.getParameter("pagina")) : 1;

                if (textBuscarG == null && filtroFechaG == null && filtroFrecuenciaG == null && filtroEstadoG == null) {
                    response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=eventoGeneralesC");
                } else {
                    request.setAttribute("textoBuscarEventoG", textBuscarG);
                    request.setAttribute("fechaG", filtroFechaG);
                    request.setAttribute("frecuenciaG", filtroFrecuenciaG);
                    request.setAttribute("estadoG", filtroEstadoG);

                    ArrayList<EventoB> eventos = eventoDao.ListaEventoGeneralesFiltro(textBuscarG, filtroFechaG, filtroFrecuenciaG, filtroEstadoG, usuarioLogged.getTipoCoordinador_idTipoCoordinador(), paginaG);
                    int totalRegistros = eventoDao.contarEventosGeneralesFiltrados(textBuscarG, filtroFechaG, filtroFrecuenciaG, filtroEstadoG, usuarioLogged.getTipoCoordinador_idTipoCoordinador());
                    int totalPaginas = (int) Math.ceil((double) totalRegistros / 8);

                    request.setAttribute("listaEventos", eventos);
                    request.setAttribute("paginaActual", paginaG);
                    request.setAttribute("totalPaginas", totalPaginas);
                    request.getRequestDispatcher("WEB-INF/Coordinadora/EventoGenerales_C.jsp").forward(request, response);
                }
                break;
            case "buscarEventoFinalizado":
                String textBuscarGaleria = request.getParameter("textoBuscarEvento");
                String filtroFechaGaleria = request.getParameter("fecha");
                String filtroFrecuenciaGaleria = request.getParameter("frecuencia");
                int paginaGaleria = request.getParameter("pagina") != null ? Integer.parseInt(request.getParameter("pagina")) : 1;

                if(textBuscarGaleria== null && filtroFechaGaleria==null && filtroFrecuenciaGaleria==null){
                    response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=subirGaleria");
                }else {
                    request.setAttribute("textoBuscarEvento", textBuscarGaleria);
                    request.setAttribute("fecha", filtroFechaGaleria);
                    request.setAttribute("frecuencia", filtroFrecuenciaGaleria);

                    ArrayList<EventoB> eventosfinalizados = eventoDao.listarEventosFinalizadosFiltro(textBuscarGaleria,filtroFechaGaleria,filtroFrecuenciaGaleria,userId, paginaGaleria);
                    int totalRegistros = eventoDao.contarEventosFinalizadosFiltrados(textBuscarGaleria, filtroFechaGaleria,filtroFrecuenciaGaleria, userId);
                    int totalPaginas = (int) Math.ceil((double) totalRegistros / 5); // Ajustado para 5 registros por página

                    request.setAttribute("lista", eventosfinalizados);
                    request.setAttribute("paginaActual", paginaGaleria);
                    request.setAttribute("totalPaginas", totalPaginas);
                    request.getRequestDispatcher("WEB-INF/Coordinadora/subirGaleria.jsp").forward(request, response);
                }
                break;


            //Incidencia

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

                Part part3 = request.getPart("foto");
                String fileName3 = part3.getSubmittedFileName();
                InputStream fileInputStream3 = part3.getInputStream();

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
                    request.setAttribute("foto",part3);
                    request.setAttribute("tipoIncidencia", tipoIncidencia);
                    request.setAttribute("urbanizacion", urbanizacion);
                    request.setAttribute("incidenciaPersonal", incidenciaPersonalStr);
                    request.setAttribute("lugarExacto", lugarExacto);
                    request.setAttribute("referencia", referencia);
                    request.setAttribute("numeroContacto", numeroContacto);
                    request.setAttribute("ambulancia", ambulanciaStr);
                    request.setAttribute("nombreFoto", fileName3);
                    request.getRequestDispatcher("WEB-INF/Coordinadora/generarIncidencia_C.jsp").forward(request, response);
                    return;
                }

                int incidenciaPersonal = Integer.parseInt(incidenciaPersonalStr);
                int ambulancia = Integer.parseInt(ambulanciaStr);

                IncidenciasB incidencia = new IncidenciasB();
                incidencia.setNombreIncidencia(nombreIncidencia);
                incidencia.setFoto(fileInputStream3);
                incidencia.setTipoIncidencia(tipoIncidencia);
                incidencia.setUrbanizacion(urbanizacion);
                incidencia.setIncidenciaPersonal(incidenciaPersonal);
                incidencia.setLugarExacto(lugarExacto);
                incidencia.setReferencia(referencia);
                incidencia.setNumeroContacto(numeroContacto);
                incidencia.setAmbulancia(ambulancia);
                incidencia.setNombreFoto(fileName3);
                incidenciaDao.generarIncidenciaC(incidencia,userId);
                // Agregar mensaje a la sesión
                request.getSession().setAttribute("info", "Incidencia creada de manera exitosa");

                // Redirigir a la lista de incidencias
                response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=listarIncidencia");
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

                Part part4 = request.getPart("foto");
                String fileName4 = part4.getSubmittedFileName();
                InputStream fileInputStream4 = part4.getInputStream();

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
                    request.setAttribute("foto", part4);
                    request.setAttribute("tipoIncidencia2", tipoIncidencia2);
                    request.setAttribute("urbanizacion2", urbanizacion2);
                    request.setAttribute("incidenciaPersonal2", incidenciaPersonalStr2);
                    request.setAttribute("lugarExacto2", lugarExacto2);
                    request.setAttribute("referencia2", referencia2);
                    request.setAttribute("numeroContacto2", numeroContacto2);
                    request.setAttribute("ambulancia2", ambulanciaStr2);
                    request.setAttribute("nombreFoto", fileName4);

                    request.setAttribute("incidenciaB", incidencia2);

                    request.getRequestDispatcher("WEB-INF/Coordinadora/actualizarIncidencia_C.jsp").forward(request, response);
                    return;
                }

                int incidenciaPersonal2 = Integer.parseInt(incidenciaPersonalStr2);
                int ambulancia2 = Integer.parseInt(ambulanciaStr2);

                IncidenciasB incidenciaB = new IncidenciasB();
                incidenciaB.setIdIncidencias(id);
                incidenciaB.setNombreIncidencia(nombreIncidencia2);
                if (fileName4 == null || fileName4.isEmpty()){
                    incidenciaB.setFoto(incidencia2.getFoto());
                    incidenciaB.setNombreFoto(incidencia2.getNombreFoto());
                }else {
                    incidenciaB.setNombreFoto(fileName4);
                    incidenciaB.setFoto(fileInputStream4);
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
                response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=listarIncidencia");
                break;

            case "buscarIncidenciaPorNombre":
                String textBuscarI = request.getParameter("textoBuscarIncidencia");
                String filtroFechaI = request.getParameter("fecha");
                String filtroTipo = request.getParameter("tipo");
                String filtroEstadoI = request.getParameter("estado");
                int paginaI = request.getParameter("pagina") != null ? Integer.parseInt(request.getParameter("pagina")) : 1;

                if (textBuscarI == null && filtroFechaI == null && filtroTipo == null && filtroEstadoI == null) {
                    response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=listarIncidencia");
                } else {
                    request.setAttribute("textoBuscarIncidencia", textBuscarI);
                    request.setAttribute("fecha", filtroFechaI);
                    request.setAttribute("tipo", filtroTipo);
                    request.setAttribute("estado", filtroEstadoI);

                    ArrayList<IncidenciasB> incidencias = incidenciaDao.listarIncidenciasFiltro(textBuscarI, filtroFechaI, filtroTipo, filtroEstadoI, userId, paginaI);
                    int totalRegistrosI = incidenciaDao.contarIncidenciasFiltradas(textBuscarI, filtroFechaI, filtroTipo, filtroEstadoI, userId);
                    int totalPaginasI = (int) Math.ceil((double) totalRegistrosI / 5); // Ajustado para 5 registros por página

                    request.setAttribute("lista", incidencias);
                    request.setAttribute("paginaActual", paginaI);
                    request.setAttribute("totalPaginas", totalPaginasI);
                    request.getRequestDispatcher("WEB-INF/Coordinadora/listaIncidencias_C.jsp").forward(request, response);
                }
                break;
            case "subirGaleria": //Galeria para subir fotos
                try {
                    int idEvento6 = Integer.parseInt(request.getParameter("idEvento"));
                    Map<String, String> nombresFotos = new HashMap<>();
                    boolean galeriaExiste = eventoDao.verificarExistenciaGaleria(idEvento6);

                    for (int i = 1; i <= 3; i++) {
                        Part part6 = request.getPart("foto" + i);
                        if (part6 != null && part6.getSize() > 0) {
                            String fileName6 = part6.getSubmittedFileName();
                            nombresFotos.put("nombreFoto" + i, fileName6);
                            try (InputStream fileContent6 = part6.getInputStream()) {
                                eventoDao.guardarFoto(idEvento6, fileName6, fileContent6, i);
                            }
                        } else {
                            nombresFotos.put("nombreFoto" + i, null);
                        }
                    }
                    request.getSession().setAttribute("info", "Fotos cargadas exitosamente.");
                    response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=subirGaleria");
                } catch (Exception e) {
                    request.getSession().setAttribute("error", "Error al cargar las fotos: " + e.getMessage());
                    response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=subirGaleria");
                }
                break;

            case "contrasenaActual":
                String correo = request.getParameter("correo");
                String contrasenaActual = request.getParameter("contrasenaActual");
                if (usuarioLogged != null) {
                    // Verificar si se proporcionó la contraseña actual
                    if (contrasenaActual == null || contrasenaActual.isEmpty() || correo == null || correo.isEmpty()) {
                        request.setAttribute("err", "Por favor, ingrese sus credenciales completas");
                        request.getRequestDispatcher("WEB-INF/Coordinadora/contrasenaActual.jsp").forward(request, response);
                        return;
                    } else {
                        if (usuarioDao.validarUsuarioPassword(correo, contrasenaActual)) {
                            httpSession.setAttribute("success", "Validación exitosa, proceda a cambiar su contraseña");
                            //response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=cambiarContrasena");
                            request.getRequestDispatcher("WEB-INF/Coordinadora/contrasenaActual.jsp").forward(request, response);
                        } else {
                            request.setAttribute("err", "Su correo o contraseña son inválidos");
                            request.getRequestDispatcher("WEB-INF/Coordinadora/contrasenaActual.jsp").forward(request, response);
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
                    request.getRequestDispatcher("WEB-INF/Coordinadora/cambioContrasena.jsp").forward(request, response);
                    return;
                } else if (nuevaContrasena.length() < 8) {
                    request.setAttribute("err", "La contraseña debe tener al menos 8 caracteres.");
                    request.getRequestDispatcher("WEB-INF/Coordinadora/cambioContrasena.jsp").forward(request, response);
                    return;
                } else if (!nuevaContrasena.matches("^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9]+$")) {
                    request.setAttribute("err", "La contraseña debe contener al menos un número y una letra, sin espacios ni caracteres especiales.");
                    request.getRequestDispatcher("WEB-INF/Coordinadora/cambioContrasena.jsp").forward(request, response);
                    return;
                } else if (!nuevaContrasena.equals(confirmarContrasena)) {
                    request.setAttribute("err", "Las contraseñas no coinciden.");
                    request.getRequestDispatcher("WEB-INF/Coordinadora/cambioContrasena.jsp").forward(request, response);
                    return;
                } else {

                    if (usuarioLogged != null) {
                        String hashedPassword;
                        try {
                            hashedPassword = GeneraContrasena.hashPassword(nuevaContrasena);
                        } catch (NoSuchAlgorithmException e) {
                            throw new RuntimeException(e);
                        }
                        usuarioLogged.setContrasenia(hashedPassword);

                        usuarioDao.actualizarContrasena(usuarioLogged);
                        httpSession.setAttribute("success", "Contraseña cambiada exitosamente");
                        response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=cambiarContrasena");
                    } else {
                        request.setAttribute("err", "Usuario no encontrado en la sesión.");
                        request.getRequestDispatcher("WEB-INF/Coordinadora/cambioContrasena.jsp").forward(request, response);
                    }
                }
                break;
            case "marcarHoraEntrada":
                LocalTime timeNow = LocalTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
                String formattedTime = timeNow.format(formatter);
                int x = 3;
                int idAsistencia = Integer.parseInt(request.getParameter("idAsistencia"));
                try {
                    eventoDao.marcarHoraEntrada(idAsistencia,formattedTime);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "marcarHoraSalida":
                LocalTime timeNow2 = LocalTime.now();
                DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("HH:mm:ss");
                String formattedTime2 = timeNow2.format(formatter2);
                int idAsistencia2 = Integer.parseInt(request.getParameter("idAsistencia"));
                try {
                    eventoDao.marcarHoraSalida(idAsistencia2,formattedTime2);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/CoordinadorServlet");
                break;

        }
    }
}
