<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Eventos-Coordinador</title>
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
    <link href="css/style_moreInfoVecino.css" rel="stylesheet">
    <link href="css/style_incidencias.css" rel="stylesheet">
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
    <!-- Sidebar Start -->
    <div class="sidebar pe-4 pb-3" style="background-color: #8ecae6;">
        <nav class="navbar" style="background-color: #8ecae6;" >
            <a class="navbar-brand mx-3 mb-3">
                <h4 class="text-primary"><b>Televecinos Unidos</b></h4>
            </a>
            <div class="d-flex align-items-center ms-4 mb-4"  >
                <img class="rounded-circle" src="img/Icon_perfil.png" alt="" style="width: 50px; height: 50px;">
                <div class="ms-3" >
                    <h6 class="mb-0" style="color:#023047;"><b>Nombre Apellido</b></h6>
                    <span class="text-muted"><b>Vecino</b></span>
                </div>
            </div>
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
                <a href="<%=request.getContextPath()%>/VecinoServlet?action=preguntasFrecuentes"class="nav-item nav-link "><i class="fa fa-question-circle me-2"></i><span style="font-size: 13.5px;"><b>Preguntas frecuentes</b></a>
            </div>
        </nav>
    </div>
    <!-- Sidebar End -->
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
            <a class="navbar-brand mx-4 mb-3 d-flex align-items-center" style="padding-top: 2%;">
                <img class="rounded-circle" src="img/logo.jpg" alt="" style="width: 40px; height: 40px;">
                <h3 class="m-0 me-2 px-2" style="color:#023047;">¡Bienvenido, televecino!</h3>
            </a>
            <div class="navbar-nav align-items-center ms-auto">

                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <img class="rounded-circle me-lg-2" src="img/Icon_perfil.png" alt="" style="width: 40px; height: 40px;">
                        <span class="d-none d-lg-inline-flex">Nombre Apellido</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                        <a href="<%=request.getContextPath()%>/VecinoServlet?action=perfilVecino" class="dropdown-item">Mi perfil</a>
                        <a href="index.html" class="dropdown-item">Cerrar sesión</a>
                    </div>
                </div>
            </div>
        </nav>
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

                <!----Lista de Materiales---->
                <div class="col-sm-12 col-xl-6">
                    <!-- Botón para crear evento -->
                    <h3>Selecciona la frecuencia: </h3>
                    <select id="tipoIncidencia" name="tipoIncidencia">
                        <option value="opcion1">Lunes-Miércoles</option>
                        <option value="opcion1">Martes-Jueves</option>
                    </select>


                    <div class="BotonRegistro">
                        <button type="button" class="btn btn-lg btn-primary m-2" style="background-color: #023047; border-color: #023047; color: #ffffff;">Registrarse</button>
                    </div>


                </div>




                <script>
                    document.addEventListener('DOMContentLoaded', function() {
                        var materialesContainer = document.getElementById('materialesContainer');
                        var addMaterialButton = document.getElementById('addMaterial');

                        addMaterialButton.addEventListener('click', function() {
                            var newInputGroup = document.createElement('div');
                            newInputGroup.classList.add('input-group', 'mb-3');

                            var newInput = document.createElement('input');
                            newInput.type = 'text';
                            newInput.name = 'materiales[]';
                            newInput.classList.add('form-control');
                            newInput.placeholder = 'Presione - para eliminar este material';

                            var removeButton = document.createElement('button');
                            removeButton.classList.add('btn', 'btn-outline-danger');
                            removeButton.type = 'button';
                            removeButton.textContent = '−';

                            // Evento para eliminar el campo
                            removeButton.addEventListener('click', function() {
                                this.parentElement.remove();
                            });

                            newInputGroup.appendChild(newInput);
                            newInputGroup.appendChild(removeButton);

                            materialesContainer.appendChild(newInputGroup);
                        });
                    });
                </script>

            </div>
        </div>
        <!-- Form End -->

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
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick-theme.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>