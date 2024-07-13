<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Preguntas frecuentes serenazgo</title>
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

        <!-- Other Elements Start -->


        <div class="container-fluid pt-4 px-4" >
            <div class="alert alert-info" role="alert" style="background-color: #ffb703;">
                <b>Preguntas frecuentes</b>
                <!--<button class="btn btn-success btn-sm-2 edit-btn" style="margin-left: 750px" >Editar</button>-->
                <button type="button" class="btn btn-primary btn-sm-2 save-btn d-none btn-banear" style="margin-left: 750px">Guardar cambios</button>

                <div id="popup1" class="popup1" >
                    <div class="popup_contenido1">
                        <span class="close-btn" id="closePopupBtn">&times;</span>
                        <img src="img/check.png" alt="check" width="48" height="48" style="margin-top: -10px;">
                        <h2 style="margin-top: 20px;">Éxito</h2>
                        <p>Cambios guardados</p>

                    </div>
                </div>
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
                            <span class="response">Si olvidas tu contraseña, puedes seleccionar la opción "Olvidaste tu contraseña" en la página de inicio de sesión. Se te pedirá ingresar tu correo electrónico registrado y recibirás un correo con instrucciones para restablecer tu contraseña.</span>
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
                            <span class="response">Una vez que hayas ingresado a la plataforma, podrás ver en la sección de eventos una división en tres categorías: Cultura, Deportes y Eventos inscritos. Selecciona el tipo al que te deseas inscribir y observarás información sobre la fecha, lugar, descripción, y vacantes disponibles.</span>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="heading3">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            ¿Cómo puedo verificar el estado de las incidencias que he reportado?
                        </button>
                    </h2>
                    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="heading3" data-bs-parent="#accordionExample" style="">
                        <div class="accordion-body">
                            <span class="response">Ingresa al apartado incidencias y selecciona lista de incidencias. Podrás ver cada incidencias que has genreado y si se encuentra no evaluada, evaluada o si ha sido descartada por ser falsa.</span>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="heading4">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                            ¿Recibiré notificaciones sobre los eventos a los que me inscribí?
                        </button>
                    </h2>
                    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="heading4" data-bs-parent="#accordionExample" style="">
                        <div class="accordion-body">
                            <span class = "response">Sí, recibirás notificaciones por correo electrónico recordándote cuando el evento al que te inscribiste esté por comenzar (15 minutos de anticipación).</span>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="heading5">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                            ¿Qué debo hacer si tengo un problema o incidencia que reportar?
                        </button>
                    </h2>
                    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample" style="">
                        <div class="accordion-body">
                            <span class = "response">Si tienes un problema o incidencia que reportar, puedes abrir un caso a través de la opción de "Generar Incidencia" en la plataforma. Deberás proporcionar detalles como el nombre de la incidencia, el lugar exacto, referencias, fotos, tipo de incidencia y si se requiere una ambulancia.</span>
                        </div>
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
                            <span class="response">No puedes eliminar una incidencia una vez que ha sido reportada, pero puedes ver su progreso y el estado actual en la plataforma.</span>
                        </div>
                    </div>
                </div>
                <!---------->
            </div>

            <p></p>
            <div class="alert alert-info" role="alert" style="background-color: #ffb703;">
                <b>Ponte en contacto con nosotros</b>
            </div>
            <div>
                <div class="d-flex align-items-center border-bottom py-3">
                    <img class="rounded-circle flex-shrink-0" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                    <div class="w-100 ms-3">
                        <div class="d-flex w-100 justify-content-between">
                            <h6 class="mb-0">Administrador</h6>
                        </div>
                        <span>televecinos.unidos@gmail.com</span>
                    </div>
                </div>
            </div>
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
    document.addEventListener('DOMContentLoaded', function() {

        function desactivarStickyTop() {
            navbar.classList.remove('sticky-top');
        }

        function activarStickyTop() {
            navbar.classList.add('sticky-top');
        }
        document.addEventListener('click', function(event) {
            if (event.target.classList.contains('btn-banear')) {
                desactivarStickyTop();
                var popup = event.target.nextElementSibling;
                popup.style.display = 'block';
            }
        });

        document.addEventListener('click', function(event) {
            if (event.target.classList.contains('close-btn')) {
                activarStickyTop();
                var popup = event.target.closest('.popup1');
                popup.style.display = 'none';
            }
        });
    });

</script>
<script>
    $(document).ready(function(){
        $('.edit-btn').click(function(){
            $('.response').attr('contenteditable', 'true').focus();
            $('.save-btn').removeClass('d-none');
        });

        $('.save-btn').click(function(){
            $('.response').removeAttr('contenteditable');
            $(this).addClass('d-none');
        });
    });
</script>
</body>

</html>
