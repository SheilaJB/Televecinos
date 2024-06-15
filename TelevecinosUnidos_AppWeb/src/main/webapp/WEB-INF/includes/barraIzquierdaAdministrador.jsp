<%--
  Created by IntelliJ IDEA.
  User: Pc
  Date: 14/06/2024
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sidebar pe-4 pb-3" style="background-color: #8ecae6;">

    <nav class="navbar" style="background-color: #8ecae6;" >
        <a class="navbar-brand mx-3 mt-3">
            <h4 style="color:#023047"><b>Televecinos Unidos</b></h4>
        </a>
        <!-- Sección del perfil del usuario en el sidebar-->
        <div class="d-flex align-items-center ms-4 mb-4"   >
            <img class="rounded-circle" src="img/munisanmiguelLogo.jpg" alt="Icono del perfil del usuario" style="width: 50px; height: 50px;">
            <div class="ms-3 m-3">
                <h6 class="mb-0" style="color:#023047;"><b>Municipalidad de San Miguel</b></h6>
                <span class="text-muted"><b>Administrador</b></span>
            </div>
        </div>
        <!-- Seleccionar Opciones -->
        <div class="navbar-nav w-100">
            <a href="<%=request.getContextPath()%>/AdministradorServlet?action=inicioAdmin" class="nav-item nav-link colorLetrasBarraLateral"><i  class="fa fa-home me-2 colorLetrasBarraLateral"></i><span style="font-size: 14px;"><b>Inicio</b></span></a>

            <a href="<%=request.getContextPath()%>/AdministradorServlet?action=nuevasSolicitudes_A"  class="nav-item nav-link "><i class="fa fa-clipboard-list me-2 colorLetrasBarraLateral"></i><span style="font-size: 14px;"><b>Nuevas solicitudes</b></span></a>
            <a href="<%=request.getContextPath()%>/AdministradorServlet?action=listaVecinos_A" class="nav-item nav-link"><i class="fa fa-user-friends me-2 colorLetrasBarraLateral"></i><span style="font-size: 14px;"><b>Lista de vecinos</b></span></a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-shield-alt me-2 colorLetrasBarraLateral"></i><span style="font-size: 13.5px;"><b>Personal serenazgo</b></span></a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="<%=request.getContextPath()%>/AdministradorServlet?action=listaSerenazgo_A" class="dropdown-item" style="font-size: 13.5px;"><b>Lista de serenazgos</b></a>

                    <a href="<%=request.getContextPath()%>/AdministradorServlet?action=registrarSerenazgo" class="dropdown-item"style="font-size: 13.5px;"><b>Registrar nuevo serenazgo</b></a>
                </div>
            </div>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-chalkboard-teacher me-2 colorLetrasBarraLateral"></i><span style="font-size: 13.3px;"><b>Area de coordinación</b></span></a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="ListaCoordinadorasCultura_A.html" class="dropdown-item"style="font-size: 13.5px;"><b>Coordinadoras cultura</b></a>
                    <a href="ListaCoordinadorasDeportes_A.html" class="dropdown-item"style="font-size: 13.5px;"><b>Coordinadoras deportes</b></a>
                    <a href="ListaInstructores_A.html" class="dropdown-item"style="font-size: 13.5px;"><b>Instructores</b></a>
                    <a href="registroSerenazgo.html" class="dropdown-item"style="font-size: 13.5px;"><b>Registrar nuevo instructor</b></a>
                </div>
            </div>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-question-circle me-2 colorLetrasBarraLateral"></i><span style="font-size: 13.3px;"><b>Preguntas frecuentes</b></span></a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="preguntasFrecuentes_V_vistaAdmin.html" class="dropdown-item"style="font-size: 13.5px;"><b>Dudas Vecinos</b></a>
                    <a href="preguntasFrecuentes_C_vistaAdmin.html" class="dropdown-item"style="font-size: 13.5px;"><b>Dudas Coordinadoras</b></a>
                    <a href="preguntasFrecuentes_S_vistaAdmin.html" class="dropdown-item"style="font-size: 13.5px;"><b>Dudas Serenazgos</b></a>
                </div>
            </div>

        </div>
    </nav>
</div>
