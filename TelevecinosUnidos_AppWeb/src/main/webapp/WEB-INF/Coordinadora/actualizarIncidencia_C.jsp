<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Actualizar Incidencia</title>
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
    <link rel="stylesheet" href="css/style_incidencias.css">
    <link href="css/style_vec.css" rel="stylesheet">

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
        .popup-content {
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


    <!-- Sidebar Start -->
    <div class="sidebar pe-4 pb-3" style="background-color: #8ecae6;">
        <nav  class="navbar" style="background-color: #8ecae6;" >
            <a class="navbar-brand mx-3 mt-3">
                <h4 style="color:#023047"><b>Televecinos Unidos</b></h4>
            </a>
            <div class="d-flex align-items-center ms-4 mb-4"  >
                <img class="rounded-circle" src="img/coordinadora.jpg" alt="" style="width: 50px; height: 50px;">
                <div class="ms-3 m-3" >
                    <h6 class="mb-0" style="color:#023047;"><b>Nombre Apellido</b></h6>
                    <span class="text-muted"><b>Coordinador</b></span>
                </div>
            </div>
            <div class="navbar-nav w-100">
                <a href="VistaServlet?idVista=inicioCoordinador" class="nav-item nav-link"><i class="fa fa-home me-2"></i><span style="font-size: 13.5px;"><b>Inicio</b></span></a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-calendar me-2"></i><span style="font-size: 13.5px;"><b>Eventos</b></span></a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="VistaServlet?idVista=eventoGeneralesC" class="dropdown-item"><span style="font-size: 13.5px;"><b>Eventos generales</b></span></a>
                        <a href="VistaServlet?idVista=creacionEventoC" class="dropdown-item"><span style="font-size: 13.5px;"><b>Crear evento</b></span></a>
                        <a href="VistaServlet?idVista=listaEventoCoordinador" class="dropdown-item"><span style="font-size: 13.5px;"><b>Eventos propios</b></span></a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"><i class="fa fa-th-list me-2"></i><span style="font-size: 13.5px;"><b>Incidencias</b></span></a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="VistaServlet?idVista=generarIncidenciaC" class="dropdown-item"><span style="font-size: 13.5px;"><b>Crear incidencia</b></span></a>
                        <a href="VistaServlet?idVista=listaIncidenciaC" class="dropdown-item"><span style="font-size: 13.5px;"><b>Lista de incidencias</b></span></a>
                    </div>
                </div>
                <a href="VistaServlet?idVista=preguntasFrecuentesC" class="nav-item nav-link font-al"><i class="fa fa-question-circle me-2" ></i><span style="font-size: 13.5px;"><b>Preguntas frecuentes</b></span></a>
            </div>
        </nav>
    </div>
    <!-- Sidebar End -->


    <!-- Content Start -->
    <div id="navbar" class="content">
        <!-- Navbar Start -->
        <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
            <a href="#" class="sidebar-toggler flex-shrink-0">
                <i class="fa fa-bars"></i>
            </a>
            <a class="navbar-brand mx-4 mb-3 d-flex align-items-center" style="padding-top: 2%;">
                <img class="rounded-circle" src="img/logo.jpg" alt="" style="width: 40px; height: 40px;">
                <h3 class="m-0 me-2 px-2" style="color:#023047;">¡Bienvenido, coordinador!</h3>
            </a>
            <div class="navbar-nav align-items-center ms-auto">

                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <img class="rounded-circle me-lg-2" src="img/coordinadora.jpg" alt="" style="width: 40px; height: 40px;">
                        <span class="d-none d-lg-inline-flex" style="color:#023047;"><b>Nombre Apellido</b></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                        <a href="perfil_C.html" class="dropdown-item">Mi perfil</a>
                        <a href="index.html" class="dropdown-item">Cerrar sesión</a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Navbar End -->
        <!-- PARTE SUPERIOR FINAL -->



        <!-- LLENAR-->
        <!-- Footer Start -->

        <div class="container-fluid pt-4 px-4">
            <div class="container">
                <div class="columna columna1">
                    <div class="campo">
                        <h2>Reporte de incidencia</h2>
                        <h2 style="font-size: large;">Actualice los siguientes datos</h2>
                    </div>

                    <form>
                        <div class="campo">
                            <label for="nombreIncidencia">Nombre de la incidencia:</label><br>
                            <input type="text" id="nombreIncidencia" name="nombreIncidencia" placeholder="Escribe aquí"><br>
                        </div>
                        <div class="campo">

                            <div class="mb-3">
                                <label for="foto" class="boton-subir">Subir foto</label><br>
                                <input class="form-control" type="file" id="formFile" accept="image/*">
                            </div>
                            <script src="path/to/bootstrap.bundle.min.js"></script>
                        </div>
                        <div class="campo" style="margin-bottom: -35px; ">
                            <label for="tipoIncidencia">Tipo de incidencia:</label><br>
                            <select id="tipoIncidencia" name="tipoIncidencia">
                                <option value="opcion1">Seguridad Pública</option>
                                <option value="opcion2">Emergencia Médica</option>
                                <option value="opcion3">Infraestructura y Servicios Públicos</option>
                                <option value="otro">Otro</option>
                            </select><br>
                            <br>
                        </div>
                        <div class="campo" style="margin-bottom: -35px; ">
                            <label for="urbanizacion">Urbanización:</label><br>
                            <select id="urbanizacion" name="urbanizacion">
                                <option value="opcion1">Rafael Escardó</option>
                                <option value="opcion2">José de La Riva Agüero</option>
                                <option value="opcion3">Juan XXIII</option>
                                <option value="opcion3">Libertad</option>
                                <option value="opcion4">Los Jardines de La Marina</option>
                                <option value="opcion5">Las Leyendas</option>
                                <option value="opcion6">Las Torres San Miguelito</option>
                                <option value="opcion7">Elmer Faucett</option>
                                <option value="opcion8">Maranga</option>
                                <option value="opcion9">Pando</option>
                                <option value="opcion10">Maranga</option>
                                <option value="opcion11">Parques de La Huaca</option>

                                <option value="otro">Otro</option>
                            </select>
                            <br>
                            <br>
                        </div>
                        <div class="campo">
                            <label for="paraQuien">La incidencia será para: </label><br>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gridRadios"
                                       id="gridRadios1" value="option1">
                                <label class="form-check-label" for="gridRadios1">
                                    Para mi
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gridRadios"
                                       id="gridRadios2" value="option2">
                                <label class="form-check-label" for="gridRadios2">
                                    Para otra persona
                                </label>
                            </div>
                        </div>


                    </form>
                    <div class="m-n2">
                        <a href="listaIncidencias_C.html"></ahref><button type="button" class="btn btn-danger m-2" onclick="">Cancelar incidencia</button> </a>
                    </div>

                </div>
                <div class="columna columna2" style="margin-top: 102px;">
                    <form>
                        <div class="campo">
                            <label for="lugarExacto">Lugar exacto</label><br>
                            <input type="text" id="lugarExacto" name="lugarExacto" placeholder="Escribe aquí"><br>
                        </div>

                        <div class="campo">
                            <label for="referencia">Referencia</label><br>
                            <input type="text" id="referencia" name="referencia" placeholder="Escribe aquí"><br>
                        </div>

                        <div class="campo">
                            <label for="contacto">Contacto (opcional)</label><br>
                            <input type="text" id="contacto" name="contacto" placeholder="Escribe aquí"><br>
                        </div>
                        <div class="campo">
                            <label for="paraQuien">¿Requiere ambulancia? </label><br>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gridRadios"
                                       id="gridRadios1" value="option1">
                                <label class="form-check-label" for="gridRadios1">
                                    Sí
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gridRadios"
                                       id="gridRadios2" value="option2">
                                <label class="form-check-label" for="gridRadios2">
                                    No
                                </label>
                            </div>
                        </div>

                        <div class="m-n2">
                            <button type="button" class="btn btn-secondary m-2" onclick="mostrarPopup()">Reportar incidencia</button>
                            <div id="popup" class="popup">
                                <div class="popup_contenido">
                                    <!--contenido pop up-->
                                    <h3>Confirmar Actualización</h3>
                                    <h4>¿Estás seguro? </h4>
                                    <a href="listaIncidencias_C.html"><button type="button" class="btn btn-success rounded-pill m-2">Si</button></a>
                                    <a href="actualizarIncidencia_C.html"><button type="button" class="btn btn-danger rounded-pill m-2" >No</button></a>
                                    <!-- <button type="button" class="btn btn-danger rounded-pill m-2" >No</button> -->
                                    <!-- Popup Management -->
                                    <script>
                                        function mostrarPopup() {
                                            document.getElementById("popupActualizar").style.display = "block";
                                        }

                                        function cerrarPopup() {
                                            document.getElementById("popupActualizar").style.display = "none";
                                        }
                                    </script>

                                </div>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
        <script>
            const closeCreatePopupBtn = document.getElementById('closeCreatePopupBtn');
            const createConfirmationPopup = document.getElementById('createConfirmationPopup');
            const mainContent = document.querySelector('.content'); // Selecciona el contenido principal que quieres deshabilitar

            // Función para deshabilitar interacciones
            function disableInteractions() {
                mainContent.style.pointerEvents = 'none';
                mainContent.style.opacity = '0.4'; // Opcional: reduce la opacidad para un efecto visual de desactivado
            }

            // Función para habilitar interacciones
            function enableInteractions() {
                mainContent.style.pointerEvents = 'all';
                mainContent.style.opacity = '1'; // Restaura la opacidad
            }


            // Función para cerrar el popup y potencialmente redirigir al usuario
            function closeCreatePopup() {
                createConfirmationPopup.style.display = 'none';
                enableInteractions();
                //redirigir al usuario o recargar la página
                window.location.href = 'listaIncidencias_S.html';
            }

            // Evento para cerrar el popup cuando se presiona el botón de cerrar
            closeCreatePopupBtn.addEventListener('click', closeCreatePopup);

            // Función para mostrar el mensaje de éxito al crear un evento
            function mostrarMensajeExito() {
                createConfirmationPopup.style.display = 'block';
                disableInteractions();
            }

        </script>


        <div class="container-fluid pt-4 px-4" >
            <div class="bg-light rounded-top p-4">
                <div class="row">
                    <div class="col-12 col-sm-6 text-center text-sm-start">
                        &copy; <a href="#">TelevecinosUnidos</a>, All Right Reserved.
                    </div>
                </div>
            </div>
        </div>
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
            if (event.target.classList.contains('btn-secondary')) {
                desactivarStickyTop();
                var popup = event.target.nextElementSibling;
                popup.style.display = 'block';
            }
        });

        document.addEventListener('click', function(event) {
            if (event.target.classList.contains('close-btn')) {
                activarStickyTop();
                var popup = event.target.closest('.popup');
                popup.style.display = 'none';
            }
        });
    });

</script>
<!--cerrar pop up -->
<script>
    function cerrarPopup() {
        var popup = document.getElementById("popup");
        popup.style.display = "none";
    }
</script>

</body>

</html>