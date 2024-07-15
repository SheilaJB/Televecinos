<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.televecinosunidos_appweb.model.beans.EventoB" %>
<%@ page import="java.util.ArrayList" %>
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

    <!-- Content Start -->
    <div id="navbar" class="content">
        <!-- Navbar Start -->
        <jsp:include page="../includes/navbarCoordinador.jsp"></jsp:include>
        <!-- Navbar End -->


        <!-- Form Start -->
        <div class="container-fluid pt-4 px-4">
            <!-- Agregar el botón de regreso en la esquina superior derecha -->

            <div class="campo">
                <h2><%= request.getAttribute("evento") != null ? ((EventoB) request.getAttribute("evento")).getNombre() : "" %></h2>
                <br>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <form>
                        <div class="card shadow-sm">
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
                                        <label class="form-label" style="color:#023047;"><b>Descripción:</b></label><br>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ? ((EventoB) request.getAttribute("evento")).getDescripcion() : "" %>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Coordinador(a):</b></label><br>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ? ((EventoB) request.getAttribute("evento")).getNombreCoordinador() + " " + ((EventoB) request.getAttribute("evento")).getApellidoCoordinador() : "" %>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Instructor(a):</b></label><br>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ? ((EventoB) request.getAttribute("evento")).getNombreProfesor() + " " + ((EventoB) request.getAttribute("evento")).getApellidoProfesor() : "" %>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Lugar:</b></label><br>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ? ((EventoB) request.getAttribute("evento")).getLugar() : "" %>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Frecuencia:</b></label><br>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ? ((EventoB) request.getAttribute("evento")).getFrecuenciaString() : "" %>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Dia(s):</b></label><br>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ? ((EventoB) request.getAttribute("evento")).getDiaEvento() : "" %>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Cantidad de vacantes:</b></label><br>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ? ((EventoB) request.getAttribute("evento")).getCantidadVacantes() : "" %>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Cantidad de vacantes disponibles:</b></label><br>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ? ((EventoB) request.getAttribute("evento")).getCantDisponibles() : "" %>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Fecha de inicio:</b></label><br>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ? ((EventoB) request.getAttribute("evento")).getFecha_inicio() : "" %>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Fecha de finalización:</b></label><br>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ? ((EventoB) request.getAttribute("evento")).getFecha_fin() : "" %>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Hora de inicio:</b></label><br>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ? ((EventoB) request.getAttribute("evento")).getHora_inicio() : "" %>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Hora de finalización:</b></label><br>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ? ((EventoB) request.getAttribute("evento")).getHora_fin() : "" %>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label" style="color:#023047;"><b>Lista de materiales:</b></label><br>
                                        <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                            <%= request.getAttribute("evento") != null ? ((EventoB) request.getAttribute("evento")).getListaMateriales() : "" %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-6" style="margin-top: 5%">
                    <form>
                        <div class="rounded h-100 p-4" style="background-color: #ffb703;">
                            <div class="mb-3">
                                <img src="ImagenServlet?action=evento&idImagenEvento=<%= request.getAttribute("evento") != null ? ((EventoB) request.getAttribute("evento")).getIdEvento() : "" %>" class="img-responsive" alt="" style="width: 100%; height: auto;">
                            </div>
                        </div>
                    </form>

                    <% if (request.getAttribute("evento") != null) {
                        EventoB eventoB = (EventoB) request.getAttribute("evento");
                        if ("Finalizado".equals(eventoB.getEstadoString())) {
                    %>
                    <div id="Prox_Eventos" class="container-fluid pt-4 px-4">
                        <h3 style="text-align: center; margin-top: 20px; margin-bottom: 20px;">Galeria de nuestros recuerdos</h3>

                        <div class="rounded h-100 p-4" style="background-color: #ffb703; padding: 20px; align-items: center;">
                            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-indicators">
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                </div>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <div class="row">
                                            <img src="<%= request.getContextPath() %>/ImagenServlet?action=galeria&idEvento=<%= request.getAttribute("evento") != null ? ((EventoB) request.getAttribute("evento")).getIdEvento() : "" %>&nombreFoto=foto1" class="img-fluid" alt="Foto 1">
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <div class="row">
                                            <img src="<%= request.getContextPath() %>/ImagenServlet?action=galeria&idEvento=<%= request.getAttribute("evento") != null ? ((EventoB) request.getAttribute("evento")).getIdEvento() : "" %>&nombreFoto=foto2" class="img-fluid" alt="Foto 2">
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <div class="row">
                                            <img src="<%= request.getContextPath() %>/ImagenServlet?action=galeria&idEvento=<%= request.getAttribute("evento") != null ? ((EventoB) request.getAttribute("evento")).getIdEvento() : "" %>&nombreFoto=foto3" class="img-fluid" alt="Foto 3">
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
                    <% }
                    }
                    %>
                    <div class="container-fluid pt-2 d-flex justify-content-end">
                        <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=listarInscritos&idEvento=<%= request.getAttribute("evento") != null ? ((EventoB) request.getAttribute("evento")).getIdEvento() : "" %>">
                            <button type="button" class="btn btn-secondary me-2">
                                <i class="fas fa-users"></i> Ver Lista de inscritos
                            </button>
                        </a>
                        <button class="btn btn-secondary" onclick="goBack()">Regresar</button>
                    </div>
                </div>
            </div>
        </div>
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
    <script src="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
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

    <script>
        function goBack() {
            window.history.back();
        }
    </script>

</div>
</body>
</html>
