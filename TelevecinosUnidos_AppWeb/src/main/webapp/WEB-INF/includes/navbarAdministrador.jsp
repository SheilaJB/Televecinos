<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Navbar Start -->
<nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
    <a href="#" class="sidebar-toggler flex-shrink-0">
        <i class="fa fa-bars"></i>
    </a>
    <a class="navbar-brand mx-4 mb-3 d-flex align-items-center" style="padding-top: 2%;">
        <img class="rounded-circle" src="img/logo.jpg" alt="" style="width: 40px; height: 40px;">
        <h3 class="m-0 me-2 px-2" style="color:#023047;">¡Bienvenido, administrador!</h3>
    </a>
    <div class="navbar-nav align-items-center ms-auto">
        <div class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                <img class="rounded-circle me-lg-2" src="img/munisanmiguelLogo.jpg" alt="" style="width: 40px; height: 40px;">
                <span class="d-none d-lg-inline-flex" style="color:#023047;"><b>Administrador Televecinos</b></span>
            </a>
            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                <a href="<%=request.getContextPath()%>/AdministradorServlet?action=perfil_A" class="dropdown-item">Mi perfil</a>
                <a href="<%=request.getContextPath()%>/LoginServlet?action=logout" class="dropdown-item">Cerrar sesión</a>
            </div>
        </div>
    </div>
</nav>
<!-- Navbar End -->
