<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Evento más información</title>
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



    <jsp:include page="../includes/barraLateralCoordinador.jsp"></jsp:include>
    <!-- Sidebar End -->

    <!-- Content Start -->
    <div id="navbar" class="content">
        <!-- Navbar Start -->
        <jsp:include page="../includes/navbarCoordinador.jsp"></jsp:include>
        <!-- Navbar End -->


        <!-- Mostrar información del evento-->


        <!-- Form Start -->
        <!---Nombre del evento-->

        <div class="container-fluid pt-4 px-4">
            <a class="form-label" style="color:#023047; font-size: 40px;" ><b>Descubre el Vóley: ¡Aprende, Juega y Disfruta!</b></a>
        </div>
        <div class="container-fluid pt-4 px-4">
            <div class="row g-4">
                <div class="col-sm-12">
                    <div class="rounded h-100 p-4" style=" background-color: #ffb703;">
                        <form>
                            <!---Descripción del evento-->
                            <div class="mb-3">
                                <label for="descripcionEvento" class="form-label" style="color:#023047;">
                                    <b>Descripción:</b>
                                    <br>
                                    <a style="text-align: justify;">¡Descubre el Vóley! Únete a nosotros para aprender, jugar y disfrutar de este emocionante deporte. Nuestro evento ofrece una oportunidad única para todos, desde principiantes hasta expertos, de sumergirse en el mundo del vóley. Con actividades divertidas, competiciones amistosas y sesiones de entrenamiento, te garantizamos una experiencia inolvidable. ¡No te pierdas esta emocionante oportunidad de ser parte de la acción del vóley!</a>
                                    <br>
                                    <b>Nombre del coordinador:</b>
                                    <br>
                                    <a>Nombre Apellido</a>
                                    <br>
                                </label>

                            </div>
                        </form>
                    </div>
                </div>


                <!----Subir foto---->
                <div class="col-sm-12 col-sm-12 col-xl-6">
                    <div class="bg-light rounded h-100 p-4">
                        <div class="mb-3">
                            <img src="img/Deporte/markus-spiske-BfphcCvhl6E-unsplash.jpg" class="img-responsive" alt="" style="width: 100%; height: auto;"  />
                        </div>

                    </div>

                </div>
                <!---Info del profe, lugar y fecha-->
                <div class="col-sm-12 col-xl-6">
                    <div class="rounded h-100 p-4" style = "background-color:#219ebc;">
                        <!---Nombre del coordinador-->
                        <div class="mb-3">
                            <label for="nombreCoordinador" class="form-label" style="color:#023047;"><b>Profesor(a):</b></label>
                            <br>
                            <a style="color: white;"> Nombre Apellido_1 Apellido_2</a>
                        </div>
                        <!---Lugar del evento-->
                        <div class="mb-3">
                            <label for="lugarEvento" class="form-label" style="color:#023047;"><b>Lugar del evento:</b></label>
                            <br>
                            <a style="color: white;">Avenida/Calle/Jiron</a>
                        </div>
                        <!----Frecuencia del evento----->
                        <label for="frecuenciaEvento" class="form-label" style="color:#023047;"><b>Frecuencia del evento:</b></label>
                        <br>
                        <a style="color: white;">Semanal</a>
                        <br>
                        <!----Cantidad de vacantes disponibles----->
                        <label for="cantVacantes" class="form-label" style="color:#023047;"><b><br>Cantidad de vacantes:</b> </label>
                        <br>
                        <a style="color: white;">30</a>

                    </div>
                    <script>
                        // Función que se ejecutará al cargar la ventana
                        window.onload = function() {
                            var selectElement = document.getElementById('cantVacantes');

                            // Crear opciones de 10 a 30
                            for(var i = 10; i <= 30; i++) {
                                var option = new Option(i, i);
                                selectElement.add(option);
                            }
                        };
                    </script>
                </div>


                <!----Lista de Materiales---->
                <div class="col-sm-12 col-xl-6">

                </div>



                <!-- Fecha/Hora/ -->
                <div class="col-sm-12 col-xl-6">
                    <div class="rounded h-100 p-4" style = "background-color: #8ecae6;">
                        <!-- Contenedor para la previsualización de la imagen -->
                        <div class="mb-3">
                            <img id="preview" src="#" alt="Vista previa de la imagen" class="img-thumbnail" style="display: none;">
                        </div>
                        <!-- Fecha del evento -->
                        <div class="mb-3">
                            <label for="fechaInicioEvento" class="form-label" style="color:#023047;"><b>Fecha de inicio:</b></label>
                            <br>
                            <a style="color: white;"> 03/04/2024</a>
                        </div>
                        <div class="mb-3">
                            <label for="fechaFinEvento" class="form-label" style="color:#023047;"><b>Fecha de finalización:</b></label>
                            <br>
                            <a style="color: white;"> 01/05/2024</a>
                        </div>

                        <!-- Hora de inicio del evento -->
                        <div class="mb-3">
                            <label for="horaInicioEvento" class="form-label" style="color:#023047;"><b>Hora de inicio:</b></label>
                            <br>
                            <a style="color: white;"> 11:00</a>
                        </div>

                        <!-- Hora de finalización del evento -->
                        <div class="mb-3">
                            <label for="horaFinEvento" class="form-label" style="color:#023047;"><b>Hora de finalización:</b></label>
                            <br>
                            <a style="color: white;"> 13:00</a>
                        </div>

                    </div>
                </div>
                <!-- Boton de Volver-->
                <div style="text-align: right; margin-right: 100px; padding-top: 2%;">
                    <a href="EventoGenerales_C.html" ><button type="submit" class="btn btn-primary bg-primary" style=" border-color: #023047; color: #ffffff;"><b>Volver</b></button></a>
                              </div>
            </div>
        </div>
        <!-- Form End -->






        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light rounded-top p-4">
                <div class="col-12 col-sm-6 text-center text-sm-start">
                    &copy; <a href="#">Televecinos</a>, All Right Reserved.
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
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick-theme.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>