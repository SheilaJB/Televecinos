<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String action = request.getParameter("action");
    if (action == null) {
        action = "inicioAdmin"; //pestaña por defecto
    }
%>
<div class="sidebar pe-4 pb-3" style="background-color: #8ecae6;">
    <nav class="navbar" style="background-color: #8ecae6;">
        <a class="navbar-brand mx-3 mt-3">
            <h4 style="color:#023047"><b>Televecinos Unidos</b></h4>
        </a>
        <!-- Sección del perfil del usuario en el sidebar-->
        <div class="d-flex align-items-center ms-4 mb-4">
            <img class="rounded-circle" src="img/munisanmiguelLogo.jpg" alt="Icono del perfil del usuario" style="width: 50px; height: 50px;">
            <div class="ms-3 m-3">
                <h6 class="mb-0" style="color:#023047;"><b>Municipalidad de San Miguel</b></h6>
                <span class="text-muted"><b>Administrador</b></span>
            </div>
        </div>
        <!-- Seleccionar Opciones -->
        <div class="navbar-nav w-100">
            <a href="<%=request.getContextPath()%>/AdministradorServlet?action=inicioAdmin" class="nav-item nav-link <%= action.equals("inicioAdmin") ? "active" : "" %> colorLetrasBarraLateral"><i class="fa fa-home me-2 colorLetrasBarraLateral"></i><span style="font-size: 14px;"><b>Inicio</b></span></a>
            <a href="<%=request.getContextPath()%>/AdministradorServlet?action=nuevasSolicitudes_A" class="nav-item nav-link <%= action.equals("nuevasSolicitudes_A") ? "active" : "" %>"><i class="fa fa-user-plus me-2 colorLetrasBarraLateral"></i><span style="font-size: 14px;"><b>Nuevas solicitudes</b></span></a>
            <a href="<%=request.getContextPath()%>/AdministradorServlet?action=listaVecinos_A" class="nav-item nav-link <%= action.equals("listaVecinos_A") ? "active" : "" %>"><i class="fa fa-users me-2 colorLetrasBarraLateral"></i><span style="font-size: 14px;"><b>Lista de vecinos</b></span></a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle <%= (action.equals("listaSerenazgo_A") || action.equals("registroSerenazgo")) ? "active" : "" %>" data-bs-toggle="dropdown"><i class="fa fa-shield-alt me-2 colorLetrasBarraLateral"></i><span style="font-size: 13.5px;"><b>Personal serenazgo</b></span></a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="<%=request.getContextPath()%>/AdministradorServlet?action=listaSerenazgo_A" class="dropdown-item <%= action.equals("listaSerenazgo_A") ? "active" : "" %>" style="font-size: 13.5px;"><b>Lista de serenazgos</b></a>
                    <a href="<%=request.getContextPath()%>/AdministradorServlet?action=registroSerenazgo" class="dropdown-item <%= action.equals("registroSerenazgo") ? "active" : "" %>" style="font-size: 13.5px;"><b>Registrar nuevo serenazgo</b></a>
                </div>
            </div>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle <%= (action.equals("listaCoordinadorasCultura_A") || action.equals("listaCoordinadorasDeportes_A") || action.equals("listaInstructores_A") || action.equals("registroInstructor")) ? "active" : "" %>" data-bs-toggle="dropdown"><i class="fa fa-chalkboard-teacher me-2 colorLetrasBarraLateral"></i><span style="font-size: 13.3px;"><b>Area de coordinación</b></span></a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="<%=request.getContextPath()%>/AdministradorServlet?action=listaCoordinadorasCultura_A" class="dropdown-item <%= action.equals("listaCoordinadorasCultura_A") ? "active" : "" %>" style="font-size: 13.5px;"><b>Coordinadoras cultura</b></a>
                    <a href="<%=request.getContextPath()%>/AdministradorServlet?action=listaCoordinadorasDeportes_A" class="dropdown-item <%= action.equals("listaCoordinadorasDeportes_A") ? "active" : "" %>" style="font-size: 13.5px;"><b>Coordinadoras deportes</b></a>
                    <a href="<%=request.getContextPath()%>/AdministradorServlet?action=listaInstructores_A" class="dropdown-item <%= action.equals("listaInstructores_A") ? "active" : "" %>" style="font-size: 13.5px;"><b>Instructores</b></a>
                    <a href="<%=request.getContextPath()%>/AdministradorServlet?action=registroInstructor" class="dropdown-item <%= action.equals("registroInstructor") ? "active" : "" %>" style="font-size: 13.5px;"><b>Registrar nuevo instructor</b></a>
                </div>
            </div>
            <a href="<%=request.getContextPath()%>/AdministradorServlet?action=usuariosBaneados_A" class="nav-item nav-link <%= action.equals("usuariosBaneados_A") ? "active" : "" %>"><i class="fa fa-user-alt-slash me-2 colorLetrasBarraLateral"></i><span style="font-size: 14px;"><b>Usuarios Baneados</b></span></a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle <%= (action.equals("preguntasFrecuentes_V_vistaAdmin") || action.equals("preguntasFrecuentes_C_vistaAdmin") || action.equals("preguntasFrecuentes_S_vistaAdmin")) ? "active" : "" %>" data-bs-toggle="dropdown"><i class="far fa-question-circle me-2 colorLetrasBarraLateral"></i><span style="font-size: 13.3px;"><b>Preguntas frecuentes</b></span></a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="<%=request.getContextPath()%>/AdministradorServlet?action=preguntasFrecuentes_V_vistaAdmin" class="dropdown-item <%= action.equals("preguntasFrecuentes_V_vistaAdmin") ? "active" : "" %>" style="font-size: 13.5px;"><b>Dudas Vecinos</b></a>
                    <a href="<%=request.getContextPath()%>/AdministradorServlet?action=preguntasFrecuentes_C_vistaAdmin" class="dropdown-item <%= action.equals("preguntasFrecuentes_C_vistaAdmin") ? "active" : "" %>" style="font-size: 13.5px;"><b>Dudas Coordinadoras</b></a>
                    <a href="<%=request.getContextPath()%>/AdministradorServlet?action=preguntasFrecuentes_S_vistaAdmin" class="dropdown-item <%= action.equals("preguntasFrecuentes_S_vistaAdmin") ? "active" : "" %>" style="font-size: 13.5px;"><b>Dudas Serenazgos</b></a>
                </div>
            </div>
        </div>
    </nav>
</div>
