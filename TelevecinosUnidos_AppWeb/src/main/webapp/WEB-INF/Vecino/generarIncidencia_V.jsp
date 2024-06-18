<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.televecinosunidos_appweb.model.beans.IncidenciasB" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Ver Incidencia</title>
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
        <nav class="navbar" style="background-color: #8ecae6;">
            <a class="navbar-brand mx-3 mt-3">
                <h4 style="color:#023047"><b>Televecinos Unidos</b></h4>
            </a>
            <div class="d-flex align-items-center ms-4 mb-4">
                <img class="rounded-circle" src="img/Icon_perfil.png" alt="Icono del perfil del usuario" style="width: 50px; height: 50px;">
                <div class="ms-3 m-3">
                    <h6 class="mb-0" style="color:#023047;"><b>Nombre Apellido</b></h6>
                    <span class="text-muted"><b>Vecino</b></span>
                </div>
            </div>
            <div class="navbar-nav w-100">
                <a href="<%=request.getContextPath()%>/VecinoServlet?action=inicioVecino" class="nav-item nav-link"><i class="fa fa-home me-2"></i><span style="font-size: 13.5px;"><b>Inicio</b></span></a>
                <div class="navbar-nav w-100">
                    <a href="<%=request.getContextPath()%>/VecinoServlet?action=inicioVecino" class="nav-item nav-link active"><i class="fa fa-home me-2"></i><span style="font-size: 13.5px;"><b>Inicio</b></a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle " data-bs-toggle="dropdown"><i class="fa fa-calendar me-2"></i><span style="font-size: 13.5px;"><b>Eventos</b></a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="<%=request.getContextPath()%>/VecinoServlet?action=eventoDeporte" class="dropdown-item"><span style="font-size: 13.5px;"><b>Deporte</b></a>
                            <a href="<%=request.getContextPath()%>/VecinoServlet?action=eventoCultura" class="dropdown-item "><span style="font-size: 13.5px;"><b>Cultura</b></a>
                            <a href="<%=request.getContextPath()%>/VecinoServlet?action=eventosInscritos" class="dropdown-item"><span style="font-size: 13.5px;"><b>Eventos inscritos</b></a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-th-list me-2"></i><span style="font-size: 13.5px;"><b>Incidencias</b></a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="<%=request.getContextPath()%>/VecinoServlet?action=generarIncidencia" class="dropdown-item"><span style="font-size: 13.5px;"><b>Crear Incidencia</b></a>
                            <a href="<%=request.getContextPath()%>/VecinoServlet?action=listarIncidencia" class="dropdown-item"><span style="font-size: 13.5px;"><b>Lista de incidencias</b></a>
                        </div>
                    </div>
                    <a href="<%=request.getContextPath()%>/VecinoServlet?action=preguntasFrecuentes" class="nav-item nav-link "><i class="fa fa-question-circle me-2"></i><span style="font-size: 13.5px;"><b>Preguntas frecuentes</b></a>
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
                <h3 class="m-0 me-2 px-2" style="color:#023047;">¡Bienvenido, televecino!</h3>
            </a>
            <div class="navbar-nav align-items-center ms-auto">
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <img class="rounded-circle me-lg-2" src="img/Icon_perfil.png" alt="" style="width: 40px; height: 40px;">
                        <span class="d-none d-lg-inline-flex"><b>Nombre Apellido</b></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                        <a href="<%=request.getContextPath()%>/VecinoServlet?action=perfilVecino" class="dropdown-item">Mi perfil</a>
                        <a href="index.html" class="dropdown-item">Cerrar sesión</a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Navbar End -->

        <!-- LLENAR-->
        <form method="post" action="<%=request.getContextPath()%>/VecinoServlet?action=crear">
            <div class="container-fluid pt-4 px-4">
                <div class="container">
                    <div class="columna columna1">
                        <div class="campo">
                            <h2>Reportar incidencia</h2>
                            <h2 style="font-size: large;">Complete los siguientes datos</h2>
                        </div>
                        <div class="campo">
                            <label for="nombreIncidencia">Nombre de la incidencia:</label><br>
                            <input type="text" id="nombreIncidencia" name="nombreIncidencia" placeholder="Escribe aquí"><br>
                        </div>
                        <div class="campo">
                            <label for="foto">Subir foto:</label><br>
                            <input class="form-control" type="file" id="foto" accept=".jpg, .jpeg, .png" name="foto"><br>
                        </div>
                        <div class="campo" style="margin-bottom: -35px;">
                            <label for="tipoIncidencia">Tipo de incidencia:</label><br>
                            <select id="tipoIncidencia" name="TipoIncidencia_idTipoIncidencia">
                                <option value="1">Seguridad Pública</option>
                                <option value="2">Emergencia Médica</option>
                                <option value="3">Infraestructura y Servicios Públicos</option>
                                <option value="4">Otro</option>
                            </select><br>
                            <br>
                        </div>
                        <div class="campo" style="margin-bottom: -35px;">
                            <label for="urbanizacion">Urbanización:</label><br>
                            <select id="urbanizacion" name="urbanizacion_idUrbanizacion">
                                <option value="1">Rafael Escardó</option>
                                <option value="2">José de La Riva Agüero</option>
                                <option value="3">Juan XXIII</option>
                                <option value="4">Libertad</option>
                                <option value="5">Los Jardines de La Marina</option>
                                <option value="6">Las Leyendas</option>
                                <option value="7">Las Torres San Miguelito</option>
                                <option value="8">Elmer Faucett</option>
                                <option value="9">Maranga</option>
                                <option value="10">Pando</option>
                                <option value="11">Parques de La Huaca</option>
                                <option value="12">Otro</option>
                            </select>
                            <br>
                            <br>
                        </div>
                        <div class="form-group">
                            <label for="paraMi">La incidencia será para:</label><br>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="incidenciaPersonal" id="paraMi" value="1">
                                <label class="form-check-label" for="paraMi">
                                    Para mi
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="incidenciaPersonal" id="paraOtraPersona" value="0">
                                <label class="form-check-label" for="paraOtraPersona">
                                    Para otra persona
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="columna columna2" style="margin-top: 102px;">
                        <div class="campo">
                            <label for="lugarExacto">Lugar exacto</label><br>
                            <input type="text" id="lugarExacto" name="lugarExacto" placeholder="Escribe aquí"><br>
                        </div>
                        <div class="campo">
                            <label for="referencia">Referencia</label><br>
                            <input type="text" id="referencia" name="referencia" placeholder="Escribe aquí"><br>
                        </div>
                        <div class="campo">
                            <label for="contacto">Contacto (opcional)</label><br>
                            <input type="text" id="contacto" name="numeroContacto" placeholder="Escribe aquí"><br>
                        </div>
                        <div class="campo">
                            <label>¿Requiere ambulancia?</label><br>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="ambulancia" id="gridRadios1" value="1">
                                <label class="form-check-label" for="gridRadios1">
                                    Sí
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="ambulancia" id="gridRadios2" value="0">
                                <label class="form-check-label" for="gridRadios2">
                                    No
                                </label>
                            </div>
                        </div>
                        <div class="m-n2">
                            <button type="submit" class="btn btn-secondary m-2">Reportar incidencia</button>
                        </div>

                    </div>
                </div>
            </div>
        </form>
        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
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
