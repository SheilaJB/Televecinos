<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Preguntas frecuentes coordinadoras</title>
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
    <div class="sidebar pe-4 pb-3" style="background-color: #8ecae6;">
        <nav class="navbar" style="background-color: #8ecae6;" >
            <a href="" class="navbar-brand mx-3 mb-3">
                <h4 class="text-primary"><b>Televecinos Unidos</b></h4>
            </a>
            <div class="d-flex align-items-center ms-4 mb-4">
                <div class="position-relative">
                    <img class="rounded-circle" src="img/munisanmiguelLogo.jpg" alt="" style="width: 40px; height: 40px;">
                    <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                </div>
                <div class="ms-3">
                    <h6 class="mb-0">Municipalidad de San Miguel</h6>
                    <span>Administrador</span>
                </div>
            </div>
            <!-- Seleccionar Opciones -->
            <div class="navbar-nav w-100">
                <a href="inicioAdmin.html" class="nav-item nav-link colorLetrasBarraLateral"><i  class="fa fa-home me-2 colorLetrasBarraLateral"></i>Inicio</a>

                <a href="NuevasSolicitudes_A.html" class="nav-item nav-link"><i class="fa fa-clipboard-list me-2 colorLetrasBarraLateral"></i><span style="font-size: 14px;">Nuevas solicitudes</span></a>
                <a href="ListaVecinos_A.html" class="nav-item nav-link"><i class="fa fa-user-friends me-2 colorLetrasBarraLateral"></i><span style="font-size: 14px;">Lista de vecinos</span></a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-shield-alt me-2 colorLetrasBarraLateral"></i><span style="font-size: 13.5px;">Personal serenazgo</span></a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="ListaSerenazgo_A.html" class="dropdown-item" style="font-size: 13.5px;">Lista de serenazgos</a>

                        <a href="FormularioSerenazgo_A.html" class="dropdown-item"style="font-size: 13.5px;">Registrar nuevo serenazgo</a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-chalkboard-teacher me-2 colorLetrasBarraLateral"></i><span style="font-size: 13.3px;">Area de coordinación</span></a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="ListaCoordinadorasCultura_A.html" class="dropdown-item"style="font-size: 13.5px;">Coordinadoras cultura</a>
                        <a href="ListaCoordinadorasDeportes_A.html" class="dropdown-item"style="font-size: 13.5px;">Coordinadoras deportes</a>
                        <a href="ListaInstructores_A.html" class="dropdown-item"style="font-size: 13.5px;">Instructores</a>
                        <a href="FormularioInstructores_A.html" class="dropdown-item"style="font-size: 13.5px;">Registrar nuevo instructor</a>
                    </div>
                </div>

                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-question-circle me-2 colorLetrasBarraLateral"></i><span style="font-size: 13.3px;">Preguntas frecuentes</span></a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="preguntasFrecuentes_V_vistaAdmin.html" class="dropdown-item"style="font-size: 13.5px;">Dudas Vecinos</a>
                        <a href="preguntasFrecuentes_C_vistaAdmin.html" class="dropdown-item active"style="font-size: 13.5px;">Dudas Coordinadoras</a>
                        <a href="preguntasFrecuentes_S_vistaAdmin.html" class="dropdown-item"style="font-size: 13.5px;">Dudas Serenazgos</a>
                    </div>
                </div>

            </div>
        </nav>
    </div>
    <!-- BARRA AZUL DE LA IZQUIERDA FINAL -->


    <!-- Content Start -->
    <div class="content">
        <!-- Navbar Start -->
        <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
            <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
            </a>
            <a href="#" class="sidebar-toggler flex-shrink-0">
                <i class="fa fa-bars"></i>
            </a>
            <a class="navbar-brand mx-4 mb-3 d-flex align-items-center" style = "padding-top: 2%;">
                <img class="rounded-circle" src="img/logo.jpg" alt="" style="width: 40px; height: 40px;">
                <h3 class="m-0 me-2 px-2" style="color:#023047;">Preguntas frecuentes de las coordinadoras</h3>
            </a>

            <div class="navbar-nav align-items-center ms-auto">

                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <img class="rounded-circle me-lg-2" src="img/munisanmiguelLogo.jpg" alt="" style="width: 40px; height: 40px;">
                        <span class="d-none d-lg-inline-flex" style="color:#023047;"><b>Municipalidad de San Miguel</b></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                        <a href="inicioAdmin.html" class="dropdown-item">Mi perfil</a>
                        <a href="index.html" class="dropdown-item">Cerrar sesión</a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Navbar End -->
        <!-- PARTE SUPERIOR FINAL -->

        <!-- Other Elements Start -->


        <div class="bg-light rounded h-100 p-4" >
            <div class="alert alert-info" role="alert" style="background-color: #ffb703;">
                <b>Preguntas frecuentes</b>
            </div>

            <div class="accordion" id="accordionExample">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                            ¿Qué debo hacer si olvidé mi contraseña?
                        </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
                        <div class="accordion-body">
                            Si olvidas tu contraseña, puedes seleccionar la opción "Olvidaste tu contraseña" en la página de inicio de sesión. Se te pedirá ingresar tu correo electrónico registrado y recibirás un correo con instrucciones para restablecer tu contraseña.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="heading2">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            ¿Cómo puedo ver los eventos que están disponibles?
                        </button>
                    </h2>
                    <div id="collapseTwo" class="accordion-collapse collapse " aria-labelledby="heading2" data-bs-parent="#accordionExample" style="">
                        <div class="accordion-body">
                            Una vez que hayas ingresado a la plataforma, podrás ver en la sección de eventos una división en tres categorías: Cultura, Deportes y Eventos inscritos. Selecciona el tipo al que te deseas inscribir y observarás información sobre la fecha, lugar, descripción, y vacantes disponibles.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingThree">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            ¿Cómo puedo verificar el estado de las incidencias que he reportado?
                        </button>
                    </h2>
                    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample" style="">
                        <div class="accordion-body">
                            Ingresa al apartado incidencias y selecciona lista de incidencias. Podrás ver cada incidencias que has genreado y si se encuentra no evaluada, evaluada o si ha sido descartada por ser falsa.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingFour">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                            ¿Recibiré notificaciones sobre los eventos a los que me inscribí?
                        </button>
                    </h2>
                    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample" style="">
                        <div class="accordion-body">
                            Sí, recibirás notificaciones por correo electrónico recordándote cuando el evento al que te inscribiste esté por comenzar (15 minutos de anticipación).
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingFive">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                            ¿Qué debo hacer si tengo un problema o incidencia que reportar?
                        </button>
                    </h2>
                    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample" style="">
                        <div class="accordion-body">
                            Si tienes un problema o incidencia que reportar, puedes abrir un caso a través de la opción de "Generar Incidencia" en la plataforma. Deberás proporcionar detalles como el nombre de la incidencia, el lugar exacto, referencias, fotos, tipo de incidencia y si se requiere una ambulancia.                            </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="heading6">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse6" aria-expanded="false" aria-controls="collapse6">
                            ¿Puedo eliminar una incidencia que he reportado?
                        </button>
                    </h2>
                    <div id="collapse6" class="accordion-collapse collapse" aria-labelledby="heading6" data-bs-parent="#accordionExample" style="">
                        <div class="accordion-body">
                            No puedes eliminar una incidencia una vez que ha sido reportada, pero puedes ver su progreso y el estado actual en la plataforma.
                        </div>
                    </div>
                </div>
            </div>

            <p></p>
            <div class="alert alert-info" role="alert" style="background-color: #ffb703;">
                <b>Ponte en contacto con nosotros</b>
            </div>

            <div class="h-100 bg-light rounded p-4">
                <div class="d-flex align-items-center justify-content-between mb-2">
                    <h6 class="mb-0">Administradores</h6>

                </div>
                <div class="d-flex align-items-center border-bottom py-3">
                    <img class="rounded-circle flex-shrink-0" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                    <div class="w-100 ms-3">
                        <div class="d-flex w-100 justify-content-between">
                            <h6 class="mb-0">Roberto Tafur</h6>
                        </div>
                        <span>a20210535@pucp.edu.pe</span>
                    </div>
                </div>
                <div class="d-flex align-items-center border-bottom py-3">
                    <img class="rounded-circle flex-shrink-0" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                    <div class="w-100 ms-3">
                        <div class="d-flex w-100 justify-content-between">
                            <h6 class="mb-0">Nilo Cori</h6>
                        </div>
                        <span>nilo.cori@pucp.edu.pe</span>
                    </div>
                </div>
                <div class="d-flex align-items-center border-bottom py-3">
                    <img class="rounded-circle flex-shrink-0" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                    <div class="w-100 ms-3">
                        <div class="d-flex w-100 justify-content-between">
                            <h6 class="mb-0">Jostin Pino</h6>
                        </div>
                        <span>a20213830@pucp.edu.pe</span>
                    </div>
                </div>

            </div>

        </div>
        <!-- Other Elements End -->


        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light rounded-top p-4">
                <div class="row">
                    <div class="col-12 col-sm-6 text-center text-sm-start">
                        &copy; <a href="#">Televecino</a>, All Right Reserved.
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