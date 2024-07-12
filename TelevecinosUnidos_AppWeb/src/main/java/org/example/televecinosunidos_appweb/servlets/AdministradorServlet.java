package org.example.televecinosunidos_appweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.televecinosunidos_appweb.model.beans.*;
import org.example.televecinosunidos_appweb.model.daos.*;
import org.example.televecinosunidos_appweb.util.GeneraContrasena;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

@WebServlet(name = "AdministradorServlet", value = "/AdministradorServlet")
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
                int paginaSerenazgo = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
                int serenazgosPorPagina = 5; // Número de serenazgos por página

                // Obtener la lista completa de serenazgos
                ArrayList<SerenazgoB> listaSerenazgos = serenazgoDao.listarSerenazgos();

                // Calcular total de páginas
                int totalSerenazgos = listaSerenazgos.size();
                int totalPaginasSerenazgos = (int) Math.ceil((double) totalSerenazgos / serenazgosPorPagina);

                // Obtener los serenazgos de la página actual
                int desdeSerenazgo = (paginaSerenazgo - 1) * serenazgosPorPagina;
                int hastaSerenazgo = Math.min(desdeSerenazgo + serenazgosPorPagina, totalSerenazgos);
                ArrayList<SerenazgoB> serenazgosPaginados = new ArrayList<>(listaSerenazgos.subList(desdeSerenazgo, hastaSerenazgo));

                // Enviar atributos al JSP
                vista = "WEB-INF/Administrador/listaSerenazgo_A.jsp";
                request.setAttribute("lista", serenazgosPaginados);
                request.setAttribute("paginaActual", paginaSerenazgo);
                request.setAttribute("totalPaginas", totalPaginasSerenazgos);
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
            case "editarSerenazgo":
                String idSerenazgo2 = request.getParameter("idSerenazgo");
                SerenazgoB serenazgoB = serenazgoDao.buscarSerenazgoPorId(idSerenazgo2);
                if(serenazgoB != null){
                    request.setAttribute("serenazgo",serenazgoB);
                    request.getRequestDispatcher("WEB-INF/Administrador/editarSerenazgo.jsp").forward(request,response);
                }
                else{
                    response.sendRedirect(request.getContextPath() + "/AdministradorServlet");
                }
                break;
            case "listaCoordinadorasCultura_A":
                int paginaCultura = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
                int culturaPorPagina = 5; // Número de coordinadoras de cultura por página

                // Obtener la lista completa de coordinadoras de cultura
                ArrayList<UsuarioB> listaCultura = coordinadoraDao.listarCoordinadorasCultura();

                // Calcular total de páginas
                int totalCultura = listaCultura.size();
                int totalPaginasCultura = (int) Math.ceil((double) totalCultura / culturaPorPagina);

                // Obtener las coordinadoras de cultura de la página actual
                int desdeCultura = (paginaCultura - 1) * culturaPorPagina;
                int hastaCultura = Math.min(desdeCultura + culturaPorPagina, totalCultura);
                ArrayList<UsuarioB> culturaPaginada = new ArrayList<>(listaCultura.subList(desdeCultura, hastaCultura));

                // Enviar atributos al JSP
                vista = "WEB-INF/Administrador/listaCoordinadorasCultura_A.jsp";
                request.setAttribute("lista", culturaPaginada);
                request.setAttribute("paginaActual", paginaCultura);
                request.setAttribute("totalPaginas", totalPaginasCultura);
                request.getRequestDispatcher(vista).forward(request, response);
                break;

            case "listaCoordinadorasDeportes_A":
                int paginaDeportes = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
                int deportesPorPagina = 5; // Número de coordinadoras de deportes por página

                // Obtener la lista completa de coordinadoras de deportes
                ArrayList<UsuarioB> listaDeportes = coordinadoraDao.listarCoordinadorasDeportes();

                // Calcular total de páginas
                int totalDeportes = listaDeportes.size();
                int totalPaginasDeportes = (int) Math.ceil((double) totalDeportes / deportesPorPagina);

                // Obtener las coordinadoras de deportes de la página actual
                int desdeDeportes = (paginaDeportes - 1) * deportesPorPagina;
                int hastaDeportes = Math.min(desdeDeportes + deportesPorPagina, totalDeportes);
                ArrayList<UsuarioB> deportesPaginados = new ArrayList<>(listaDeportes.subList(desdeDeportes, hastaDeportes));

                // Enviar atributos al JSP
                vista = "WEB-INF/Administrador/listaCoordinadorasDeportes_A.jsp";
                request.setAttribute("lista", deportesPaginados);
                request.setAttribute("paginaActual", paginaDeportes);
                request.setAttribute("totalPaginas", totalPaginasDeportes);
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
                int paginaVecinos = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
                int vecinosPorPagina = 5; // Número de vecinos por página

                // Obtener la lista completa de vecinos
                ArrayList<UsuarioB> listaVecinos = vecinoDao.listarVecinos();

                // Calcular total de páginas
                int totalVecinos = listaVecinos.size();
                int totalPaginasVecinos = (int) Math.ceil((double) totalVecinos / vecinosPorPagina);

                // Obtener los vecinos de la página actual
                int desdeVecinos = (paginaVecinos - 1) * vecinosPorPagina;
                int hastaVecinos = Math.min(desdeVecinos + vecinosPorPagina, totalVecinos);
                ArrayList<UsuarioB> vecinosPaginados = new ArrayList<>(listaVecinos.subList(desdeVecinos, hastaVecinos));

                // Enviar atributos al JSP
                vista = "WEB-INF/Administrador/listaVecinos_A.jsp";
                request.setAttribute("lista", vecinosPaginados);
                request.setAttribute("paginaActual", paginaVecinos);
                request.setAttribute("totalPaginas", totalPaginasVecinos);
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "DetalleSolicitantes_A":
                String idVecino1 = request.getParameter("idVecino");
                request.setAttribute("vecino",vecinoDao.buscarVecinoPorId(idVecino1));
                vista = "WEB-INF/Administrador/DetalleSolicitantes_A.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "DetalleVecinos_A":
                String idVecino = request.getParameter("idVecino");
                request.setAttribute("vecino",vecinoDao.buscarVecinoPorId(idVecino));
                vista = "WEB-INF/Administrador/DetalleVecinos_A.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "listaInstructores_A":
                int paginaInstructores = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
                int instructoresPorPagina = 10; // Número de instructores por página

                // Obtener la lista completa de instructores
                ArrayList<ProfesoresEvento> listaInstructores = instructorDao.listarProfesores();

                // Calcular total de páginas
                int totalInstructores = listaInstructores.size();
                int totalPaginasInstructores = (int) Math.ceil((double) totalInstructores / instructoresPorPagina);

                // Obtener los instructores de la página actual
                int desdeInstructores = (paginaInstructores - 1) * instructoresPorPagina;
                int hastaInstructores = Math.min(desdeInstructores + instructoresPorPagina, totalInstructores);
                ArrayList<ProfesoresEvento> instructoresPaginados = new ArrayList<>(listaInstructores.subList(desdeInstructores, hastaInstructores));

                // Enviar atributos al JSP
                vista = "WEB-INF/Administrador/listaInstructores_A.jsp";
                request.setAttribute("lista", instructoresPaginados);
                request.setAttribute("paginaActual", paginaInstructores);
                request.setAttribute("totalPaginas", totalPaginasInstructores);
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "registroInstructor":
                request.getRequestDispatcher("WEB-INF/Administrador/registroInstructor.jsp").forward(request,response);
                break;
            case "nuevasSolicitudes_A":
                int paginaActual = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
                int solicitudesPorPagina = 5; // Número de solicitudes por página

                // Obtener la lista completa de solicitantes
                ArrayList<UsuarioB> listaSolicitantes = solicitanteDao.listarSolicitantes();

                // Calcular total de páginas
                int totalSolicitantes = listaSolicitantes.size();
                int totalPaginas = (int) Math.ceil((double) totalSolicitantes / solicitudesPorPagina);

                // Obtener los solicitantes de la página actual
                int desde = (paginaActual - 1) * solicitudesPorPagina;
                int hasta = Math.min(desde + solicitudesPorPagina, totalSolicitantes);
                ArrayList<UsuarioB> solicitantesPaginados = new ArrayList<>(listaSolicitantes.subList(desde, hasta));

                // Enviar atributos al JSP
                vista = "WEB-INF/Administrador/nuevasSolicitudes_A.jsp";
                request.setAttribute("lista", solicitantesPaginados);
                request.setAttribute("paginaActual", paginaActual);
                request.setAttribute("totalPaginas", totalPaginas);
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "usuariosBaneados_A":
                int paginaBaneados = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
                int baneadosPorPagina = 5; // Número de usuarios baneados por página

                // Obtener la lista completa de usuarios baneados
                ArrayList<UsuarioB> listaBaneados = usuarioDao.listarBaneados();

                // Calcular total de páginas
                int totalBaneados = listaBaneados.size();
                int totalPaginasBaneados = (int) Math.ceil((double) totalBaneados / baneadosPorPagina);

                // Obtener los usuarios baneados de la página actual
                int desdeBaneados = (paginaBaneados - 1) * baneadosPorPagina;
                int hastaBaneados = Math.min(desdeBaneados + baneadosPorPagina, totalBaneados);
                ArrayList<UsuarioB> baneadosPaginados = new ArrayList<>(listaBaneados.subList(desdeBaneados, hastaBaneados));

                // Enviar atributos al JSP
                vista = "WEB-INF/Administrador/usuariosBaneados_A.jsp";
                request.setAttribute("lista", baneadosPaginados);
                request.setAttribute("paginaActual", paginaBaneados);
                request.setAttribute("totalPaginas", totalPaginasBaneados);
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "solicitanteAVecinoAceptar":
                String solicitanteId = request.getParameter("idSolicitante");
                if (solicitanteDao.obtenerSolicitante(solicitanteId) != null) {
                    try {
                        solicitanteDao.aceptarSolicitud(solicitanteId);
                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("msg", "Solicitud aprobada exitosamente");
                        response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=nuevasSolicitudes_A");
                    } catch (SQLException | NoSuchAlgorithmException e) {
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
                //String contrasenia = request.getParameter("contrasenia");
                int pregFrecuentes = 1;
                int idRol = 4;
                int isBan = 0;
                int primeroIngreso = 1;

                UsuarioB us = new UsuarioB();
                us.setNombre(nombre);
                us.setApellido(apellido);
                us.setDni(dni);
                us.setDireccion(direccion);
                us.setCorreo(correo);
                //us.setContrasenia(contrasenia);
                us.setPreguntasFrecuentes_idTable2(pregFrecuentes);
                us.setIdRol(idRol);
                us.setIsBan(isBan);
                us.setPrimerIngreso(primeroIngreso);

                SerenazgoB serenazgoB = new SerenazgoB();
                serenazgoB.setNumTelefono(numTelefono);
                serenazgoB.setFechaNacimiento(fechaNacimiento);
                serenazgoB.setIdTurnoSerenazgo(turno);
                serenazgoB.setIdTipoSerenazgo(tipo);

                serenazgoB.setUsuario(us);
                try {
                    serenazgoDao.registrarSerenazgo(serenazgoB);
                } catch (NoSuchAlgorithmException e) {
                    throw new RuntimeException(e);
                }


                response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=listaSerenazgo_A");




                break;
            case "editarSerenazgo":
                String idUsuario2 = request.getParameter("idUsuario");
                String nombre2 = request.getParameter("nombre");
                String apellido2 = request.getParameter("apellido");
                String dni2 = request.getParameter("dni");
                String direccion2 = request.getParameter("direccion");
                String numTelefono2 = request.getParameter("numTelefono");
                String fechaNacimiento2 = request.getParameter("fechaNacimiento");
                int turno2 = Integer.parseInt(request.getParameter("turno"));
                int tipo2 = Integer.parseInt(request.getParameter("tipo"));
                String correo2 = request.getParameter("correo");
                String contrasenia2 = request.getParameter("contrasenia");
                int pregFrecuentes2 = 1;
                int idRol2 = 4;
                int isBan2 = 0;


                UsuarioB us2 = new UsuarioB();
                us2.setIdUsuario(Integer.parseInt(idUsuario2));
                us2.setNombre(nombre2);
                us2.setApellido(apellido2);
                us2.setDni(dni2);
                us2.setDireccion(direccion2);
                us2.setCorreo(correo2);
                us2.setContrasenia(contrasenia2);
                us2.setPreguntasFrecuentes_idTable2(pregFrecuentes2);
                us2.setIdRol(idRol2);
                us2.setIsBan(isBan2);

                SerenazgoB serenazgoB2 = new SerenazgoB();
                serenazgoB2.setNumTelefono(numTelefono2);
                serenazgoB2.setFechaNacimiento(fechaNacimiento2);
                serenazgoB2.setIdTurnoSerenazgo(turno2);
                serenazgoB2.setIdTipoSerenazgo(tipo2);

                serenazgoB2.setUsuario(us2);
                serenazgoDao.actualizarSerenazgo(serenazgoB2);

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
                String textoBuscarVecinos = request.getParameter("textoBuscar");
                int paginaBusquedaVecinos = request.getParameter("pagina") != null ? Integer.parseInt(request.getParameter("pagina")) : 1;
                int vecinosPorPaginaBusqueda = 5; // Número de vecinos por página

                if (textoBuscarVecinos == null) {
                    response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=listaVecinos_A");
                } else {
                    ArrayList<UsuarioB> vecinosBuscados = vecinoDao.buscarVecinoPorNombre(textoBuscarVecinos);
                    int totalRegistrosVecinos = vecinosBuscados.size();
                    int totalPaginasVecinosBusqueda = (int) Math.ceil((double) totalRegistrosVecinos / vecinosPorPaginaBusqueda);

                    // Obtener los vecinos de la página actual
                    int desdeVecinosBusqueda = (paginaBusquedaVecinos - 1) * vecinosPorPaginaBusqueda;
                    int hastaVecinosBusqueda = Math.min(desdeVecinosBusqueda + vecinosPorPaginaBusqueda, totalRegistrosVecinos);
                    ArrayList<UsuarioB> vecinosPaginadosBusqueda = new ArrayList<>(vecinosBuscados.subList(desdeVecinosBusqueda, hastaVecinosBusqueda));

                    // Enviar atributos al JSP
                    request.setAttribute("textoBusqueda", textoBuscarVecinos);
                    request.setAttribute("lista", vecinosPaginadosBusqueda);
                    request.setAttribute("paginaActual", paginaBusquedaVecinos);
                    request.setAttribute("totalPaginas", totalPaginasVecinosBusqueda);
                    RequestDispatcher viewVecinos = request.getRequestDispatcher("WEB-INF/Administrador/listaVecinos_A.jsp");
                    viewVecinos.forward(request, response);
                }
                break;

            case "buscarSerenazgoPorNombre":
                String textoBuscarSerenazgo = request.getParameter("textoBuscarSerenazgo");
                String tipoS = request.getParameter("tipo");
                String turnoS = request.getParameter("turno");
                int paginaBusquedaSerenazgo = request.getParameter("pagina") != null ? Integer.parseInt(request.getParameter("pagina")) : 1;
                int serenazgosPorPaginaBusqueda = 5; // Número de serenazgos por página

                if (textoBuscarSerenazgo == null && tipoS == null && turnoS == null) {
                    response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=listaSerenazgo_A");
                } else {
                    ArrayList<SerenazgoB> serenazgosBuscados = serenazgoDao.listarSerenazgosFiltro(textoBuscarSerenazgo, tipoS, turnoS);
                    int totalRegistrosSerenazgo = serenazgosBuscados.size();
                    int totalPaginasSerenazgoBusqueda = (int) Math.ceil((double) totalRegistrosSerenazgo / serenazgosPorPaginaBusqueda);

                    // Obtener los serenazgos de la página actual
                    int desdeSerenazgoBusqueda = (paginaBusquedaSerenazgo - 1) * serenazgosPorPaginaBusqueda;
                    int hastaSerenazgoBusqueda = Math.min(desdeSerenazgoBusqueda + serenazgosPorPaginaBusqueda, totalRegistrosSerenazgo);
                    ArrayList<SerenazgoB> serenazgosPaginadosBusqueda = new ArrayList<>(serenazgosBuscados.subList(desdeSerenazgoBusqueda, hastaSerenazgoBusqueda));

                    // Enviar atributos al JSP
                    request.setAttribute("textoBusqueda", textoBuscarSerenazgo);
                    request.setAttribute("tipo", tipoS);
                    request.setAttribute("turno", turnoS);
                    request.setAttribute("lista", serenazgosPaginadosBusqueda);
                    request.setAttribute("paginaActual", paginaBusquedaSerenazgo);
                    request.setAttribute("totalPaginas", totalPaginasSerenazgoBusqueda);
                    RequestDispatcher viewSerenazgo = request.getRequestDispatcher("WEB-INF/Administrador/listaSerenazgo_A.jsp");
                    viewSerenazgo.forward(request, response);
                }
                break;
            case "buscarCoordiCulturaPorNombre":
                String textoBuscarCultura = request.getParameter("textoBuscar");
                int paginaBusquedaCultura = request.getParameter("pagina") != null ? Integer.parseInt(request.getParameter("pagina")) : 1;
                int culturaPorPaginaBusqueda = 5; // Número de coordinadoras de cultura por página

                if (textoBuscarCultura == null) {
                    response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=listaCoordinadorasCultura_A");
                } else {
                    ArrayList<UsuarioB> culturaBuscada = coordinadoraDao.listarCoordinadorasCulturaPorNombre(textoBuscarCultura);
                    int totalRegistrosCultura = culturaBuscada.size();
                    int totalPaginasCulturaBusqueda = (int) Math.ceil((double) totalRegistrosCultura / culturaPorPaginaBusqueda);

                    // Obtener las coordinadoras de cultura de la página actual
                    int desdeCulturaBusqueda = (paginaBusquedaCultura - 1) * culturaPorPaginaBusqueda;
                    int hastaCulturaBusqueda = Math.min(desdeCulturaBusqueda + culturaPorPaginaBusqueda, totalRegistrosCultura);
                    ArrayList<UsuarioB> culturaPaginadaBusqueda = new ArrayList<>(culturaBuscada.subList(desdeCulturaBusqueda, hastaCulturaBusqueda));

                    // Enviar atributos al JSP
                    request.setAttribute("textoBusqueda", textoBuscarCultura);
                    request.setAttribute("lista", culturaPaginadaBusqueda);
                    request.setAttribute("paginaActual", paginaBusquedaCultura);
                    request.setAttribute("totalPaginas", totalPaginasCulturaBusqueda);
                    RequestDispatcher viewCultura = request.getRequestDispatcher("WEB-INF/Administrador/listaCoordinadorasCultura_A.jsp");
                    viewCultura.forward(request, response);
                }
                break;

            case "buscarCoordiDeportesPorNombre":
                String textoBuscarDeportes = request.getParameter("textoBuscar");
                int paginaBusquedaDeportes = request.getParameter("pagina") != null ? Integer.parseInt(request.getParameter("pagina")) : 1;
                int deportesPorPaginaBusqueda = 5; // Número de coordinadoras de deportes por página

                if (textoBuscarDeportes == null) {
                    response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=listaCoordinadorasDeportes_A");
                } else {
                    ArrayList<UsuarioB> deportesBuscados = coordinadoraDao.listarCoordinadorasDeportesPorNombre(textoBuscarDeportes);
                    int totalRegistrosDeportes = deportesBuscados.size();
                    int totalPaginasDeportesBusqueda = (int) Math.ceil((double) totalRegistrosDeportes / deportesPorPaginaBusqueda);

                    // Obtener las coordinadoras de deportes de la página actual
                    int desdeDeportesBusqueda = (paginaBusquedaDeportes - 1) * deportesPorPaginaBusqueda;
                    int hastaDeportesBusqueda = Math.min(desdeDeportesBusqueda + deportesPorPaginaBusqueda, totalRegistrosDeportes);
                    ArrayList<UsuarioB> deportesPaginadosBusqueda = new ArrayList<>(deportesBuscados.subList(desdeDeportesBusqueda, hastaDeportesBusqueda));

                    // Enviar atributos al JSP
                    request.setAttribute("textoBusqueda", textoBuscarDeportes);
                    request.setAttribute("lista", deportesPaginadosBusqueda);
                    request.setAttribute("paginaActual", paginaBusquedaDeportes);
                    request.setAttribute("totalPaginas", totalPaginasDeportesBusqueda);
                    RequestDispatcher viewDeportes = request.getRequestDispatcher("WEB-INF/Administrador/listaCoordinadorasDeportes_A.jsp");
                    viewDeportes.forward(request, response);
                }
                break;
            case "buscarUsuariosBaneadosPorNombre":
                String textoBuscarBaneados = request.getParameter("textoBuscar");
                int paginaBusquedaBaneados = request.getParameter("pagina") != null ? Integer.parseInt(request.getParameter("pagina")) : 1;
                int baneadosPorPaginaBusqueda = 5; // Número de usuarios baneados por página

                if (textoBuscarBaneados == null) {
                    response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=usuariosBaneados_A");
                } else {
                    ArrayList<UsuarioB> baneadosBuscados = usuarioDao.listarBaneadosPorNombre(textoBuscarBaneados);
                    int totalRegistrosBaneados = baneadosBuscados.size();
                    int totalPaginasBaneadosBusqueda = (int) Math.ceil((double) totalRegistrosBaneados / baneadosPorPaginaBusqueda);

                    // Obtener los usuarios baneados de la página actual
                    int desdeBaneadosBusqueda = (paginaBusquedaBaneados - 1) * baneadosPorPaginaBusqueda;
                    int hastaBaneadosBusqueda = Math.min(desdeBaneadosBusqueda + baneadosPorPaginaBusqueda, totalRegistrosBaneados);
                    ArrayList<UsuarioB> baneadosPaginadosBusqueda = new ArrayList<>(baneadosBuscados.subList(desdeBaneadosBusqueda, hastaBaneadosBusqueda));

                    // Enviar atributos al JSP
                    request.setAttribute("textoBusqueda", textoBuscarBaneados);
                    request.setAttribute("lista", baneadosPaginadosBusqueda);
                    request.setAttribute("paginaActual", paginaBusquedaBaneados);
                    request.setAttribute("totalPaginas", totalPaginasBaneadosBusqueda);
                    RequestDispatcher viewBaneados = request.getRequestDispatcher("WEB-INF/Administrador/usuariosBaneados_A.jsp");
                    viewBaneados.forward(request, response);
                }
                break;
            case "buscarNuevasSolicitudesPorNombre":
                textoBuscar = request.getParameter("textoBuscar");
                int pagina = request.getParameter("pagina") != null ? Integer.parseInt(request.getParameter("pagina")) : 1;
                int solicitudesPorPagina = 5; // Número de solicitudes por página

                if (textoBuscar == null) {
                    response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=nuevasSolicitudes_A");
                } else {
                    ArrayList<UsuarioB> solicitantes = solicitanteDao.listarSolicitantesPorNombre(textoBuscar);
                    int totalRegistros = solicitantes.size();
                    int totalPaginas = (int) Math.ceil((double) totalRegistros / solicitudesPorPagina);

                    // Obtener los solicitantes de la página actual
                    int desde = (pagina - 1) * solicitudesPorPagina;
                    int hasta = Math.min(desde + solicitudesPorPagina, totalRegistros);
                    ArrayList<UsuarioB> solicitantesPaginados = new ArrayList<>(solicitantes.subList(desde, hasta));

                    // Enviar atributos al JSP
                    request.setAttribute("textoBusqueda", textoBuscar);
                    request.setAttribute("lista", solicitantesPaginados);
                    request.setAttribute("paginaActual", pagina);
                    request.setAttribute("totalPaginas", totalPaginas);
                    RequestDispatcher view = request.getRequestDispatcher("WEB-INF/Administrador/nuevasSolicitudes_A.jsp");
                    view.forward(request, response);
                }
                break;

            case "buscarInstructoresPorNombre":
                String textoBuscarInstructores = request.getParameter("textoBuscar");
                int paginaBusquedaInstructores = request.getParameter("pagina") != null ? Integer.parseInt(request.getParameter("pagina")) : 1;
                int instructoresPorPaginaBusqueda = 5; // Número de instructores por página

                if (textoBuscarInstructores == null) {
                    response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=listaInstructores_A");
                } else {
                    ArrayList<ProfesoresEvento> instructoresBuscados = instructorDao.listarProfesoresPorNombre(textoBuscarInstructores);
                    int totalRegistrosInstructores = instructoresBuscados.size();
                    int totalPaginasInstructoresBusqueda = (int) Math.ceil((double) totalRegistrosInstructores / instructoresPorPaginaBusqueda);

                    // Obtener los instructores de la página actual
                    int desdeInstructoresBusqueda = (paginaBusquedaInstructores - 1) * instructoresPorPaginaBusqueda;
                    int hastaInstructoresBusqueda = Math.min(desdeInstructoresBusqueda + instructoresPorPaginaBusqueda, totalRegistrosInstructores);
                    ArrayList<ProfesoresEvento> instructoresPaginadosBusqueda = new ArrayList<>(instructoresBuscados.subList(desdeInstructoresBusqueda, hastaInstructoresBusqueda));

                    // Enviar atributos al JSP
                    request.setAttribute("textoBusqueda", textoBuscarInstructores);
                    request.setAttribute("lista", instructoresPaginadosBusqueda);
                    request.setAttribute("paginaActual", paginaBusquedaInstructores);
                    request.setAttribute("totalPaginas", totalPaginasInstructoresBusqueda);
                    RequestDispatcher viewInstructores = request.getRequestDispatcher("WEB-INF/Administrador/listaInstructores_A.jsp");
                    viewInstructores.forward(request, response);
                }
                break;

        }
    }
}
