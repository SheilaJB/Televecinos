<%@ page import="org.example.televecinosunidos_appweb.model.beans.IncidenciasB" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<% ArrayList<IncidenciasB> listaIncidencia = (ArrayList<IncidenciasB>) request.getAttribute("listaIncidencia"); %>

<head>
    <meta charset="utf-8">
    <title>Inicio vecino</title>
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


        <!-- Mostrar inicio de coordinador-->

        <!-- Eventos próximos-->
        <div id="Eventos Recientes ">
            <div  class="text-center">
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner" >
                        <div class="carousel-item active">
                            <img src="img/deporte/chino-rocha-2FKTyJqfWX8-unsplash.jpg" class="d-block w-100" alt="Slide 1">
                            <div class="carousel-caption d-none d-md-block">
                                <h3><b>Evento 1</b></h3>
                                <p>Some representative placeholder content for the first slide.</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="img/Deporte/wesley-tingey-dKCKiC0BQtU-unsplash.jpg" class="d-block w-100" alt="Slide 1">
                            <div class="carousel-caption d-none d-md-block">
                                <h3><b>Evento 1</b></h3>
                                <p>Some representative placeholder content for the first slide.</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="img/Deporte/girls-training-volleyball-field.jpg" class="d-block w-100" alt="Slide 1">
                            <div class="carousel-caption d-none d-md-block">
                                <h3><b>Evento 1</b></h3>
                                <p>Some representative placeholder content for the first slide.</p>
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

            <!-- Recent Sales Start -->
            <div style="padding: 20px;">
                <!-- Mostrar mis eventos inscritos-->
                <div class="bg-light text-center rounded p-4" >
                    <div class="d-flex align-items-center  justify-content-between mb-4">
                        <h6 class="mb-0">Mis últimas incidencias </h6>
                        <a href="<%=request.getContextPath()%>//VecinoServlet?action=listarIncidencia">Más detalles</a>

                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                            <tr class="text-dark" >

                                <th scope="col ">Incidencia</th>
                                <th scope="col">Fecha</th>
                                <th scope="col">Hora</th>
                                <th scope="col">Tipo</th>
                                <th scope="col">Estado</th>
                                <th scope="col">Ver detalles</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% if (listaIncidencia != null) {
                                for (IncidenciasB incidencia : listaIncidencia) { %>
                            <tr>
                                <td><%= incidencia.getNombreIncidencia() %></td>
                                <td><%= incidencia.getFecha() %></td>
                                <td><%= incidencia.getHora() %></td>
                                <td><%= incidencia.getTipoIncidencia() %></td>
                                <td><%= incidencia.getEstadoIncidencia() %></td>
                                <td>
                                    <a href="<%=request.getContextPath()%>/VecinoServlet?action=verIncidencia&idIncidencia=<%= incidencia.getIdIncidencias() %>">
                                        <button type="button" class="btn btn-info m-2"><i class="fas fa-eye"></i></button>
                                    </a>
                                </td>
                            </tr>
                            <% }
                            } else { %>
                            <tr>
                                <td colspan="7" class="text-center">No hay incidencias disponibles</td>
                            </tr>
                            <% } %>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div style="padding: 30px;">
                <!-- Mostrar mis eventos inscritos-->
                <div class="bg-light text-center rounded p-4" >
                    <div class="d-flex align-items-center  justify-content-between mb-4">
                        <h6 class="mb-0">Mis eventos del mes </h6>
                        <a href="ListaEvent-Vecino.html" >Mostrar todos mis eventos</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                            <tr class="text-dark" >

                                <th scope="col ">Evento</th>
                                <th scope="col">Tipo</th>
                                <th scope="col">Fecha de inicio</th>
                                <th scope="col">Frecuencia</th>
                                <th scope="col">Ver detalles</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>

                                <td>Voley</td>
                                <td>Deporte</td>
                                <td>1/05/24</td>
                                <td>Diario</td>
                                <td><a href="EventoActual-Vecino.html"><button type="button" class="btn btn-info m-2 letraBoton">Detalles</button></td></a>
                            </tr>
                            <tr>

                                <td>Danza</td>
                                <td>Cultura</td>
                                <td>1/05/24</td>
                                <td>Lunes-Miercoles</td>
                                <td><a href="EventoActual-Vecino.html"><button type="button" class="btn btn-info m-2 letraBoton">Detalles</button></td></a>
                            </tr>
                            <tr>

                                <td>Futbol</td>
                                <td>Deporte</td>
                                <td>1/05/24</td>
                                <td>Martes-Jueves</td>
                                <td><a href="EventoActual-Vecino.html"><button type="button" class="btn btn-info m-2 letraBoton">Detalles</button></td></a>
                            </tr>

                            </tbody>
                        </table>
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
    <script src='https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.34/moment-timezone-with-data.min.js'></script>


    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>