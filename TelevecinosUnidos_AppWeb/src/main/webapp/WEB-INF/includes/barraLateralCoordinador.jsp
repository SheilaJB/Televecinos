<%@ page import="org.example.televecinosunidos_appweb.model.beans.UsuarioB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuarioLogeado" scope="session" type="UsuarioB" class="org.example.televecinosunidos_appweb.model.beans.UsuarioB" />
<%
    String action = request.getParameter("action");
    if (action == null) {
        action = "inicioCoordinador"; //pestaña por defecto
    }

    // Variables para determinar si los menús desplegables están activos
    boolean eventosActive = action.equals("eventoGeneralesC") || action.equals("crearEvento") || action.equals("lista") || action.equals("registrarAsistencia");
    boolean incidenciasActive = action.equals("generarIncidenciaC") || action.equals("listarIncidencia");
%>
<!-- Sidebar Start -->
<div class="sidebar pe-4 pb-3" style="background-color: #8ecae6;">
    <nav class="navbar" style="background-color: #8ecae6;">
        <a class="navbar-brand mx-3 mt-3">
            <h4 style="color:#023047"><b>Televecinos Unidos</b></h4>
        </a>
        <div class="d-flex align-items-center ms-4 mb-4">
            <img class="rounded-circle" src="img/coordinadora.jpg" alt="" style="width: 50px; height: 50px;">
            <div class="ms-3 m-3">
                <h6 class="mb-0" style="color:#023047;"><b><%=usuarioLogeado.getNombre() + " " + usuarioLogeado.getApellido()%></b></h6>
                <span class="text-muted"><b>Coordinador</b></span>
            </div>
        </div>
        <div class="navbar-nav w-100">
            <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=inicioCoordinador" class="nav-item nav-link <%= action.equals("inicioCoordinador") ? "active" : "" %>"><i class="fa fa-home me-2"></i><span style="font-size: 13.5px;"><b>Inicio</b></span></a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle <%= eventosActive ? "active" : "" %>" data-bs-toggle="dropdown"><i class="fa fa-calendar me-2"></i><span style="font-size: 13.5px;"><b>Eventos</b></span></a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=eventoGeneralesC" class="dropdown-item <%= action.equals("eventoGeneralesC") ? "active" : "" %>"><span style="font-size: 13.5px;"><b>Eventos generales</b></span></a>
                    <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=crearEvento" class="dropdown-item <%= action.equals("crearEvento") ? "active" : "" %>"><span style="font-size: 13.5px;"><b>Crear evento</b></span></a>
                    <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=lista" class="dropdown-item <%= action.equals("lista") ? "active" : "" %>"><span style="font-size: 13.5px;"><b>Eventos propios</b></span></a>
                    <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=registrarAsistencia" class="dropdown-item <%= action.equals("registrarAsistencia") ? "active" : "" %>"><span style="font-size: 13.5px;"><b>Registrar asistencia</b></span></a>
                </div>
            </div>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle <%= incidenciasActive ? "active" : "" %>" data-bs-toggle="dropdown"><i class="fa fa-th-list me-2"></i><span style="font-size: 13.5px;"><b>Incidencias</b></span></a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=generarIncidenciaC" class="dropdown-item <%= action.equals("generarIncidenciaC") ? "active" : "" %>"><span style="font-size: 13.5px;"><b>Crear incidencia</b></span></a>
                    <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=listarIncidencia" class="dropdown-item <%= action.equals("listarIncidencia") ? "active" : "" %>"><span style="font-size: 13.5px;"><b>Lista de incidencias</b></span></a>
                </div>
            </div>
            <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=preguntasFrecuentesC" class="nav-item nav-link <%= action.equals("preguntasFrecuentesC") ? "active" : "" %>"><i class="fa fa-question-circle me-2"></i><span style="font-size: 13.5px;"><b>Preguntas frecuentes</b></span></a>
        </div>
    </nav>
</div>
<!-- Sidebar End -->
