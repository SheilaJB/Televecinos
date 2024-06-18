<%@ page import="org.example.televecinosunidos_appweb.model.beans.IncidenciasB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%
    IncidenciasB incidenciaa = (IncidenciasB) request.getAttribute("incidenciaB");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Actualización de incidencia</title>
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
    <link href="css/app.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style_incidencias.css">
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


    <!-- Sidebar Start -->
    <div class="sidebar pe-4 pb-3" style="background-color: #8ecae6;">
        <nav class="navbar" style="background-color: #8ecae6;" >

            <a class="navbar-brand mx-3 mt-3">
                <h4 style="color:#023047"><b>Televecinos Unidos</b></h4>
            </a>
            <!-- Sección del perfil del usuario en el sidebar-->
            <div class="d-flex align-items-center ms-4 mb-4"   >
                <img class="rounded-circle" src="img/Icon_perfil.png" alt="Icono del perfil del usuario" style="width: 50px; height: 50px;">
                <div class="ms-3 m-3">
                    <h6 class="mb-0" style="color:#023047;"><b>Nombre Apellido</b></h6>
                    <span class="text-muted"><b>Vecino</b></span>
                </div>
            </div>
            <!-- Fin del perfil del usuario en el sidebar-->
            <div class="navbar-nav w-100">
                <a href="<%=request.getContextPath()%>/VecinoServlet?action=inicioVecino" class="nav-item nav-link"><i class="fa fa-home me-2"></i><span style="font-size: 13.5px;"><b>Inicio</b></a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-calendar me-2"></i><span style="font-size: 13.5px;"><b>Eventos</b></a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="<%=request.getContextPath()%>/VecinoServlet?action=eventoDeporte" class="dropdown-item"><span style="font-size: 13.5px;"><b>Deporte</b></span></a>
                        <a href="<%=request.getContextPath()%>/VecinoServlet?action=eventoCultura" class="dropdown-item"><span style="fontsize: 13.5px;"><b>Cultura</b></span></a>
                        <a href="<%=request.getContextPath()%>/VecinoServlet?action=eventosInscritos" class="dropdown-item"><span style="font-size: 13.5px;"><b>Eventos inscritos</b></span></a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"><i class="fa fa-th-list me-2"></i><span style="font-size: 13.5px;"><b>Incidencias</b></a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="<%=request.getContextPath()%>/VecinoServlet?action=generarIncidencia" class="dropdown-item"><span style="font-size: 13.5px;"><b>Reportar incidencia</b></span></a>
                        <a href="<%=request.getContextPath()%>/VecinoServlet?action=listarIncidencia" class="dropdown-item"><span style="font-size: 13.5px;"><b>Lista de incidencias</b></span></a>
                    </div>
                </div>
                <a href="<%=request.getContextPath()%>/VecinoServlet?action=preguntasFrecuentes"class="nav-item nav-link "><i class="fa fa-question-circle me-2"></i><span style="font-size: 13.5px;"><b>Preguntas frecuentes</b></a>
            </div>
        </nav>
    </div>
    <!-- Sidebar End -->


    <!-- Content Start -->
    <div class="content">
        <!-- Navbar Start -->
        <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0" id="navbar">

            <a href="#" class="sidebar-toggler flex-shrink-0">
                <i class="fa fa-bars"></i>
            </a>
            <a class="navbar-brand mx-4 mb-3 d-flex align-items-center" style="padding-top: 2%;">
                <img class="rounded-circle" src="img/logo.jpg" alt="" style="width: 40px; height: 40px;">
                <h3 class="m-0 me-2 px-2" style="color:#023047;">¡Bienvenido, televecino!</h3>
            </a>
            <div class="navbar-nav align-items-center ms-auto">

                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <img class="rounded-circle me-lg-2" src="img/Icon_perfil.png" alt="" style="width: 40px; height: 40px;">
                        <span class="d-none d-lg-inline-flex"><b>Nombre Apellido</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                        <a href="<%=request.getContextPath()%>/VecinoServlet?action=verPerfil" class="dropdown-item">Mi perfil</a>
                        <a href="#" class="dropdown-item">Cerrar sesión</a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Navbar End -->
        <!-- PARTE SUPERIOR FINAL -->

        <!-- LLENAR-->
        <!-- Footer Start -->

        <form method="post" action="<%=request.getContextPath()%>/VecinoServlet?action=editarIncidencia">
            <div class="container-fluid pt-4 px-4">
                <div class="container">
                    <div class="columna columna1">
                        <div class="campo">
                            <h2>Actualizar incidencia</h2>
                            <h2 style="font-size: large;">Actualice los siguientes datos</h2>
                        </div>
                        <input type="hidden" name="idIncidencia" value="<%= incidenciaa != null ? incidenciaa.getIdIncidencias() : "" %>">
                        <div class="campo">
                            <label for="nombreIncidencia">Nombre de la incidencia:</label><br>
                            <input type="text" id="nombreIncidencia" name="nombreIncidencia" placeholder="Escribe aquí" value="<%= incidenciaa != null ? incidenciaa.getNombreIncidencia() : "" %>"><br>
                        </div>
                        <div class="campo">
                            <label for="foto">Subir foto:</label><br>
                            <input class="form-control" type="file" id="foto" accept=".jpg, .jpeg, .png" name="foto"><br>
                        </div>
                        <div class="campo" style="margin-bottom: -35px;">
                            <label for="tipoIncidencia">Tipo de incidencia:</label><br>
                            <select id="tipoIncidencia" name="TipoIncidencia_idTipoIncidencia">
                                <option value="Seguridad Pública" <%= incidenciaa != null && "Seguridad Pública".equals(incidenciaa.getTipoIncidencia()) ? "selected" : "" %>>Seguridad Pública</option>
                                <option value="Emergencia Médica" <%= incidenciaa != null && "Emergencia Médica".equals(incidenciaa.getTipoIncidencia()) ? "selected" : "" %>>Emergencia Médica</option>
                                <option value="Infraestructura y Servicios Públicos" <%= incidenciaa != null && "Infraestructura y Servicios Públicos".equals(incidenciaa.getTipoIncidencia()) ? "selected" : "" %>>Infraestructura y Servicios Públicos</option>
                                <option value="Otro" <%= incidenciaa != null && "Otro".equals(incidenciaa.getTipoIncidencia()) ? "selected" : "" %>>Otro</option>
                            </select><br>
                            <br>
                        </div>
                        <div class="campo" style="margin-bottom: -35px;">
                            <label for="urbanizacion">Urbanización:</label><br>
                            <select id="urbanizacion" name="urbanizacion_idUrbanizacion">
                                <option value="Rafael Escardó" <%= incidenciaa != null && "Rafael Escardó".equals(incidenciaa.getUrbanizacion()) ? "selected" : "" %>>Rafael Escardó</option>
                                <option value="José de La Riva Agüero" <%= incidenciaa != null && "José de La Riva Agüero".equals(incidenciaa.getUrbanizacion()) ? "selected" : "" %>>José de La Riva Agüero</option>
                                <option value="Juan XXIII" <%= incidenciaa != null && "Juan XXIII".equals(incidenciaa.getUrbanizacion()) ? "selected" : "" %>>Juan XXIII</option>
                                <option value="Libertad" <%= incidenciaa != null && "Libertad".equals(incidenciaa.getUrbanizacion()) ? "selected" : "" %>>Libertad</option>
                                <option value="Los Jardines de La Marina" <%= incidenciaa != null && "Los Jardines de La Marina".equals(incidenciaa.getUrbanizacion()) ? "selected" : "" %>>Los Jardines de La Marina</option>
                                <option value="Las Leyendas" <%= incidenciaa != null && "Las Leyendas".equals(incidenciaa.getUrbanizacion()) ? "selected" : "" %>>Las Leyendas</option>
                                <option value="Las Torres San Miguelito" <%= incidenciaa != null && "Las Torres San Miguelito".equals(incidenciaa.getUrbanizacion()) ? "selected" : "" %>>Las Torres San Miguelito</option>
                                <option value="Elmer Faucett" <%= incidenciaa != null && "Elmer Faucett".equals(incidenciaa.getUrbanizacion()) ? "selected" : "" %>>Elmer Faucett</option>
                                <option value="Maranga" <%= incidenciaa != null && "Maranga".equals(incidenciaa.getUrbanizacion()) ? "selected" : "" %>>Maranga</option>
                                <option value="Pando" <%= incidenciaa != null && "Pando".equals(incidenciaa.getUrbanizacion()) ? "selected" : "" %>>Pando</option>
                                <option value="Parques de La Huaca" <%= incidenciaa != null && "Parques de La Huaca".equals(incidenciaa.getUrbanizacion()) ? "selected" : "" %>>Parques de La Huaca</option>
                                <option value="Otro" <%= incidenciaa != null && "Otro".equals(incidenciaa.getUrbanizacion()) ? "selected" : "" %>>Otro</option>
                            </select>
                            <br>
                            <br>
                        </div>
                        <div class="form-group">
                            <label for="paraMi">La incidencia será para:</label><br>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="incidenciaPersonal" id="paraMi" value="1" <%= incidenciaa != null && incidenciaa.getIncidenciaPersonal() == 1 ? "checked" : "" %>>
                                <label class="form-check-label" for="paraMi">
                                    Para mi
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="incidenciaPersonal" id="paraOtraPersona" value="0" <%= incidenciaa != null && incidenciaa.getIncidenciaPersonal() == 0 ? "checked" : "" %>>
                                <label class="form-check-label" for="paraOtraPersona">
                                    Para otra persona
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="columna columna2" style="margin-top: 102px;">
                        <div class="campo">
                            <label for="lugarExacto">Lugar exacto</label><br>
                            <input type="text" id="lugarExacto" name="lugarExacto" placeholder="Escribe aquí" value="<%= incidenciaa != null ? incidenciaa.getLugarExacto() : "" %>"><br>
                        </div>
                        <div class="campo">
                            <label for="referencia">Referencia</label><br>
                            <input type="text" id="referencia" name="referencia" placeholder="Escribe aquí" value="<%= incidenciaa != null ? incidenciaa.getReferencia() : "" %>"><br>
                        </div>
                        <div class="campo">
                            <label for="contacto">Contacto (opcional)</label><br>
                            <input type="text" id="contacto" name="numeroContacto" placeholder="Escribe aquí" value="<%= incidenciaa != null ? incidenciaa.getNumeroContacto() : "" %>"><br>
                        </div>
                        <div class="campo">
                            <label>¿Requiere ambulancia?</label><br>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="ambulancia" id="gridRadios1" value="1" <%= incidenciaa != null && incidenciaa.getAmbulancia() == 1 ? "checked" : "" %>>
                                <label class="form-check-label" for="gridRadios1">
                                    Sí
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="ambulancia" id="gridRadios2" value="0" <%= incidenciaa != null && incidenciaa.getAmbulancia() == 0 ? "checked" : "" %>>
                                <label class="form-check-label" for="gridRadios2">
                                    No
                                </label>
                            </div>
                        </div>
                        <div class="m-n2">
                            <button type="submit" class="btn btn-secondary m-2">Actualizar incidencia</button>
                            <a href="<%=request.getContextPath()%>/VecinoServlet?action=listarIncidencia"><button type="button" class="btn btn-danger m-2">Cancelar</button></a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light rounded-top p-4">
                <div class="row">
                    <div class="col-12 col-sm-6 text-center text-sm-start">
                        &copy; <a href="#">TelevecinosUnidos</a>, All Right Reserved.
                    </div>
                </div>
            </div>
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