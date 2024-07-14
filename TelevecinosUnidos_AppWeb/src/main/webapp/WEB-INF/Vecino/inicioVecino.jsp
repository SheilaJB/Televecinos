<%@ page import="org.example.televecinosunidos_appweb.model.beans.IncidenciasB" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.televecinosunidos_appweb.model.beans.EventoB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<% ArrayList<IncidenciasB> listaIncidencia = (ArrayList<IncidenciasB>) request.getAttribute("listaIncidencia"); %>
<% ArrayList<EventoB> eventosInscritos = (ArrayList<EventoB>) request.getAttribute("eventosInscritos"); %>

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

    <!-- Custom Styles -->
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
        .btn-info {
            background-color: #00b4d8;
            border-color: #00b4d8;
            font-size: 0.8rem;
            padding: .25rem .5rem;
        }
        .btn-info:hover {
            background-color: #138496;
            border-color: #117a8b;
        }
        .reduced-height {
            height: 550px; /* Cambia 300px por la altura que desees */
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

    <!-- BARRA AZUL DE LA IZQUIERDA INICIO-->
    <jsp:include page="../includes/barraLateralVecino.jsp"></jsp:include>
    <!-- BARRA AZUL DE LA IZQUIERDA FINAL -->

    <!-- Content Start -->
    <div class="content">
        <!-- PARTE SUPERIOR INICIO -->
        <jsp:include page="../includes/navbarVecino.jsp"></jsp:include>
        <!-- PARTE SUPERIOR FINAL -->

        <!-- Mostrar inicio de coordinador-->
        <div class="container-fluid pt-4 px-4">
            <div class="row g-4" style="padding: 10px;">
                <div class="col-sm-12 col-md-6 bg-light">
                    <div class="p-3">
                        <img src="<%= request.getContextPath() %>/img/fondoPantalla.png" alt="Bienvenida Vecino" class="img-fluid blur-image reduced-height" style="margin-bottom: 10px;" >
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <section id="Titulo_Incidencia" class="card">
                        <div class="card-body card border-secondary">
                            <header>
                                <h2 class="card-title card-header bg-transparent">¡Puedes reportar incidencias en tu comunidad!</h2>
                            </header>
                            <article class="mt-2">
                                <p>¿Ves algún problema en tu vecindario? Repórtalo a la Municipalidad de San Miguel para que podamos solucionarlo juntos. Tu participación es clave para mantener nuestra comunidad segura y en buen estado.</p>
                            </article>
                            <footer class="mt-2">
                                <button class="btn btn-success btn-block" onclick="window.location.href='<%=request.getContextPath()%>/VecinoServlet?action=listarIncidencia'">Ver Incidencias</button>
                                <h6 class="mt-2">¿Has reportado alguna incidencia? <a href="<%=request.getContextPath()%>/VecinoServlet?action=crearIncidencia">Registra tu incidencia aquí</a>.</h6>
                            </footer>
                        </div>
                    </section>
                    <section id="Titulo_Eventos" class="card" style="margin-top: 5px">
                        <div class="card-body card border-secondary">
                            <header>
                                <h2 class="card-title card-header bg-transparent">¡No te pierdas nuestros eventos de cultura y deporte!</h2>
                            </header>
                            <article class="mt-2">
                                <p>La Municipalidad de San Miguel te invita a participar en una variedad de eventos emocionantes. ¡Encuentra actividades para toda la familia y descubre nuevas formas de conectar con tu comunidad!</p>
                            </article>
                            <footer class="mt-2">
                                <button class="btn btn-success btn-block" onclick="window.location.href='<%=request.getContextPath()%>/VecinoServlet?action=verEventos'">Explorar Eventos</button>
                                <h6 class="mt-2">¿Ya te inscribiste? <a href="<%=request.getContextPath()%>/VecinoServlet?action=eventosInscritos">Revisa tus eventos aquí</a>.</h6>
                            </footer>
                        </div>
                    </section>
                </div>
            </div>
        </div>

        <!-- Eventos próximos-->
        <div id="Eventos Recientes">
            <!-- Recent Sales Start -->
            <div style="padding: 20px;">
                <!-- Mostrar mis eventos inscritos-->
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Mis incidencias del mes</h6>
                        <a href="<%=request.getContextPath()%>/VecinoServlet?action=listarIncidencia">Mostrar todas mis incidencias</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-sm table-striped table-bordered table-hover">
                            <thead>
                            <tr class="text-dark">
                                <th scope="col">Incidencia</th>
                                <th scope="col">Fecha</th>
                                <th scope="col">Hora</th>
                                <th scope="col">Tipo</th>
                                <th scope="col">Estado</th>
                                <th scope="col">Ver detalles</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% if (listaIncidencia != null ) {
                                for (IncidenciasB incidencia : listaIncidencia) { %>
                            <tr>
                                <td><%= incidencia.getNombreIncidencia() %></td>
                                <td><%= incidencia.getFecha() %></td>
                                <td><%= incidencia.getHora() %></td>
                                <td><%= incidencia.getTipoIncidencia() %></td>
                                <td><%= incidencia.getEstadoIncidencia() %></td>
                                <td>
                                    <a href="<%=request.getContextPath()%>/VecinoServlet?action=verIncidencia&idIncidencia=<%= incidencia.getIdIncidencias() %>">
                                        <button type="button" class="btn btn-primary btn-sm-square m-1"><i class="fas fa-eye fa-xs"></i></button>
                                    </a>
                                </td>
                            </tr>
                            <% }
                            } else { %>
                            <tr>
                                <td colspan="6" class="text-center">No hay incidencias disponibles</td>
                            </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div style="padding: 30px;">
                <!-- Mostrar mis eventos inscritos-->
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Mis eventos del mes</h6>
                        <a href="<%=request.getContextPath()%>/VecinoServlet?action=verEventos">Mostrar todos mis eventos</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-sm table-striped table-bordered table-hover">
                            <thead>
                            <tr class="text-dark">
                                <th scope="col">Evento</th>
                                <th scope="col">Tipo</th>
                                <th scope="col">Fecha de inicio</th>
                                <th scope="col">Frecuencia</th>
                                <th scope="col">Ver detalles</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                if (eventosInscritos != null && !eventosInscritos.isEmpty()) {
                                    for (EventoB evento : eventosInscritos) {
                            %>
                            <tr>
                                <td><%= evento.getNombre() %></td>
                                <td><%= evento.getTipoEvento() %></td>
                                <td><%= evento.getFecha_inicio() %></td>
                                <td><%= evento.getFrecuenciaString() %></td>
                                <td>
                                    <a onclick="viewFunction(<%=evento.getIdEvento()%>)">
                                        <button type="button" class="btn btn-primary btn-sm-square m-1"><i class="fas fa-eye fa-xs"></i></button>
                                    </a>
                                </td>
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
                            <script>
                                function viewFunction(idEvento) {
                                    window.location.href ='<%=request.getContextPath()%>/VecinoServlet?action=verEventoInscrito&idEvento=' +idEvento;
                                }

                            </script>
                        </table>
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
