<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="tabla1" scope="request" type="java.util.ArrayList" class="java.util.ArrayList" />
<jsp:useBean id="tabla2" scope="request" type="java.util.ArrayList" class="java.util.ArrayList" />
<jsp:useBean id="tabla3" scope="request" type="java.util.ArrayList" class="java.util.ArrayList" />
<jsp:useBean id="tabla4" scope="request" type="java.util.ArrayList" class="java.util.ArrayList" />

<jsp:useBean id="tabla6_tipo1" scope="request" type="java.util.ArrayList" class="java.util.ArrayList" />
<jsp:useBean id="tabla6_tipo2" scope="request" type="java.util.ArrayList" class="java.util.ArrayList" />
<jsp:useBean id="tabla6_tipo3" scope="request" type="java.util.ArrayList" class="java.util.ArrayList" />
<jsp:useBean id="tabla6_tipo4" scope="request" type="java.util.ArrayList" class="java.util.ArrayList" />



<jsp:useBean id="tabla7_tipo1" scope="request" type="java.util.ArrayList" class="java.util.ArrayList" />
<jsp:useBean id="tabla7_tipo2" scope="request" type="java.util.ArrayList" class="java.util.ArrayList" />
<jsp:useBean id="tabla7_tipo3" scope="request" type="java.util.ArrayList" class="java.util.ArrayList" />
<jsp:useBean id="tabla7_tipo4" scope="request" type="java.util.ArrayList" class="java.util.ArrayList" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Dashboard-serenazgo</title>
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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


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
                <div class="col-sm-12 col-xl-4" >
                    <div class="bg-light text-center rounded p-4" style="border: 1px solid black; box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Seguridad pública</h6>
                        </div>
                        <canvas id="type-incidents-pie-1"></canvas>
                    </div>
                </div>
                <div class="col-sm-12 col-xl-4 ">
                    <div class="bg-light text-center rounded p-4" style="border: 1px solid black; box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Emergencia médica</h6>
                        </div>
                        <canvas id="type-incidents-pie-2"></canvas>
                    </div>
                </div>
                <div class="col-sm-12 col-xl-4 ">
                    <div class="bg-light text-center rounded p-4" style="border: 1px solid black; box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Infraestructura</h6>
                        </div>
                        <canvas id="type-incidents-pie-3"></canvas>
                    </div>
                </div>
            </div>
            <div class="row g-4" style="margin-top: 10px;">
                <div class="col-sm-12 col-xl-4 " style="margin-top: 35px;">
                    <div class="bg-light text-center rounded p-4" style="border: 1px solid black; box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Otro</h6>
                        </div>
                        <canvas id="type-incidents-pie-4"></canvas>
                    </div>
                </div>
                <div class="col-sm-12 col-xl-8">
                    <div class="bg-light text-center rounded p-4" style="border: 1px solid black; box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Tipo de incidencias por día</h6>

                            <a href="<%=request.getContextPath()%>/SerenazgoServlet?action=listaIncidencias_S">Más detalles</a>
                        </div>
                        <canvas id="tipo-incidencias-dia"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <!-- Ingresar filtro: semana/mes/año-->
        <!--
        <div class="filtro" style="border: 1px solid #ccc; border-radius: 5px; padding: 10px; display: flex; align-items: center; background-color:#FFB703 ;">
            <select class = "posicionBotonFiltrar1" id="filtroFrecuencia" style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; width: 15%; margin-right: 2%;" >
                <option selected>Frecuencia</option>
                <option value="Día">Día</option>
                <option value="Semana">Semana</option>
                <option value="Mes">Mes</option>
            </select>

            <button type="button" class="btn btn-primary posicionBotonFiltrar2" onclick="filtrar()" style="padding: 10px;"><b>Filtrar</b></button>
        </div>
        -->
        <!-- Tabla de tipos de incidencias
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

            </div>
        </div>
        -->


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
<!--<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="lib/chart/chart.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="lib/tempusdominus/js/moment.min.js"></script>
<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>










<canvas id="test-chart" width="400" height="400"></canvas>



