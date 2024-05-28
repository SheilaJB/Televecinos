<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>DASHMIN - Bootstrap Admin Template</title>
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


    <!-- Sidebar Start -->
    <div class="sidebar pe-4 pb-3" style="background-color: #8ecae6;">
        <nav class="navbar" style="background-color: #8ecae6;" >
            <a class="navbar-brand mx-3 mt-3">
                <h4 style="color:#023047"><b>Televecinos Unidos</b></h4>
            </a>
            <div class="d-flex align-items-center ms-4 mb-4"  >
                <img class="rounded-circle" src="img/serenazgo.jpg" alt="" style="width: 50px; height: 50px;">
                <div class="ms-3 m-3" >
                    <h6 class="mb-0" style="color:#023047;"><b>Nombre Apellido</b></h6>
                    <span class="text-muted"><b>Serenazgo</b></span>
                </div>
            </div>
            <div class="navbar-nav w-100">
                <a href="inicioSerenazgo.html" class="nav-item nav-link "><i class="fa fa-home me-2"></i><span style="font-size: 13.5px;"><b>Inicio</b></a>
                <a href="Dashboard.html"class="nav-item nav-link "><i class="fa fa-chart-bar me-2"></i><span style="font-size: 13.5px;"><b>Dashboard</b></a>
                <a href="listaIncidencias_S.html" class="nav item nav-link"><i class="fa fa-th-list me-2"></i><span style="font-size: 13.5px;"><b>Incidencias</b></a>
                <a href="BanVecino.html"class="nav-item nav-link active"><i class="fa fa-ban me-2"></i><span style="font-size: 13.5px;"><b>Banear vecino</b></a>
                <a href="preguntasFrecuentes_S.html"class="nav-item nav-link "><i class="fa fa-question-circle me-2"></i><span style="font-size: 13.5px;"><b>Preguntas frecuentes</b></a>
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
            <a class="navbar-brand mx-4 mb-3 d-flex align-items-center" style = "padding-top: 2%;">
                <img class="rounded-circle" src="img/logo.jpg" alt="" style="width: 40px; height: 40px;">
                <h3 class="m-0 me-2 px-2" style="color:#023047;">¡Bienvenido, serenazgo!</h3>
            </a>

            <div class="navbar-nav align-items-center ms-auto">

                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <img class="rounded-circle me-lg-2" src="img/serenazgo.jpg" alt="" style="width: 40px; height: 40px;">
                        <span class="d-none d-lg-inline-flex" style="color:#023047;"><b>Nombre Apellido</b></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                        <a href="perfil_S.html" class="dropdown-item">Mi perfil</a>
                        <a href="index.html" class="dropdown-item">Cerrar Sesión</a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Navbar End -->


        <div id="Nombre del evento">
            <h3 style="text-align: left; margin-top:20px;margin-bottom:20px;padding: 20px">Registro de vecinos</h3>
        </div>
        <div style="background-color: #f8f9fa; padding: 20px; align-items: center;">
            <!--Filtro-->
            <div class="filtro" style="border: 1px solid #ccc; border-radius: 5px; padding: 10px; display: flex; align-items: center; background-color:#FFB703 ;">
                <input type="text" style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; width: 90%; margin-right: 2%;" id="filtroInput" placeholder="Buscar...">

                <!-- Alineación del botón con los selects -->
                <button type="button" class="btn btn-primary" onclick="filtrar()" style="padding: 10px;"><b>Buscar</b></button>
            </div>
            <div class="bg-light rounded h-100 p-4" style="font-weight: bold;">
                <div class="table-responsive">
                    <table class="table" style="background-color: transparent;">
                        <thead>
                        <tr>
                            <th scope="col">N°</th>
                            <th scope="col">Foto</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Apellido</th>
                            <th style="text-align: center;" scope="col">N° incidencias falsas</th>
                            <th style="text-align: center;" scope="col">Banear</th>
                        </tr>
                        </thead>
                        <tbody>

                        <tr>
                            <th scope="row">1</th>
                            <th><img class="rounded-circle" src="img/serenazgo.jpg"style="width: 50px; height: 50px;"></th>
                            <td>Carlos</td>
                            <td>Morales</td>
                            <td style="text-align: center;">4</td>
                            <td style="text-align: center;">
                                <button type="button" class="btn btn-info m-2" style="background-color:transparent; border: none" onclick="confirmarEliminacion()">
                                    <i class="fas fa-ban"></i> <!-- Ícono de ban de FontAwesome -->
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <th><img class="rounded-circle" src="img/serenazgo.jpg"style="width: 50px; height: 50px;"></th>
                            <td>Carlos</td>
                            <td>Morales</td>
                            <td style="text-align: center;">1</td>
                            <td style="text-align: center;">
                                <button type="button" class="btn btn-info m-2" style="background-color:transparent; border: none" onclick="confirmarEliminacion()">
                                    <i class="fas fa-ban"></i> <!-- Ícono de ban de FontAwesome -->
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <th><img class="rounded-circle" src="img/Icon_perfil.png"style="width: 50px; height: 50px;"></th>
                            <td>Carlos</td>
                            <td>Morales</td>
                            <td style="text-align: center;">0</td>
                            <td style="text-align: center;">
                                <button type="button" class="btn btn-info m-2" style="background-color:transparent; border: none" onclick="confirmarEliminacion()">
                                    <i class="fas fa-ban"></i> <!-- Ícono de ban de FontAwesome -->
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">4</th>
                            <th><img class="rounded-circle" src="img/Icon_perfil.png"style="width: 50px; height: 50px;"></th>
                            <td>Carlos</td>
                            <td>Morales</td>
                            <td style="text-align: center;">3</td>
                            <td style="text-align: center;">
                                <button type="button" class="btn btn-info m-2" style="background-color:transparent; border: none" onclick="confirmarEliminacion()">
                                    <i class="fas fa-ban"></i> <!-- Ícono de ban de FontAwesome -->
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">5</th>
                            <th><img class="rounded-circle" src="img/Icon_perfil.png"style="width: 50px; height: 50px;"></th>
                            <td>Carlos</td>
                            <td>Morales</td>
                            <td style="text-align: center;">0</td>
                            <td style="text-align: center;">
                                <button type="button" class="btn btn-info m-2" style="background-color:transparent; border: none" onclick="confirmarEliminacion()">
                                    <i class="fas fa-ban"></i> <!-- Ícono de ban de FontAwesome -->
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">6</th>
                            <th><img class="rounded-circle" src="img/Icon_perfil.png"style="width: 50px; height: 50px;"></th>
                            <td>Carlos</td>
                            <td>Morales</td>
                            <td style="text-align: center;">0</td>
                            <td style="text-align: center;">
                                <button type="button" class="btn btn-info m-2" style="background-color:transparent; border: none" onclick="confirmarEliminacion()">
                                    <i class="fas fa-ban"></i> <!-- Ícono de ban de FontAwesome -->
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">7</th>
                            <th><img class="rounded-circle" src="img/Icon_perfil.png"style="width: 50px; height: 50px;"></th>
                            <td>Carlos</td>
                            <td>Morales</td>
                            <td style="text-align: center;">0</td>
                            <td style="text-align: center;">
                                <button type="button" class="btn btn-info m-2" style="background-color:transparent; border: none" onclick="confirmarEliminacion()">
                                    <i class="fas fa-ban"></i> <!-- Ícono de ban de FontAwesome -->
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">8</th>
                            <th><img class="rounded-circle" src="img/Icon_perfil.png"style="width: 50px; height: 50px;"></th>
                            <td>Carlos</td>
                            <td>Morales</td>
                            <td style="text-align: center;">5</td>
                            <td style="text-align: center;">
                                <button type="button" class="btn btn-info m-2" style="background-color:transparent; border: none" onclick="confirmarEliminacion()">
                                    <i class="fas fa-ban"></i> <!-- Ícono de ban de FontAwesome -->
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">9</th>
                            <th><img class="rounded-circle" src="img/Icon_perfil.png"style="width: 50px; height: 50px;"></th>
                            <td>Carlos</td>
                            <td>Morales</td>
                            <td style="text-align: center;">1</td>
                            <td style="text-align: center;">
                                <button type="button" class="btn btn-info m-2" style="background-color:transparent; border: none" onclick="confirmarEliminacion()">
                                    <i class="fas fa-ban"></i> <!-- Ícono de ban de FontAwesome -->
                                </button>
                            </td>
                        </tr>

                        </tbody>
                    </table>


                    <!--Paginación de la lista-->
                    <div  style="display: flex; justify-content: center; align-items: center;">
                        <section class="paginacion" >
                            <ul style="list-style: none;padding: 0;margin: 0;display: flex;">
                                <div style="background-color: white ; padding: 5px; margin:10px">
                                    <li style="margin: 0 5px;"><a class="link-opacity-50-hover" class="link-opacity-50-hover" href="#" class="active">1</a></li>
                                </div>
                                <div style="background-color:white ; padding: 5px;margin:10px">
                                    <li style="margin: 0 5px;"><a class="link-opacity-50-hover" class="link-opacity-50-hover" href="#" class="active">2</a></li>
                                </div>
                                <div style="background-color: white ; padding: 5px;margin:10px">
                                    <li style="margin: 0 5px;"><a class="link-opacity-50-hover" class="link-opacity-50-hover" href="#" class="active">3</a></li>
                                </div>
                            </ul>
                        </section>
                    </div>
                </div>


                <!---Falta funcionalidad---->
                <script src="js/listaVecinos.js"></script>

            </div>

        </div>
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