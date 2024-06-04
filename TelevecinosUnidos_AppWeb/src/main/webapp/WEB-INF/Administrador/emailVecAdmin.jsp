<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Registro vecino</title>
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
    <link href="css/style_popup.css" rel="stylesheet">

    <style>
        .popup {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }

        .popup_contenido {
            background-color: white;
            width: 50%;
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            text-align: center;
            position: relative;
        }

        .close-btn {
            position: absolute;
            top: 5px;
            right: 10px;
            font-size: 24px;
            cursor: pointer;
            color: rgb(0, 0, 0);
        }

    </style>
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

                        <a href="registroSerenazgo.html" class="dropdown-item"style="font-size: 13.5px;">Registrar nuevo serenazgo</a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-chalkboard-teacher me-2 colorLetrasBarraLateral"></i><span style="font-size: 13.3px;">Area de coordinación</span></a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="ListaCoordinadorasEventos_A.html" class="dropdown-item"style="font-size: 13.5px;">Coordinadoras eventos</a>
                        <a href="ListaCoordinadorasDeportes_A.html" class="dropdown-item"style="font-size: 13.5px;">Coordinadoras deportes</a>
                        <a href="ListaInstructores_A.html" class="dropdown-item"style="font-size: 13.5px;">Instructores</a>
                        <a href="FormularioInstructores_A.html" class="dropdown-item"style="font-size: 13.5px;">Registrar nuevo instructor</a>
                    </div>
                </div>

                <a href="panelDeSugerencias.html" class="nav-item nav-link"><i class="fa fa-lightbulb me-2 colorLetrasBarraLateral"></i><span style="font-size: 14px;">Panel de sugerencias</span></a>

            </div>
        </nav>
    </div>
    <!-- BARRA AZUL DE LA IZQUIERDA FINAL -->


    <!-- Content Start -->
    <div class="content">
        <!-- PARTE SUPERIOR INICIO -->
        <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0" id="navbar">
            <a href="" class="navbar-brand d-flex d-lg-none me-4">
                <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
            </a>
            <a href="#" class="sidebar-toggler flex-shrink-0">
                <i class="fa fa-bars"></i>
            </a>
            <a class="navbar-brand mx-4 mb-3 d-flex align-items-center" style="padding-top: 2%;">
                <img class="rounded-circle" src="img/logo.jpg" alt="" style="width: 40px; height: 40px;">
                <h3 class="m-0 me-2 px-2" style="color:#023047;">Televecinos Unidos</h3>
            </a>

            <div class="navbar-nav align-items-center ms-auto">

                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <img class="rounded-circle me-lg-2" src="img/munisanmiguelLogo.jpg" alt="" style="width: 40px; height: 40px;">
                        <span class="d-none d-lg-inline-flex" style="color:#023047;"><b>Municipalidad de San Miguel</b></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                        <a href="perfil_A.html" class="dropdown-item itemperfil">Mi perfil</a>
                        <a href="login/login.html" class="dropdown-item itemperfil">Cerrar Sesión</a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- PARTE SUPERIOR FINAL -->

        <!--email vecino-->
        <div style="background-color: #f8f9fa; padding: 20px; align-items: center;">
            <h2>Registro de vecino</h2>
            <div class="container text-center">
                <div class="card  p-4 shadow-lg" style="max-width: 400px; margin: 0 auto;background-color: #b6effb">
                    <div class="form-group text-center">
                        <label>
                            <img src="img/check.png" alt="check" width="48" height="48" style="margin-top: -10px;">
                            <h4 style="margin-top: 20px;">¡El vecino fue añadido de manera exitosa!</h4>
                        </label>
                    </div>
                </div>
            </div>

            <!--correo-->
            <div class="container" style="padding-top: 20px">
                <h5>Correo a enviar: </h5>
                <div class="form-group">
                    <label for="asunto">Asunto</label>
                    <input type="text" id="asunto" name="Asunto" class="form-control" placeholder="Ingrese el asunto del correo">
                </div>
                <div class="form-group">
                    <label for="email">Para:</label>
                    <input type="text" id="email" name="email" class="form-control" placeholder="Ingrese el correo gmail destino">
                </div>
                <div class="form-group" style = "padding-top: 2%">
                    <!--<label for="body">Comience a redactar:</label>--->
                    <textarea class="form-control" id="Texto"  name = "Texto" rows="20" placeholder="Comience a redactar aquí ..."></textarea>
                    <div class="m-n2" style="padding-top: 5%; ">
                        <button type="button" class="btn btn-warning m-2 text-white" onclick="regresar()">Regresar</button>
                        <button type="button" class="btn btn-success m-2" id="openPopupBtn">Enviar correo</button>
                    </div>
                </div>
                <script>
                    function regresar(){
                        window.location.href="ListaVecinos_A.html";
                    }
                </script>

                <!-- Popup -->
                <div id="popup" class="popup" >
                    <div class="popup_contenido">
                        <span class="close-btn" id="closePopupBtn">&times;</span>
                        <img src="img/check.png" alt="check" width="48" height="48" style="margin-top: -10px;">
                        <h2 style="margin-top: 20px;">Éxito</h2>
                        <p>Se ha enviado el correo de manera exitosa</p>
                        <a href="#">
                            <a href="inicioAdmin.html"><button type="button" class="btn btn-primary rounded-pill m-2">Regresar</button></a>
                        </a>
                    </div>
                </div>

            </div>
        </div>


        <!-- Bootstrap JS dependencies -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



        <!-- Fin de iamgen estatica -->
        <div style="background-color: #f8f9fa; padding: 20px; align-items: center;">


            <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.css">
            <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick-theme.css">
            <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.min.js"></script>
        </div>


        <!-- Content End -->

        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light rounded-top p-4">
                <div class="row">
                    <div class="col-12 col-sm-6 text-center text-sm-start">
                        &copy; <a href="#">Televecinos Unidos</a>, All Right Reserved.
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

<script>
    const openPopupBtn = document.getElementById('openPopupBtn');
    const closePopupBtn = document.getElementById('closePopupBtn');
    const navbar = document.getElementById('navbar');
    const popup = document.getElementById('popup');

    openPopupBtn.addEventListener('click', () => {
        popup.style.display = 'block';
    });

    closePopupBtn.addEventListener('click', () => {
        popup.style.display = 'none';
    });
    function desactivarStickyTop() {
        navbar.classList.remove('sticky-top');
    }

    function activarStickyTop() {
        navbar.classList.add('sticky-top');
    }

    document.getElementById('openPopupBtn').addEventListener('click', function() {
        desactivarStickyTop();
        popup.style.display = 'block';
    });

    document.getElementById('closePopupBtn').addEventListener('click', function() {
        activarStickyTop();
        popup.style.display = 'none';
    });


</script>



</body>

</html>