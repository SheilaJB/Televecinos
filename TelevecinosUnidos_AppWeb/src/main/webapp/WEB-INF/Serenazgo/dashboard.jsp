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
    <link href="css/style_serenazgo.css" rel="stylesheet">

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


        <!-- Tabla de resumen  -->
        <div class="container-fluid pt-4 px-4 " style="padding: 20px;">
            <div class="row g-4">
                <div class="col-sm-12 col-xl-6 w-25 h-40" >
                    <div class="bg-light text-center rounded p-4" style="border: 1px solid black; box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Seguridad pública</h6>
                        </div>
                        <canvas id="type-incidents-pie-1"></canvas>
                    </div>
                </div>
                <div class="col-sm-12 col-xl-6 w-25 h-40">
                    <div class="bg-light text-center rounded p-4" style="border: 1px solid black; box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Emergencia médica</h6>
                        </div>
                        <canvas id="type-incidents-pie-2"></canvas>
                    </div>
                </div>
                <div class="col-sm-12 col-xl-6 w-25 h-40">
                    <div class="bg-light text-center rounded p-4" style="border: 1px solid black; box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Infraestructura</h6>
                        </div>
                        <canvas id="type-incidents-pie-3"></canvas>
                    </div>
                </div>
                <div class="col-sm-12 col-xl-6 w-25 h-40">
                    <div class="bg-light text-center rounded p-4" style="border: 1px solid black; box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Otro</h6>
                        </div>
                        <canvas id="type-incidents-pie-4"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <!-- Ingresar filtro: semana/mes/año-->

        <div class="filtro" style="border: 1px solid #ccc; border-radius: 5px; padding: 10px; display: flex; align-items: center; background-color:#FFB703 ;">
            <select class = "posicionBotonFiltrar1" id="filtroFrecuencia" style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; width: 15%; margin-right: 2%;" >
                <option selected>Frecuencia</option>
                <option value="Día">Día</option>
                <option value="Semana">Semana</option>
                <option value="Mes">Mes</option>
            </select>
            <!-- Alineación del botón con los selects -->
            <button type="button" class="btn btn-primary posicionBotonFiltrar2" onclick="filtrar()" style="padding: 10px;"><b>Filtrar</b></button>
        </div>
        <!-- Tabla de tipos de incidencias -->
        <div class="container-fluid pt-4 px-4">
            <div class="row g-4">
                <div class="col-sm-12 col-xl-6">
                    <div class="bg-light text-center rounded p-4" style="border: 1px solid black; box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Tipo de incidencia</h6>
                            <a href="listaIncidencias_S.html">Más detalles</a>
                        </div>
                        <canvas id="type-incidents-bar"></canvas>
                    </div>
                </div>
                <div class="col-sm-12 col-xl-6">
                    <div class="bg-light text-center rounded p-4" style="border: 1px solid black; box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Estado de las incidencias</h6>

                            <a href="listaIncidencias_S.html">Más detalles</a>
                        </div>
                        <canvas id="status-incidents"></canvas>
                    </div>
                </div>
            </div>
        </div>



        <div class="container-fluid pt-4 px-4">
            <div class="col-sm-12 col-xl-6 w-100 h-100">
                <div class="bg-light text-center rounded p-4" style="border: 1px solid black; box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                    </div>
                    <canvas id="type-incidents-urb-bar"></canvas>
                </div>
            </div>
        </div>
        <!-- Sales Chart End -->

        <!-- Recent Sales Start -->
        <div class="container-fluid pt-4 px-4">
            <!-- Habia una tabla -->
        </div>
        <!-- Recent Sales End -->




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

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>