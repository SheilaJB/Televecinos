
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String action = request.getParameter("action");
    if (action == null) {
        action = "inicioCoordinador"; //pestaña por defecto
    }
%>
<!-- Sidebar Start -->
<div class="sidebar pe-4 pb-3" style="background-color: #8ecae6;">
    <nav  class="navbar" style="background-color: #8ecae6;" >
        <a class="navbar-brand mx-3 mt-3">
            <h4 style="color:#023047"><b>Televecinos Unidos</b></h4>
        </a>
        <div class="d-flex align-items-center ms-4 mb-4"  >
            <img class="rounded-circle" src="img/coordinadora.jpg" alt="" style="width: 50px; height: 50px;">
            <div class="ms-3 m-3" >
                <h6 class="mb-0" style="color:#023047;"><b>Nombre Apellido</b></h6>
                <span class="text-muted"><b>Coordinador</b></span>
            </div>
        </div>
        <div class="navbar-nav w-100">
            <a href="<%=request.getContextPath()%>/VistaServlet?idVista=inicioCoordinador" class="nav-item nav-link"><i class="fa fa-home me-2"></i><span style="font-size: 13.5px;"><b>Inicio</b></span></a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-calendar me-2"></i><span style="font-size: 13.5px;"><b>Eventos</b></span></a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="<%=request.getContextPath()%>/VistaServlet?idVista=eventoGeneralesC" class="dropdown-item"><span style="font-size: 13.5px;"><b>Eventos generales</b></span></a>
                    <a href="<%=request.getContextPath()%>/VistaServlet?idVista=creacionEventoC" class="dropdown-item"><span style="font-size: 13.5px;"><b>Crear evento</b></span></a>
                    <a href="<%=request.getContextPath()%>/CoordinadorServlet" class="dropdown-item"><span style="font-size: 13.5px;"><b>Eventos propios</b></span></a>
                </div>
            </div>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"><i class="fa fa-th-list me-2"></i><span style="font-size: 13.5px;"><b>Incidencias</b></span></a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="<%=request.getContextPath()%>/VistaServlet?idVista=generarIncidenciaC" class="dropdown-item"><span style="font-size: 13.5px;"><b>Crear incidencia</b></span></a>
                    <a href="<%=request.getContextPath()%>/VistaServlet?idVista=listaIncidenciaC" class="dropdown-item"><span style="font-size: 13.5px;"><b>Lista de incidencias</b></span></a>
                </div>
            </div>
            <a href="<%=request.getContextPath()%>/VistaServlet?idVista=preguntasFrecuentesC" class="nav-item nav-link font-al"><i class="fa fa-question-circle me-2" ></i><span style="font-size: 13.5px;"><b>Preguntas frecuentes</b></span></a>
        </div>
    </nav>
</div>
<!-- Sidebar End -->