<script type="text/javascript">
    (function ($) {
        "use strict";

        // Spinner
        var spinner = function () {
            setTimeout(function () {
                if ($('#spinner').length > 0) {
                    $('#spinner').removeClass('show');
                }
            }, 1);
        };
        spinner();


        // Back to top button
        $(window).scroll(function () {
            if ($(this).scrollTop() > 300) {
                $('.back-to-top').fadeIn('slow');
            } else {
                $('.back-to-top').fadeOut('slow');
            }
        });
        $('.back-to-top').click(function () {
            $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
            return false;
        });


        // Sidebar Toggler
        $('.sidebar-toggler').click(function () {
            $('.sidebar, .content').toggleClass("open");
            return false;
        });


        // Progress Bar
        $('.pg-bar').waypoint(function () {
            $('.progress .progress-bar').each(function () {
                $(this).css("width", $(this).attr("aria-valuenow") + '%');
            });
        }, {offset: '80%'});


        // Calender
        $('#calender').datetimepicker({
            inline: true,
            format: 'L'
        });


        // Testimonials carousel
        $(".testimonial-carousel").owlCarousel({
            autoplay: true,
            smartSpeed: 1000,
            items: 1,
            dots: true,
            loop: true,
            nav : false
        });


        /* Tipos de incidencias - Chart
        var ctx1 = $("#type-incidents-bar").get(0).getContext("2d");
        var myChart1 = new Chart(ctx1, {
            type: "bar",
            data: {
                labels: ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sábado", "Domingo"],
                datasets: [{
                    label: "Seguridad pública",
                    data: [20, 33, 14, 25, 38, 11, 29],
                    backgroundColor: "rgba(255, 183, 3, 1)"
                },
                    {
                        label: "Emergencia médica",
                        data: [23, 31, 17, 38, 29, 12, 35],
                        backgroundColor: "rgba(251, 133, 0, 1)"
                    },
                    {
                        label: "Infraestructura",
                        data: [28, 36, 15, 32, 19, 27, 10],
                        backgroundColor: "rgba(33, 158, 188, 1)"
                    },
                    {
                        label: "Otro",
                        data: [16, 30, 25, 12, 37, 22, 18],
                        backgroundColor: "rgba(2, 48, 71, 1)"
                    }
                ]
            },
            options: {
                responsive: true
            }
        });*/
        // Estados de incidencias - Chart
        var tabla6_tipo1 = ${tabla6_tipo1};
        var tabla6_tipo2 = ${tabla6_tipo2};
        var tabla6_tipo3 = ${tabla6_tipo3};
        var tabla6_tipo4 = ${tabla6_tipo4};




        var ctx2 = $("#tipo-incidencias-dia").get(0).getContext("2d");
        var myChart2 = new Chart(ctx2, {
            type: "bar",
            data: {
                labels: ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sábado", "Domingo"],
                datasets: [{
                    label: "Seguridad Pública",
                    data: tabla6_tipo1,
                    backgroundColor: "rgba(42, 157, 143, 1)",
                    fill: false
                },
                    {
                        label: "Emergencia Médica",
                        data: tabla6_tipo2,
                        backgroundColor:"rgba(233, 196, 106, 1)",
                        fill: false
                    },
                    {
                        label: "Infraestructura y Servicios Públicos",
                        data: tabla6_tipo3,
                        backgroundColor: "rgba(38, 70, 83, 1)",
                        fill: false
                    },
                    {
                        label: "Otro",
                        data: tabla6_tipo4,
                        backgroundColor:"rgba(231, 111, 81, 1)",
                        fill: false
                    },

                ]
            },
            options: {
                responsive: true
            }
        });
        var tabla1 = ${tabla1};
        var tabla2 = ${tabla2};
        var tabla3 = ${tabla3};
        var tabla4 = ${tabla4};

        var tabla7_tipo1 = ${tabla7_tipo1};
        var tabla7_tipo2 = ${tabla7_tipo2};
        var tabla7_tipo3 = ${tabla7_tipo3};
        var tabla7_tipo4 = ${tabla7_tipo4};

        // Tipo 1

        var ctx3 = $("#type-incidents-pie-1").get(0).getContext("2d");
        var myChart3 = new Chart(ctx3, {
            type: "pie",
            data: {
                labels: [
                    "Pendiente: " + tabla1[0] + "%",
                    "En curso: " + tabla1[1] + "%",
                    "Cancelado: " + tabla1[2] + "%",
                    "Rechazado: " + tabla1[3] + "%",
                    "Procesado: " + tabla1[4] + "%"
                ],
                datasets: [{
                    backgroundColor: [
                        "rgba(42, 157, 143, 1)",
                        "rgba(233, 196, 106, 1)",
                        "rgba(38, 70, 83, 1)",
                        "rgba(231, 111, 81, 1)",
                        "rgba(244, 162, 97, 1)"
                    ],
                    data: tabla1,//cambiar
                }]
            },

        });
        // Tipo 2
        var ctx4 = $("#type-incidents-pie-2").get(0).getContext("2d");
        var myChart4 = new Chart(ctx4, {
            type: "pie",
            data: {
                labels: [
                    "Pendiente: " + tabla2[0] + "%",
                    "En curso: " + tabla2[1] + "%",
                    "Cancelado: " + tabla2[2] + "%",
                    "Rechazado: " + tabla2[3] + "%",
                    "Procesado: " + tabla2[4] + "%"
                ],
                datasets: [{
                    backgroundColor: [
                        "rgba(42, 157, 143, 1)",
                        "rgba(233, 196, 106, 1)",
                        "rgba(38, 70, 83, 1)",
                        "rgba(231, 111, 81, 1)",
                        "rgba(244, 162, 97, 1)"
                    ],
                    data: tabla2,
                }]
            },
            options: {
                responsive: true
            }
        });
        // Tipo 3
        var ctx5 = $("#type-incidents-pie-3").get(0).getContext("2d");
        var myChart5 = new Chart(ctx5, {
            type: "pie",
            data: {
                labels: [
                    "Pendiente: " + tabla3[0] + "%",
                    "En curso: " + tabla3[1] + "%",
                    "Cancelado: " + tabla3[2] + "%",
                    "Rechazado: " + tabla3[3] + "%",
                    "Procesado: " + tabla3[4] + "%"
                ],
                datasets: [{
                    backgroundColor: [
                        "rgba(42, 157, 143, 1)",
                        "rgba(233, 196, 106, 1)",
                        "rgba(38, 70, 83, 1)",
                        "rgba(231, 111, 81, 1)",
                        "rgba(244, 162, 97, 1)"
                    ],
                    data: tabla3,
                }]
            },
            options: {
                responsive: true
            }
        });
        // Tipo 4
        var ctx6 = $("#type-incidents-pie-4").get(0).getContext("2d");
        var myChart6 = new Chart(ctx6, {
            type: "pie",
            data: {
                labels: [
                    "Pendiente: " + tabla4[0] + "%",
                    "En curso: " + tabla4[1] + "%",
                    "Cancelado: " + tabla4[2] + "%",
                    "Rechazado: " + tabla4[3] + "%",
                    "Procesado: " + tabla4[4] + "%"
                ],
                datasets: [{
                    backgroundColor: [
                        "rgba(42, 157, 143, 1)",
                        "rgba(233, 196, 106, 1)",
                        "rgba(38, 70, 83, 1)",
                        "rgba(231, 111, 81, 1)",
                        "rgba(244, 162, 97, 1)"
                    ],
                    data: tabla4,
                }]
            },
            options: {
                responsive: true
            }
        });

        // Tipos de incidencias - Chart
        var ctx7 = $("#type-incidents-urb-bar").get(0).getContext("2d");
        var myChart7 = new Chart(ctx7, {
            type: "bar",
            data: {
                labels: ["Rafael Escardó", "José de La Riva Agüero", " Juan XXIII", "Libertad", "Los Jardines de La Marina", "Las Leyendas", "Las Torres San Miguelito","Elmer Faucett","Maranga","Pando" ,"Parques de La Huaca", "Otro"],
                datasets: [{
                    label: "Seguridad pública",
                    data: tabla7_tipo1,
                    backgroundColor: "rgba(255, 183, 3, 1)"
                },
                    {
                        label: "Emergencia médica",
                        data: tabla7_tipo2,
                        backgroundColor: "rgba(251, 133, 0, 1)"
                    },
                    {
                        label: "Infraestructura",
                        data:  tabla7_tipo3,
                        backgroundColor: "rgba(33, 158, 188, 1)"
                    },
                    {
                        label: "Otro",
                        data:  tabla7_tipo4,
                        backgroundColor: "rgba(2, 48, 71, 1)"
                    }
                ]
            },
            options: {
                responsive: true
            }
        });
    })(jQuery);


</script>
</body>
</html>
