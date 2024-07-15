<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Inicio Serenazgo</title>
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
    <link href="css/style_serenazgo.css" rel="stylesheet">

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
    <jsp:include page="../includes/barraLateralSerenazgo.jsp"></jsp:include>
    <!-- BARRA AZUL DE LA IZQUIERDA FINAL -->


    <!-- Content Start -->
    <div class="content">
        <!-- PARTE SUPERIOR INICIO -->
        <jsp:include page="../includes/navbarSerenazgo.jsp"></jsp:include>
        <!-- PARTE SUPERIOR FINAL -->

        <!-- Bootstrap JS dependencies -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



        <div class="container-fluid pt-4 px-4">
            <div class="row g-4" style="padding: 10px;">

                <div class="col-sm-12 col-md-6 bg-light">
                    <div class="p-3 d-flex justify-content-center align-items-center">
                        <img src="img/serenazgo2.jpg" class="img-fluid rounded" alt="...">
                    </div>
                </div>

                <div class="col-md-6 mb-4">

                    <section id="Titulo_Dashboard" class="card mb-3">
                        <div class="card-body border-secondary">
                            <header class="card-header bg-transparent">
                                <h2 class="card-title">Dashboard de Serenazgo</h2>
                            </header>

                            <article class="mt-4">
                                <p>
                                    Monitorea y analiza las estadísticas de incidencias en tiempo real para tomar decisiones informadas y mejorar la seguridad de la comunidad.
                                </p>
                            </article>

                            <footer class="mt-4">
                                <a href="<%=request.getContextPath()%>/SerenazgoServlet?action=dashboard" class="btn btn-success btn-block">
                                    Ir al Dashboard
                                </a>
                            </footer>
                        </div>
                    </section>

                    <section id="Titulo_Incidencias" class="card mb-3">
                        <div class="card-body border-secondary">
                            <header class="card-header bg-transparent">
                                <h2 class="card-title">Gestión de Incidencias</h2>
                            </header>

                            <article class="mt-4">
                                <p>
                                    Gestiona y evalúa las incidencias reportadas por los vecinos. Mantén un registro detallado y toma acciones rápidas para resolver los problemas de la comunidad.
                                </p>
                            </article>

                            <footer class="mt-4">
                                <a href="<%=request.getContextPath()%>/SerenazgoServlet?action=listaIncidencias_S" class="btn btn-success btn-block">
                                    Ver Incidencias
                                </a>
                            </footer>
                        </div>
                    </section>
                    <section id="Titulo_Vecinos" class="card">
                        <div class="card-body border-secondary">
                            <header class="card-header bg-transparent">
                                <h2 class="card-title">Gestión de Vecinos</h2>
                            </header>

                            <article class="mt-4">
                                <p>
                                    Accede a la lista de vecinos y toma medidas en caso de reportes falsos recurrentes.
                                </p>
                            </article>

                            <footer class="mt-4">
                                <a href="<%=request.getContextPath()%>/SerenazgoServlet?action=listaVecinos_S" class="btn btn-success btn-block">
                                    Ver Vecinos
                                </a>
                            </footer>
                        </div>
                    </section>
                </div>
            </div>
        </div>

        <!-- Content End -->



        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light rounded-top p-4">
                <div class="row">
                    <div class="col-12 col-sm-6 text-center text-sm-start">
                        &copy; <a>TelevecinosUnidos</a>, All Right Reserved.
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