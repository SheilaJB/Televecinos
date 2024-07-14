<%@ page import="org.example.televecinosunidos_appweb.model.beans.IncidenciasB" %>
<%@ page import="org.example.televecinosunidos_appweb.model.beans.EventoB" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<IncidenciasB> listaIncidencia = (ArrayList<IncidenciasB>) request.getAttribute("listaIncidencia"); %>
<% ArrayList<EventoB> listaEvento = (ArrayList<EventoB>) request.getAttribute("listaEvento"); %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Inicio</title>
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
    <style>
        .table-sm th, .table-sm td {
            padding: .3rem;
            font-size: 0.8rem;
            font-weight: bold;
        }
        .table thead th {
            background-color: #ffb703;
            color: #495057;
        }
        .table-hover tbody tr:hover {
            background-color: #e9ecef;
        }
        .btn-sm-square {
            width: 20px;
            height: 20px;
            padding: 0;
            text-align: center;
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
    <jsp:include page="../includes/barraLateralCoordinador.jsp"></jsp:include>
    <!-- Sidebar End -->


    <!-- Content Start -->
    <div class="content">
        <!-- Navbar Start -->
        <jsp:include page="../includes/navbarCoordinador.jsp"></jsp:include>
        <!-- Navbar End -->


        <!-- Mostrar inicio de coordinador-->
        <div class="container-fluid pt-4 px-4">
            <div class="row g-4" style="padding: 10px;">
                <div class="col-sm-12 col-md-6 bg-light">
                    <div class="p-3">
                        <img src="img/imgEvent.jpg" alt="" class="img-fluid">
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <section id="Titulo_Eventos" class="card">
                        <div class="card-body">
                            <header>
                                <h2 class="card-title">¡Organiza eventos para tu comunidad!</h2>
                            </header>
                            <article>
                                <p>Como coordinadora, tienes la responsabilidad de crear y gestionar eventos que promuevan la participación y el bienestar en la comunidad.</p>
                            </article>
                            <footer>
                                <h6 class="mt-2"><button class="btn btn-success btn-block"  window.location.href='<%=request.getContextPath()%>/CoordinadorServlet?action=listar'>Ver Eventos Propios</button><a style="margin-left: 10px" href="<%=request.getContextPath()%>/CoordinadorServlet?action=eventoGeneralesC">Visita eventos de tu área aquí</a>.</h6>
                                <h6 class="mt-2">¿Quieres crear un nuevo evento? <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=crearEvento">Crea tu evento aquí</a>.</h6>
                            </footer>
                        </div>
                    </section>
                    <section id="Titulo_Incidencia" class="card" style="margin-top: 5px">
                        <div class="card-body">
                            <header>
                                <h2 class="card-title">¡Reporta incidencias!</h2>
                            </header>
                            <article>
                                <p>También puedes reportar incidencias que observes en tu comunidad</p>
                            </article>
                            <footer>
                                <h6 class="mt-2"><button class="btn btn-danger btn-block"  window.location.href='<%=request.getContextPath()%>/CoordinadorServlet?action=listarIncidencia'>Ver Incidencias</button></h6>
                                <h6 class="mt-2">¿Quieres reportar una incidencia? <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=generarIncidenciaC">Reporta tu incidencia aquí</a>.</h6>
                            </footer>
                        </div>
                    </section>
                </div>
            </div>
        </div>

        <!-- Recent Sales Start -->

        <div style="padding: 20px;">
            <!-- Mostrar mis eventos inscritos-->
            <div class="bg-light text-center rounded p-4">
                <div class="d-flex align-items-center justify-content-between mb-4">
                    <h6 class="mb-0">Mis incidencias del mes</h6>
                    <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=listarIncidencia">Mostrar todas mis incidencias</a>

                </div>
                <div class="table-responsive">
                    <table class="table table-sm table-striped table-bordered table-hover">
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
                                <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=verIncidencia&idIncidencia=<%= incidencia.getIdIncidencias() %>">
                                    <button  type="button" class="btn btn-primary btn-sm-square m-1"><i class="fas fa-eye fa-xs"></i></button>
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

        <div style="padding: 20px;">
            <!-- Mostrar mis eventos inscritos-->
            <div class="bg-light text-center rounded p-4">
                <div class="d-flex align-items-center justify-content-between mb-4">
                    <h6 class="mb-0">Mis eventos del mes</h6>
                    <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=lista">Mostrar todos mis eventos</a>
                </div>
                <div class="table-responsive">
                    <table class="table table-sm table-striped table-bordered table-hover">
                        <thead>
                        <tr class="text-dark" >
                            <th scope="col ">Evento</th>
                            <th scope="col">Fecha de inicio</th>
                            <th scope="col">Estado</th>
                            <th scope="col">Frecuencia</th>
                            <th scope="col">Ver detalles</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            if (listaEvento != null && !listaEvento.isEmpty()) {
                                for(EventoB eventoB : listaEvento){ %>
                        <tr>
                            <td><%= eventoB.getNombre() %></td>
                            <td><%= eventoB.getFecha_inicio() %></td>
                            <td><%= eventoB.getEstadoString() %></td>
                            <td><%= eventoB.getFrecuenciaString() %></td>
                            <td><a href="<%=request.getContextPath()%>/CoordinadorServlet?action=verEvento&idEvento=<%=eventoB.getidEvento()%>"><button type="button"  class="btn btn-primary btn-sm-square m-1"><i class="fas fa-eye fa-xs"></i></button></a></td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="8">No hay eventos programados en este mes.</td>
                        </tr>
                        <%
                            }
                        %>
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
<script src='https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.34/moment-timezone-with-data.min.js'></script>


<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>