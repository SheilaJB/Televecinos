package org.example.televecinosunidos_appweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.televecinosunidos_appweb.model.beans.EventoB;
import org.example.televecinosunidos_appweb.model.beans.IncidenciasB;
import org.example.televecinosunidos_appweb.model.daos.*;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

@WebServlet(name = "VecinoServlet", value = "/VecinoServlet")
public class VecinoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IncidenCoordDao incidenciaDao = new IncidenCoordDao();
        String action = request.getParameter("action")==null?"inicioVecino":request.getParameter("action");
        String vista ;

        switch (action) {
            /*------------------Página principal------------------*/
            case "inicioVecino":
                //Llenado de las tablas de inicio
                ArrayList<IncidenciasB> listaIncidenciasRecientes = incidenciaDao.listarIncidenciaRecientes();
                request.setAttribute("listaIncidencia", listaIncidenciasRecientes);
                vista = "WEB-INF/Vecino/inicioVecino.jsp";
                break;

            case "eventoDeporte":
                vista = "WEB-INF/Vecino/Evento-D-Vecino.jsp";
                break;
            case "eventoCultura":
                vista = "WEB-INF/Vecino/Evento-C-Vecino.jsp";
                break;
            case "preguntasFrecuentes":
                vista = "WEB-INF/Vecino/preguntasFrecuentes_V.jsp";
                break;
            case "verPerfil":
                vista = "WEB-INF/Vecino/perfil_V.jsp";
                break;
            /*-------------fin Página principal-------------------*/

            /* falta seguir el flujo total de eventos*/
            case "eventosInscritos":
                //lógica para listar los eventos a los que se inscribe
                vista = "WEB-INF/Vecino/ListaEvent-Vecino.jsp";

            /*----------------Incidencias----------------*/
            case "listarIncidencia":
                ArrayList<IncidenciasB> listaIncidencias = incidenciaDao.listarIncidencia();
                request.setAttribute("lista", listaIncidencias);
                vista = "WEB-INF/Vecino/listaIncidencias_V.jsp";
                break;
            case "verIncidencia":
                String idIncidencia = request.getParameter("idIncidencia");
                IncidenciasB incidencia = incidenciaDao.buscarIncidenciaPorId(idIncidencia);
                request.setAttribute("incidencia", incidencia);
                vista = "WEB-INF/Vecino/verIncidencia_V.jsp";
                break;
            case "generarIncidencia":
                vista = "WEB-INF/Vecino/generarIncidencia_V.jsp";
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
                throw new IllegalArgumentException("Acción no reconocida: " + action);
        }
        request.getRequestDispatcher(vista).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        IncidenCoordDao incidenciaDao = new IncidenCoordDao();
        EventoDao eventoDao = new EventoDao();
        String action = request.getParameter("action") == null ? "crear" : request.getParameter("action");

        switch (action) {

            //Incidencia
            case "crearIncidencia":
                Map<String, String> errores = new HashMap<>();

                String nombreIncidencia = request.getParameter("nombreIncidencia");
                String fotoI = request.getParameter("foto");
                String tipoIncidencia = request.getParameter("TipoIncidencia_idTipoIncidencia");
                String urbanizacion = request.getParameter("urbanizacion_idUrbanizacion");
                String incidenciaPersonalStr = request.getParameter("incidenciaPersonal");
                String lugarExacto = request.getParameter("lugarExacto");
                String referencia = request.getParameter("referencia");
                String numeroContacto = request.getParameter("numeroContacto");
                String ambulanciaStr = request.getParameter("ambulancia");

                // Validaciones
                if (nombreIncidencia == null || nombreIncidencia.isEmpty()) {
                    errores.put("nombreIncidencia", "El nombre de la incidencia es obligatorio");
                } else if (nombreIncidencia.length() > 100) {
                    errores.put("nombreIncidencia", "El nombre de la incidencia no puede tener más de 100 caracteres");
                }
                /*
                if (foto == null || foto.isEmpty()) {
                    errores.put("foto", "La foto es obligatoria");
                }
                */
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
                }else if (lugarExacto.length() > 100) {
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
                    request.setAttribute("foto", fotoI);
                    request.setAttribute("tipoIncidencia", tipoIncidencia);
                    request.setAttribute("urbanizacion", urbanizacion);
                    request.setAttribute("incidenciaPersonal", incidenciaPersonalStr);
                    request.setAttribute("lugarExacto", lugarExacto);
                    request.setAttribute("referencia", referencia);
                    request.setAttribute("numeroContacto", numeroContacto);
                    request.setAttribute("ambulancia", ambulanciaStr);
                    request.getRequestDispatcher("WEB-INF/Vecino/generarIncidencia_V.jsp").forward(request, response);
                    return;
                }

                int incidenciaPersonal = Integer.parseInt(incidenciaPersonalStr);
                int ambulancia = Integer.parseInt(ambulanciaStr);

                IncidenciasB incidencia = new IncidenciasB();
                incidencia.setNombreIncidencia(nombreIncidencia);
                incidencia.setFoto(fotoI);
                incidencia.setTipoIncidencia(tipoIncidencia);
                incidencia.setUrbanizacion(urbanizacion);
                incidencia.setIncidenciaPersonal(incidenciaPersonal);
                incidencia.setLugarExacto(lugarExacto);
                incidencia.setReferencia(referencia);
                incidencia.setNumeroContacto(numeroContacto);
                incidencia.setAmbulancia(ambulancia);

                incidenciaDao.generarIncidenciaC(incidencia);
                // Agregar mensaje a la sesión
                request.getSession().setAttribute("info", "Incidencia creada de manera exitosa");

                // Redirigir a la lista de incidencias
                response.sendRedirect(request.getContextPath() + "/VecinoServlet?action=listarIncidencia");
                break;

            case "editarIncidencia":
                int id = Integer.parseInt(request.getParameter("idIncidencia"));
                String nombreIncidencia2 = request.getParameter("nombreIncidencia");
                String foto2I = request.getParameter("foto");
                String tipoIncidencia2 = request.getParameter("TipoIncidencia_idTipoIncidencia");
                String urbanizacion2 = request.getParameter("urbanizacion_idUrbanizacion");
                int incidenciaPersonal2 = Integer.parseInt(request.getParameter("incidenciaPersonal"));
                String lugarExacto2 = request.getParameter("lugarExacto");
                String referencia2 = request.getParameter("referencia");
                String numeroContacto2 = request.getParameter("numeroContacto");
                int ambulancia2 = Integer.parseInt(request.getParameter("ambulancia"));


                IncidenciasB incidenciaB = new IncidenciasB();
                incidenciaB.setIdIncidencias(id);
                incidenciaB.setNombreIncidencia(nombreIncidencia2);
                incidenciaB.setFoto(foto2I);
                incidenciaB.setTipoIncidencia(tipoIncidencia2);
                incidenciaB.setUrbanizacion(urbanizacion2);
                incidenciaB.setIncidenciaPersonal(incidenciaPersonal2);
                incidenciaB.setLugarExacto(lugarExacto2);
                incidenciaB.setReferencia(referencia2);
                incidenciaB.setNumeroContacto(numeroContacto2);
                incidenciaB.setAmbulancia(ambulancia2);

                incidenciaDao.actualizarIncidencia(incidenciaB);
                request.getSession().setAttribute("info", "Incidencia editada de manera exitosa");
                response.sendRedirect(request.getContextPath() + "/VecinoServlet?action=listarIncidencia");
                break;
            case "buscarIncidenciaPorNombre":
                String textBuscar = request.getParameter("textoBuscarIncidencia");
                String filtroFecha = request.getParameter("fecha");
                String filtroTipo = request.getParameter("tipo");
                String filtroEstado = request.getParameter("estado");
                if (textBuscar == null && filtroFecha == null && filtroTipo == null && filtroEstado ==null){
                    response.sendRedirect(request.getContextPath() + "/VecinoServlet?action=listarIncidencia");
                }else {
                    request.setAttribute("textoBuscarIncidencia", textBuscar);
                    request.setAttribute("lista", incidenciaDao.listarIncidenciasFiltro(textBuscar, filtroFecha, filtroTipo, filtroEstado));
                    request.getRequestDispatcher("WEB-INF/Vecino/listaIncidencias_V.jsp").forward(request, response);
                }
                break;

            default:
                response.sendRedirect(request.getContextPath() + "/VecinoServlet");
                break;

        }
    }
}
