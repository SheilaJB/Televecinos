<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.televecinosunidos_appweb.model.beans.IncidenciasB" %>
<%@ page import="java.util.Optional" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Ver incidencia</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style_vec.css" rel="stylesheet">

</head>

<body>
<div class="container-xxl position-relative bg-white d-flex p-0">
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- BARRA AZUL DE LA IZQUIERDA INICIO-->
    <!-- Sidebar Start -->
    <div class="sidebar pe-4 pb-3" style="background-color: #8ecae6;">
        <nav class="navbar" style="background-color: #8ecae6;" >
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
                <a href="<%=request.getContextPath()%>/VistaServlet?idVista=inicioCoordinador" class="nav-item nav-link "><i class="fa fa-home me-2"></i><span style="font-size: 13.5px;"><b>Inicio</b></span></a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-calendar me-2"></i><span style="font-size: 13.5px;"><b>Eventos</b></span></a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="<%=request.getContextPath()%>/VistaServlet?idVista=eventoGeneralesC" class="dropdown-item"><span style="font-size: 13.5px;"><b>Eventos generales</b></span></a>
                        <a href="<%=request.getContextPath()%>/VistaServlet?idVista=creacionEventoC"  class="dropdown-item"><span style="font-size: 13.5px;"><b>Crear evento</b></span></a>
                        <a href="<%=request.getContextPath()%>/CoordinadorServlet"  class="dropdown-item"><span style="font-size: 13.5px;"><b>Eventos propios</b></span></a>
                    </div>
                </div>

                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle " data-bs-toggle="dropdown"><i class="fa fa-th-list me-2"></i><span style="font-size: 13.5px;"><b>Incidencias</b></span></a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="<%=request.getContextPath()%>/CoordIncidServlet?action=generarIncidenciaC" class="dropdown-item"><span style="font-size: 13.5px;"><b>Crear incidencia</b></span></a>
                        <a href="<%=request.getContextPath()%>/CoordIncidServlet?action=listarIncidencia" class="dropdown-item"><span style="font-size: 13.5px;"><b>Lista de incidencias</b></span></a>
                    </div>
                </div>
                <a href="<%=request.getContextPath()%>/VistaServlet?idVista=preguntasFrecuentesC" class="nav-item nav-link font-al"><i class="fa fa-question-circle me-2" ></i><span style="font-size: 13.5px;"><b>Preguntas frecuentes</b></span></a>
            </div>
        </nav>
    </div>
    <!-- Sidebar End -->


    <!-- Content Start -->
    <div class="content">
        <!-- Navbar Start -->
        <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
            <a href="#" class="sidebar-toggler flex-shrink-0">
                <i class="fa fa-bars"></i>
            </a>
            <a class="navbar-brand mx-4 mb-3 d-flex align-items-center" style="padding-top: 2%;">
                <img class="rounded-circle" src="img/logo.jpg" alt="" style="width: 40px; height: 40px;">
                <h3 class="m-0 me-2 px-2" style="color:#023047;">¡Bienvenido, coordinador!</h3>
            </a>
            <div class="navbar-nav align-items-center ms-auto">

                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <img class="rounded-circle me-lg-2" src="img/coordinadora.jpg" alt="" style="width: 40px; height: 40px;">
                        <span class="d-none d-lg-inline-flex" style="color:#023047;"><b>Nombre Apellido</b></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                        <a href="<%=request.getContextPath()%>/VistaServlet?idVista=perfilC" class="dropdown-item">Mi perfil</a>
                        <a href="<%=request.getContextPath()%>/VistaServlet?idVista=Index" class="dropdown-item">Cerrar sesión</a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Navbar End -->
        <!-- PARTE SUPERIOR FINAL -->

        <!-- LLENAR-->
        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="campo">
                            <h2>Ver información de la incidencia</h2>
                        </div>
                        <form>
                            <div class="card shadow-sm" >
                                <div class="card-header text-lg-center" ">
                                    <h5>Información de la Incidencia</h5>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <img id="preview" src="#" alt="Vista previa de la imagen" class="img-thumbnail" style="display: none;">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label class="form-label" style="color:#023047;"><b>Nombre de la incidencia</b></label>
                                            <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                                <%= request.getAttribute("incidencia") != null ? ((IncidenciasB) request.getAttribute("incidencia")).getNombreIncidencia() : "" %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label class="form-label" style="color:#023047;"><b>Tipo de incidencia</b></label>
                                            <div class="bar p-2 bg-light rounded" data-label="Tipo de incidencia">
                                                <%= request.getAttribute("incidencia") != null ? ((IncidenciasB) request.getAttribute("incidencia")).getTipoIncidencia() : "" %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label class="form-label" style="color:#023047;"><b>La incidencia es para:</b></label>
                                            <div class="bar p-2 bg-light rounded" data-label="La incidencia es para">
                                                <%= request.getAttribute("incidencia") != null && ((IncidenciasB) request.getAttribute("incidencia")).getIncidenciaPersonal() == 1 ? "Para otra persona" : "Personal" %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label class="form-label" style="color:#023047;"><b>Lugar exacto:</b></label>
                                            <div class="bar p-2 bg-light rounded" data-label="Lugar exacto">
                                                <%= request.getAttribute("incidencia") != null ? ((IncidenciasB) request.getAttribute("incidencia")).getLugarExacto() : "" %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label class="form-label" style="color:#023047;"><b>Referencia</b></label>
                                            <div class="bar p-2 bg-light rounded" data-label="Referencia">
                                                <%= request.getAttribute("incidencia") != null ? ((IncidenciasB) request.getAttribute("incidencia")).getReferencia() : "" %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label class="form-label" style="color:#023047;"><b>Contacto</b></label>
                                            <div class="bar p-2 bg-light rounded" data-label="Contacto">
                                                <%= request.getAttribute("incidencia") != null ? ((IncidenciasB) request.getAttribute("incidencia")).getNumeroContacto() : "" %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label class="form-label" style="color:#023047;"><b>¿Se requiere ambulancia?</b></label>
                                            <div class="bar p-2 bg-light rounded" data-label="¿Se requiere ambulancia?">
                                                <%= request.getAttribute("incidencia") != null && ((IncidenciasB) request.getAttribute("incidencia")).getAmbulancia() == 1 ? "Sí" : "No" %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label class="form-label" style="color:#023047;"><b>Fecha y hora de la generación de incidencia:</b></label>
                                            <div class="bar p-2 bg-light rounded" data-label="Fecha y hora de la generación de incidencia">
                                                <%= request.getAttribute("incidencia") != null ? ((IncidenciasB) request.getAttribute("incidencia")).getFecha() + " a las " + ((IncidenciasB) request.getAttribute("incidencia")).getHora() : "" %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-6" style="margin-top: 85px;">
                        <form>
                            <label class="form-label"><b>Foto del incidente</b></label>
                            <div class="rounded h-100 p-4"style="background-color: #ffb703;">
                                <div class="mb-3">
                                    <img src="<%= request.getAttribute("incidencia") != null ? ((IncidenciasB) request.getAttribute("incidencia")).getFoto() : "img/default.jpg" %>" class="img-responsive" alt="" style="width: 100%; height: auto;" />
                                </div>
                            </div>

                            <div class="d-flex justify-content-end">
                                <a href="<%=request.getContextPath()%>/CoordIncidServlet?action=listarIncidencia">
                                    <button type="button" class="btn btn-secondary m-2 d-flex justify-content-between align-items-center">Regresar</button>
                                </a>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4" >
            <div class="bg-light rounded-top p-4">
                <div class="row">
                    <div class="col-12 col-sm-6 text-center text-sm-start">
                        &copy; <a href="#">TelevecinosUnidos</a>, All Right Reserved.
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->
    </div>
    <!-- Content End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="lib/chart/chart.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="lib/tempusdominus/js/moment.min.js"></script>
<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>
