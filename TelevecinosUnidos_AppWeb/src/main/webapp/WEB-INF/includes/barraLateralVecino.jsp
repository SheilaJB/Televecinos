

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String action = request.getParameter("action");
    if (action == null) {
        action = "inicioVecino"; //pestaña por defecto
    }
%>
<!-- BARRA AZUL DE LA IZQUIERDA INICIO-->
<!-- Sidebar Start -->
<div class="sidebar pe-4 pb-3" style="background-color: #8ecae6;">
    <nav class="navbar" style="background-color: #8ecae6;">
        <a class="navbar-brand mx-3 mt-3">
            <h4 style="color:#023047"><b>Televecinos Unidos</b></h4>
        </a>
        <div class="d-flex align-items-center ms-4 mb-4">
            <img class="rounded-circle" src="img/Icon_perfil.png" alt="" style="width: 50px; height: 50px;">
            <div class="ms-3 m-3">
                <h6 class="mb-0" style="color:#023047;"><b>Nombre Apellido</b></h6>
                <span class="text-muted"><b>Vecino</b></span>
            </div>
        </div>
        <div class="navbar-nav w-100">
            <a href="<%=request.getContextPath()%>/VecinoServlet?action=inicioVecino" class="nav-item nav-link <%= action.equals("inicioVecino") ? "active" : "" %>"><i class="fa fa-home me-2"></i><span style="font-size: 13.5px;"><b>Inicio</b></span></a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle <%= (action.equals("EventoDeporte") || action.equals("EventoCultura") || action.equals("EventosInscritos")) ? "active" : "" %>" data-bs-toggle="dropdown"><i class="fa fa-calendar me-2"></i><span style="font-size: 13.5px;"><b>Eventos</b></span></a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="<%=request.getContextPath()%>/VecinoServlet?action=EventoDeporte" class="dropdown-item <%= action.equals("EventoDeporte") ? "active" : "" %>" style="font-size: 13.5px;"><b>Deporte</b></a>
                    <a href="<%=request.getContextPath()%>/VecinoServlet?action=EventoCultura" class="dropdown-item <%= action.equals("EventoCultura") ? "active" : "" %>" style="font-size: 13.5px;"><b>Cultura</b></a>
                    <a href="<%=request.getContextPath()%>/VecinoServlet?action=EventosInscritos" class="dropdown-item <%= action.equals("EventosInscritos") ? "active" : "" %>" style="font-size: 13.5px;"><b>Eventos inscritos</b></a>
                </div>
            </div>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle <%= (action.equals("reportarIncidencia") || action.equals("listaIncidencias_V")) ? "active" : "" %>" data-bs-toggle="dropdown"><i class="fa fa-th-list me-2"></i><span style="font-size: 13.5px;"><b>Incidencias</b></span></a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="<%=request.getContextPath()%>/VecinoServlet?action=reportarIncidencia" class="dropdown-item <%= action.equals("reportarIncidencia") ? "active" : "" %>" style="font-size: 13.5px;"><b>Reportar incidencia</b></a>
                    <a href="<%=request.getContextPath()%>/VecinoServlet?action=listaIncidencias_V" class="dropdown-item <%= action.equals("listaIncidencias_V") ? "active" : "" %>" style="font-size: 13.5px;"><b>Lista de incidencias</b></a>
                </div>
            </div>
            <a href="<%=request.getContextPath()%>/VecinoServlet?action=preguntasFrecuentes_V" class="nav-item nav-link <%= action.equals("preguntasFrecuentes_V") ? "active" : "" %>"><i class="fa fa-question-circle me-2"></i><span style="font-size: 13.5px;"><b>Preguntas frecuentes</b></span></a>
        </div>
    </nav>
</div>
<!-- Sidebar End -->
<!-- BARRA AZUL DE LA IZQUIERDA FINAL -->
