<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String action = request.getParameter("action");
    if (action == null) {
        action = "inicioSerenazgo"; //pestaña por defecto
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
            <img class="rounded-circle" src="img/serenazgo.jpg" alt="" style="width: 50px; height: 50px;">
            <div class="ms-3 m-3">
                <h6 class="mb-0" style="color:#023047;"><b>Nombre Apellido</b></h6>
                <span class="text-muted"><b>Serenazgo</b></span>
            </div>
        </div>
        <div class="navbar-nav w-100">
            <a href="<%=request.getContextPath()%>/SerenazgoServlet?action=inicioSerenazgo" class="nav-item nav-link <%= action.equals("inicioSerenazgo") ? "active" : "" %>"><i class="fa fa-home me-2"></i><span style="font-size: 13.5px;"><b>Inicio</b></span></a>
            <a href="<%=request.getContextPath()%>/SerenazgoServlet?action=dashboard" class="nav-item nav-link <%= action.equals("dashboard") ? "active" : "" %>"><i class="fa fa-chart-bar me-2"></i><span style="font-size: 13.5px;"><b>Dashboard</b></span></a>
            <a href="<%=request.getContextPath()%>/SerenazgoServlet?action=listaIncidencias_S" class="nav-item nav-link <%= action.equals("listaIncidencias_S") ? "active" : "" %>"><i class="fa fa-th-list me-2"></i><span style="font-size: 13.5px;"><b>Incidencias</b></span></a>
            <a href="<%=request.getContextPath()%>/SerenazgoServlet?action=banVecino" class="nav-item nav-link <%= action.equals("banVecino") ? "active" : "" %>"><i class="fa fa-ban me-2"></i><span style="font-size: 13.5px;"><b>Banear vecino</b></span></a>
            <a href="<%=request.getContextPath()%>/SerenazgoServlet?action=preguntasFrecuentes_S" class="nav-item nav-link <%= action.equals("preguntasFrecuentes_S") ? "active" : "" %>"><i class="fa fa-question-circle me-2"></i><span style="font-size: 13.5px;"><b>Preguntas frecuentes</b></span></a>
        </div>
    </nav>
</div>
<!-- Sidebar End -->
<!-- BARRA AZUL DE LA IZQUIERDA FINAL -->
