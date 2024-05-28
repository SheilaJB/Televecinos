<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <title>Lista de incidencias</title>
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
    <div class="sidebar pe-4 pb-3 colorBarraLateral">
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
                <a href="inicioVecino.html" class="nav-item nav-link"><i class="fa fa-home me-2"></i><span style="font-size: 13.5px;"><b>Inicio</b></a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-calendar me-2"></i><span style="font-size: 13.5px;"><b>Eventos</b></a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="Evento-D-Vecino.html" class="dropdown-item"><span style="font-size: 13.5px;"><b>Deporte</b></a>
                        <a href="Evento-C-Vecino.html" class="dropdown-item"><span style="font-size: 13.5px;"><b>Cultura</b></a>
                        <a href="ListaEvent-Vecino.html" class="dropdown-item"><span style="font-size: 13.5px;"><b>Eventos inscritos</b></a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"><i class="fa fa-th-list me-2"></i><span style="font-size: 13.5px;"><b>Incidencias</b></a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="generarIncidencia_V.html" class="dropdown-item"><span style="font-size: 13.5px;"><b>Generar incidencia</b></a>
                        <a href="listaIncidencias_V.html" class="dropdown-item active"><span style="font-size: 13.5px;"><b>Lista de incidencias</b></a>
                    </div>
                </div>
                <a href="preguntasFrecuentes_V.html"class="nav-item nav-link "><i class="fa fa-question-circle me-2"></i><span style="font-size: 13.5px;"><b>Preguntas frecuentes</b></a>
            </div>
        </nav>
    </div>
    <!-- BARRA AZUL DE LA IZQUIERDA FINAL -->


    <!-- Content Start -->
    <div class="content">
        <!-- PARTE SUPERIOR INICIO -->
        <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0"">

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
                    <span class="d-none d-lg-inline-flex" style="color:#023047;"><b>Nombre Apellido</b></span>
                </a>
                <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                    <a href="#" class="dropdown-item itemperfil">Mi perfil</a>
                    <a href="login/login.html" class="dropdown-item itemperfil">Cerrar Sesión</a>
                </div>
            </div>
        </div>
        </nav>
        <!-- PARTE SUPERIOR FINAL -->



        <!-- LLENAR-->

        <!-- Bootstrap JS dependencies -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <div id="Nombre del evento">
            <h3 style="text-align: left; margin-top:20px;margin-bottom:20px;padding: 20px">Lista de incidencias</h3>
        </div>
        <div style="background-color: #f8f9fa; padding: 20px; align-items: center;">
            <!-- Filtro -->
            <div style="background-color: #FFB703 ; padding: 20px; border: 1px solid #ccc; border-radius: 5px;">
                <div class="row justify-content-center align-items-center">
                    <div class="col-md-4 mb-2">
                        <input type="text" class="form-control" id="filtroInput" placeholder="Buscar...">
                    </div>
                    <div class="col-md-2 mb-2">
                        <input type="date" class="form-control" id="filtroFecha">
                    </div>
                    <div class="col-md-2 mb-2">
                        <select id="filtroIncidencia" class="form-select">
                            <option selected disabled>Tipo de Incidencia:</option>
                            <option value="tipo1">Seguridad Publica</option>
                            <option value="tipo2">Emergencia pública</option>
                            <option value="tipo3">Infraestructura y Servicios Públicos</option>
                            <option value="tipo3">Otro</option>
                        </select>
                    </div>
                    <div class="col-md-2 mb-2">
                        <select id="filtroEstado"  class="form-select">
                            <option selected disabled>Estado</option>
                            <option value="pendiente">Pendiente</option>
                            <option value="enCurso">En curso</option>
                            <option value="cancelado">Cancelado</option>
                            <option value="rechazado">Rechazado</option>
                            <option value="procesado">Procesado</option>
                        </select>
                    </div>
                    <div class="col-md-2 mb-2">
                        <button type="button" class="btn btn-primary w-100" onclick="filtrar()"><b>Filtrar</b></button>
                    </div>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table" style="background-color: transparent;">
                    <thead>
                    <tr>
                        <th scope="col">Nombre de la incidencia</th>
                        <th scope="col">Fecha</th>
                        <th scope="col">Hora</th>
                        <th scope="col">Tipo</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Editar</th>
                        <th scope="col">Ver</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Incidencia 1</td>
                        <td>21-Enero</td>
                        <td>17:53</td>
                        <th scope="col">Seguridad pública</th>
                        <td>Pendiente</td>
                        <td>
                            <a href="actualizarIncidencia_V.html">
                                <button type="button" class="btn btn-success m-2" onclick="editEvent(1)">
                                    <i class="fas fa-pencil-alt"></i> <!-- Ícono de lápiz de FontAwesome -->
                                </button>
                            </a>
                        </td>
                        <td>
                            <a href="verInicidencia_V.html">
                                <button type="button" class="btn btn-primary m-2" onclick="editEvent(1)">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>Incidencia 2</td>
                        <td>21-Enero</td>
                        <td>17:53</td>
                        <th scope="col">Infraestructura y Servicios Públicos</th>
                        <td>Procesado</td>
                        <td>
                            <a href="actualizarIncidencia_V.html">
                                <button type="button" class="btn btn-success m-2" onclick="editEvent(1)">
                                    <i class="fas fa-pencil-alt"></i> <!-- Ícono de lápiz de FontAwesome -->
                                </button>
                            </a>
                        </td>
                        <td>
                            <a href="verInicidencia_V.html">
                                <button type="button" class="btn btn-primary m-2" onclick="editEvent(1)">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </a>
                        </td>
                    </tr>

                    <tr>
                        <td>Incidencia 3</td>
                        <td>21-Enero</td>
                        <td>17:53</td>
                        <th scope="col">Seguridad pública</th>
                        <td>Rechazado</td>
                        <td>
                            <a href="actualizarIncidencia_V.html">
                                <button type="button" class="btn btn-success m-2" onclick="editEvent(1)">
                                    <i class="fas fa-pencil-alt"></i> <!-- Ícono de lápiz de FontAwesome -->
                                </button>
                            </a>
                        </td>
                        <td>
                            <a href="verInicidencia_V.html">
                                <button type="button" class="btn btn-primary m-2" onclick="editEvent(1)">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </a>
                        </td>
                    </tr>

                    <tr>
                        <td>Incidencia 4</td>
                        <td>21-Enero</td>
                        <td>17:53</td>
                        <th scope="col">Emergencia pública</th>
                        <td>Cancelado</td>
                        <td>
                            <a href="actualizarIncidencia_V.html">
                                <button type="button" class="btn btn-success m-2" onclick="editEvent(1)">
                                    <i class="fas fa-pencil-alt"></i> <!-- Ícono de lápiz de FontAwesome -->
                                </button>
                            </a>
                        </td>
                        <td>
                            <a href="verInicidencia_V.html">
                                <button type="button" class="btn btn-primary m-2" onclick="editEvent(1)">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </a>
                        </td>
                    </tr>

                    <tr>
                        <td>Incidencia 5</td>
                        <td>21-Enero</td>
                        <td>17:53</td>
                        <th scope="col">Otro</th>
                        <td>En curso</td>
                        <td>
                            <a href="actualizarIncidencia_V.html">
                                <button type="button" class="btn btn-success m-2" onclick="editEvent(1)">
                                    <i class="fas fa-pencil-alt"></i> <!-- Ícono de lápiz de FontAwesome -->
                                </button>
                            </a>
                        </td>
                        <td>
                            <a href="verInicidencia_V.html">
                                <button type="button" class="btn btn-primary m-2" onclick="editEvent(1)">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </a>
                        </td>
                    </tr>

                    </tbody>
                </table>

            </div>
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
<script src="js/script_actualizar_incidencia.js"></script>
</body>

</html>