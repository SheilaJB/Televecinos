<%@ page import="org.example.televecinosunidos_appweb.model.beans.EventoB" %>
<%@ page import="java.util.ArrayList" %>
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

    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style_vec.css" rel="stylesheet">

    <style>
        .evento-titulo {
            font-size: 2.5rem; /* Tamaño del título */
            color: #0c0e12; /* Color del texto */
            font-weight: bold; /* Grosor del texto */
            text-align: center; /* Alineación central */
            margin-top: 20px; /* Margen superior */
            margin-bottom: 10px; /* Margen inferior */
            text-shadow: 1px 1px 2px #aaa; /* Sombra del texto */
        }

        .evento-subtitulo {
            font-size: 1.2rem; /* Tamaño del subtítulo */
            color: #555; /* Color del texto */
            text-align: center; /* Alineación central */
            margin-top: 10px; /* Margen superior */
            margin-bottom: 40px; /* Margen inferior */

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
    <jsp:include page="../includes/barraLateralVecino.jsp"></jsp:include>
    <!-- BARRA AZUL DE LA IZQUIERDA FINAL -->


    <!-- Content Start -->
    <div class="content">
        <!-- PARTE SUPERIOR INICIO -->
        <jsp:include page="../includes/navbarVecino.jsp"></jsp:include>
        <!-- PARTE SUPERIOR FINAL -->

        <!-- Mostrar información del evento-->
        <div class="container-fluid pt-4 px-4">
            <div class="jumbotron text-center">
                <h2 class="evento-titulo">
                    <%= request.getAttribute("evento") != null ?((EventoB) request.getAttribute("evento")).getNombre() :"" %>
                </h2>
                <h6 class="evento-subtitulo">
                    ¡Recuerda revisar la frecuencia del evento y acomodar tu calendario para que no te pierdas este evento!
                </h6>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <form>
                        <div class="card shadow-sm" >
                            <div class="card-header text-lg-center">
                                <h5>Información del evento</h5>
                            </div>
                            <div class="card-body">
                                <div class="row mb-3">
                                    <div class="col-12">
                                        <img id="preview" src="#" alt="Vista previa de la imagen" class="img-thumbnail" style="display: none;">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Descripción:</b></label>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ?((EventoB) request.getAttribute("evento")).getDescripcion() :"" %>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Coordinador(a):</b></label>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ? ((EventoB) request.getAttribute("evento")).getNombreCoordinador() + " " + ((EventoB) request.getAttribute("evento")).getApellidoCoordinador() : "" %>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Instructor(a):</b></label>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ? ((EventoB) request.getAttribute("evento")).getNombreProfesor() + " " + ((EventoB) request.getAttribute("evento")).getApellidoProfesor() : "" %>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Lugar:</b></label>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ?((EventoB) request.getAttribute("evento")).getLugar() :"" %>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Frecuencia:</b></label>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ?((EventoB) request.getAttribute("evento")).getFrecuenciaString() :"" %>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Dia(s):</b></label>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ?((EventoB) request.getAttribute("evento")).getDiaEvento() :"" %>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Cantidad de vacantes:</b></label>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ?((EventoB) request.getAttribute("evento")).getCantidadVacantes() :"" %>
                                        </div>
                                    </div>
                                    <% if ("Disponible".equals(((EventoB) request.getAttribute("evento")).getEstadoString())) {%>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Cantidad de vacantes disponibles:</b></label>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ?((EventoB) request.getAttribute("evento")).getCantDisponibles() :"" %>
                                        </div>
                                    </div>
                                    <% } %>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Fecha de inicio:</b></label>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ?((EventoB) request.getAttribute("evento")).getFecha_inicio() :"" %>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Fecha de finalización:</b></label>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ?((EventoB) request.getAttribute("evento")).getFecha_fin() :"" %>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Hora de inicio:</b></label>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ?((EventoB) request.getAttribute("evento")).getHora_inicio() :"" %>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Hora de finalización:</b></label>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ?((EventoB) request.getAttribute("evento")).getHora_fin() :"" %>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Lista de materiales:</b></label>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ?((EventoB) request.getAttribute("evento")).getListaMateriales() :"" %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-6" >
                    <form>
                        <div class="rounded h-100 p-4"style="background-color: #ffb703;">
                            <div class="mb-3">
                                <img src="ImagenServlet?idImagenEvento=<%= request.getAttribute("evento") != null?((EventoB) request.getAttribute("evento")).getIdEvento() :""%>" class="img-responsive" alt="" style="width: 100%; height: auto;" />
                            </div>
                        </div>
                    </form>
                    <div id="Prox_Eventos " class="container-fluid pt-4 px-4">
                        <h3 style="text-align: center; margin-top:20px;margin-bottom:20px;">Galeria de nuestros recuerdos</h3>

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

                    <form method="post" action="<%=request.getContextPath()%>/VecinoServlet?action=inscribirEvento&idEvento=<%=request.getAttribute("evento") != null ? ((EventoB) request.getAttribute("evento")).getIdEvento() : ""%>">
                        <div class="d-flex justify-content-center mt-4">

                                <% if ("Disponible".equals(((EventoB) request.getAttribute("evento")).getEstadoString())) {%>
                                    <button id="inscribirButton" type="button" class="btn btn-primary" <%= ((EventoB) request.getAttribute("evento"))%>>Inscribirse a este evento</button>
                                <% } %>
                        </div>
                    </form>

                    <div class="d-flex justify-content-center mt-4">
                        <a href="<%=request.getContextPath()%>/VecinoServlet?action=verEventos">
                            <button type="button" class="btn btn-secondary">Regresar</button>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <script>
            <% if (session.getAttribute("err") != null) { %>
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: '<%= session.getAttribute("err") %>',
            });
            <% session.removeAttribute("err"); %>
            <% } %>

            <% if (session.getAttribute("info") != null) { %>
            Swal.fire({
                icon: 'success',
                title: 'Éxito',
                text: '<%= session.getAttribute("info") %>',
            });
            <% session.removeAttribute("info"); %>
            <% } %>

            document.getElementById('inscribirButton').addEventListener('click', function() {
                Swal.fire({
                    title: 'Confirmar Inscripción',
                    text: "¿Estás seguro que deseas inscribirte en este evento?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Sí, inscribirme',
                    cancelButtonText: 'Cancelar'
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Submit the form if the user confirms
                        this.closest('form').submit();
                    }
                });
            });
        </script>

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

        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light rounded-top p-4">
                <div class="row">
                    <div class="col-12 col-sm-6 text-center text-sm-start">
                        &copy; <a >TelevecinosUnidos</a>, All Right Reserved.
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
