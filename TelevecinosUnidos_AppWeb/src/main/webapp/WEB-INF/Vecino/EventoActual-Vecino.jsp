<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Información Evento</title>
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
    <jsp:include page="../includes/barraLateralVecino.jsp"></jsp:include>
    <!-- BARRA AZUL DE LA IZQUIERDA FINAL -->


    <!-- Content Start -->
    <div class="content">
        <!-- PARTE SUPERIOR INICIO -->
        <jsp:include page="../includes/navbarVecino.jsp"></jsp:include>
        <!-- PARTE SUPERIOR FINAL -->


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
                            <label for="nombreCoordinador" class="form-label" style="color:#023047;"><b>Coordinador(a):</b></label>
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
                <script>
                    document.getElementById('subirFoto').addEventListener('change', function(event) {
                        var file = event.target.files[0];
                        if (file) {
                            var reader = new FileReader();
                            reader.onload = function(e) {
                                var imgElement = document.getElementById('preview');
                                imgElement.src = e.target.result;
                                imgElement.style.display = 'block'; // Muestra la imagen
                            };
                            reader.readAsDataURL(file);
                        }
                    });
                </script>


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

        <!-- Galeria de fotos -->
        <div id="Prox_Eventos " class="container-fluid pt-4 px-4">
            <h3 style="text-align: center; margin-top:50px;margin-bottom:50px;">Galeria de nuestros recuerdos</h3>

            <div class="rounded h-100 p-4" style=" background-color: #ffb703; padding: 20px; align-items: center;">
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="row">
                                <img src="img/Deporte/ninas-jugando-voleibol.jpg" class="d-block w-100" alt="Slide 1">
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="row">

                                <img src="img/Deporte/girl-posing-with-volley-ball.jpg" class="d-block w-100" alt="Slide 1">

                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="row">
                                <img src="img/Deporte/girls-training-volleyball-field.jpg" class="d-block w-100" alt="Slide 1">

                            </div>

                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>


            </div>
        </div>
        <!-- Botón para crear evento -->
        <div style="text-align: right; margin-right: 100px; padding-top: 2%;">
            <a href="inicioVecino.html"><button type="submit" class="btn btn-primary" style="background-color: #023047; border-color: #023047; color: #ffffff;"><b>Volver al Inicio</b></button></a>
        </div>


        <!-- Eventos próximos-->
        <div id="Prox_Eventos " class="container-fluid pt-4 px-4">
            <h3 style="text-align: center; margin-top:50px;margin-bottom:50px;">¡Descubre nuestros próximos eventos!</h3>

            <div class="rounded h-100 p-4" style=" background-color: #ffb703; padding: 20px; align-items: center;">
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="row">
                                <div class="col"class="mb-3" style="width: 60%;">
                                    <img src="img/Deporte/ninas-jugando-voleibol.jpg" class="d-block w-100" alt="Slide 1">
                                </div>
                                <div class="col" style="width: 40%;">
                                    <h4 style="text-align: center;" style="color:#023047;"> Titulo</h4>
                                    <p style="text-align: justify;color:white;">
                                        El sol se asomaba tímidamente entre las nubes dispersas, pintando de tonos dorados el paisaje que se extendía ante mis ojos.
                                        El suave murmullo del viento me envolvía mientras caminaba por el sendero cubierto de hojas secas.
                                    </p>
                                    <div class="row" style="display: flex; align-items: center; margin: 10px;">

                                        <a class="link-opacity-50-hover" style="font-size: small;"href="EventFut.html">Más información aquí</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="row">
                                <div class="col" style="width: 60%;">
                                    <img src="img/Deporte/girl-posing-with-volley-ball.jpg" class="d-block w-100" alt="Slide 1">
                                </div>
                                <div class="col" style="width: 40%;">
                                    <h4 style="text-align: center;"> Reseña</h4>
                                    <p style="text-align: justify;">
                                        El sol se asomaba tímidamente entre las nubes dispersas, pintando de tonos dorados el paisaje que se extendía ante mis ojos.
                                        El suave murmullo del viento me envolvía mientras caminaba por el sendero cubierto de hojas secas.
                                        El aroma fresco del bosque me recordaba a la infancia, evocando recuerdos perdidos en el tiempo.
                                        Cada paso me acercaba un poco más a la paz interior que tanto anhelaba, dejando atrás el bullicio del mundo moderno y sumergiéndome en la tranquilidad de la naturaleza
                                    </p>
                                    <div class="row" style="display: flex; align-items: center; margin: 10px;">

                                        <a class="link-opacity-50-hover" style="font-size: small;"href="EventFut.html">Más información aquí</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="row">
                                <div class="col" style="width: 60%;">
                                    <img src="img/Deporte/girls-training-volleyball-field.jpg" class="d-block w-100" alt="Slide 1">
                                </div>
                                <div class="col" style="width: 40%;">
                                    <h4 style="text-align: center;"> Reseña</h4>
                                    <p style="text-align: justify;">
                                        El sol se asomaba tímidamente entre las nubes dispersas, pintando de tonos dorados el paisaje que se extendía ante mis ojos.
                                        El suave murmullo del viento me envolvía mientras caminaba por el sendero cubierto de hojas secas.
                                        El aroma fresco del bosque me recordaba a la infancia, evocando recuerdos perdidos en el tiempo.
                                        Cada paso me acercaba un poco más a la paz interior que tanto anhelaba, dejando atrás el bullicio del mundo moderno y sumergiéndome en la tranquilidad de la naturaleza
                                    </p>
                                    <div class="row" style="display: flex; align-items: center; margin: 10px;">

                                        <a class="link-opacity-50-hover" style="font-size: small;"href="EventFut.html">Más información aquí</a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>


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
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick-theme.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>