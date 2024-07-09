<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>TELEVECINOS UNIDOS INICIO</title>
    <meta content="width=device-width, initial-scale=1.0"  name="viewport">
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

    <head>
        <style>
            .custom-carousel-img {
                max-width: 80%; /* Ajusta el tamaño máximo del ancho según sea necesario */
                max-height: 80vh; /* Ajusta el tamaño máximo de la altura según sea necesario */
                margin: auto;
                display: block;
                object-fit: cover; /* Esto asegura que la imagen se escale correctamente */
            }
        </style>
    </head>

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
    <jsp:include page="../includes/barraLateralAdministrador.jsp"></jsp:include>
    <!-- BARRA AZUL DE LA IZQUIERDA FINAL -->

    <!-- Content Start -->
    <div class="content">
        <!-- PARTE SUPERIOR INICIO -->
        <jsp:include page="../includes/navbarAdministrador.jsp"></jsp:include>
        <!-- PARTE SUPERIOR FINAL -->

        <!-- LLENAR-->
        <!-- Imagen estática del inicio del admin -->
        <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/fondoDeAdminInicio2.jpg" class="d-block w-100 custom-carousel-img" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5 class="titleCarousel">MUNICIPALIDAD DE SAN MIGUEL - Administración</h5>
                        <p>Como administrador debe operar con transparencia, respetando la privacidad de los usuarios y manteniendo la neutralidad en la moderación del contenido. Es crucial combatir el discurso de odio y la desinformación, colaborar con las autoridades cuando sea necesario y garantizar un ambiente seguro y justo para todos los usuarios.</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fin de iamgen estatica -->
        <div style="background-color: #f8f9fa; padding: 20px; align-items: center;margin-top: 20px;">

            <h3 class="mb-4">Funciones:</h3>

            <div class="row row-cols-1 row-cols-md-3 g-4">
                <a href="<%=request.getContextPath()%>/AdministradorServlet?action=nuevasSolicitudes_A">
                    <div class="col">
                        <div class="card h-100 shadow text-center" style="background-color: #8ECAE6;">
                            <div class="card-body">
                                <h5 class="card-title">Gestionar y evaluar las solicitudes de inscripción de nuevos usuarios</h5>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="<%=request.getContextPath()%>/AdministradorServlet?action=registroSerenazgo">
                    <div class="col">
                        <div class="card h-100 shadow text-center" style="background-color: #219EBC;">
                            <div class="card-body">
                                <h5 class="card-title">Crear las cuentas de los serenazgos y asignarles credenciales temporales</h5>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="<%=request.getContextPath()%>/AdministradorServlet?action=listaVecinos_A">
                    <div class="col">
                        <div class="card h-100 shadow text-center" style="background-color: #FFB703;">
                            <div class="card-body">
                                <h5 class="card-title">Asignar el rol de coordinador a los vecinos designados previamente</h5>

                            </div>
                        </div>
                    </div>
                </a>
                <a href="<%=request.getContextPath()%>/AdministradorServlet?action=registroInstructor">
                    <div class="col">
                        <div class="card h-100 shadow text-center" style="background-color: #FB8500;">
                            <div class="card-body">
                                <h5 class="card-title">Registrar instructores y el curso que dictan</h5>

                            </div>
                        </div>
                    </div>
                </a>
                <a href="<%=request.getContextPath()%>/AdministradorServlet?action=usuariosBaneados_A">
                    <div class="col">
                        <div class="card h-100 shadow text-center" style="background-color: #8ECAE6;">
                            <div class="card-body">
                                <h5 class="card-title">Banear y desbanear a los usuarios de la página </h5>

                            </div>
                        </div>
                    </div>
                </a>
                <div class="col">
                    <div class="card h-100 shadow text-center" style="background-color: #FB8500;">
                        <div class="card-body">
                            <h5 class="card-title">Leer las sugerencias que escriban los miembros de la página</h5>

                        </div>
                    </div>
                </div>

            </div>



            <script>
                $(document).ready(function(){
                    $('.row').slick({
                        infinite: true,
                        slidesToShow: 3,
                        slidesToScroll: 1
                    });
                })
                ;</script>
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
                        &copy; <a>Televecinos Unidos</a>, All Right Reserved.
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
<!-- Bootstrap JS dependencies -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>