<%@ page import="org.example.televecinosunidos_appweb.model.beans.EventoB" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ArrayList<EventoB> listaEventos = (ArrayList<EventoB>) request.getAttribute("listaEventos");
%>
<jsp:useBean id="textoBuscarEventoG" scope="request" type="java.lang.String" class="java.lang.String"/>

<%
    int paginaActual = (int) request.getAttribute("paginaActual");
    int totalPaginas = (int) request.getAttribute("totalPaginas");
%>
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
    <link href="css/style_vec.css" rel="stylesheet">
    <style>
        .card {
            height: 100%;
            display: flex;
            flex-direction: column;
        }
        .card-img-top {
            height: 180px;
            object-fit: cover;
        }
        .card-body {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            flex-grow: 1;
        }
        .card a {
            margin-top: auto;
        }
        @media (max-width: 768px) {
            .card-img-top {
                height: 150px;
            }
            .card-body {
                flex-grow: 0;
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


    <jsp:include page="../includes/barraLateralCoordinador.jsp"></jsp:include>
    <!-- Sidebar End -->

    <!-- Content Start -->
    <div id="navbar" class="content">
        <!-- Navbar Start -->
        <jsp:include page="../includes/navbarCoordinador.jsp"></jsp:include>
        <!-- Navbar End -->


        <!-- Mostrar eventos de deporte-->


        <section id="titulo-eventos" class="container my-5">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h1 style="text-align: center"><i class="fas fa-calendar-alt"></i> ¡Eventos organizados por los coordinadores de San Miguel!</h1>
                    <p class="lead">
                        Puedes buscar eventos de tu área y ver los eventos que has creado.
                    </p>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-6" style="text-align: center">
                    <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=lista" class="btn btn-outline-secondary btn-lg btn-block mt-3">
                        Ver mis propios eventos
                    </a>
                </div>
            </div>
        </section>

        <div style="background-color: #FFB703; padding: 20px; border: 1px solid #ccc; border-radius: 5px;">
            <form method="post" action="<%=request.getContextPath()%>/CoordinadorServlet?action=buscarEvento">
                <div class="row justify-content">
                    <!-- Busqueda por nombre de evento -->
                    <div class="col-md-2 mb-2">
                        <input type="text" class="form-control" id="filtroInput" placeholder="Buscar..." name="textoBuscarEventoG"
                               value="<%=request.getAttribute("textoBuscarEventoG") != null ? request.getAttribute("textoBuscarEventoG") : ""%>">
                    </div>
                    <div class="col-md-2 mb-2">
                        <input type="date" class="form-control" name="fechaG"
                               value="<%=request.getAttribute("fechaG") != null ? request.getAttribute("fechaG") : ""%>">
                    </div>
                    <div class="col-md-2 mb-2">
                        <select class="form-select" name="frecuenciaG">
                            <option selected disabled>Frecuencia</option>
                            <option value="1" <%= "1".equals(request.getAttribute("frecuenciaG")) ? "selected" : "" %>>Semanal</option>
                            <option value="2" <%= "2".equals(request.getAttribute("frecuenciaG")) ? "selected" : "" %>>Dos veces por semana</option>
                        </select>
                    </div>
                    <div class="col-md-2 mb-2">
                        <select class="form-select" name="estadoG">
                            <option selected disabled>Estado</option>
                            <option value="1" <%= "1".equals(request.getAttribute("estadoG")) ? "selected" : "" %>>Disponible</option>
                            <option value="2" <%= "2".equals(request.getAttribute("estadoG")) ? "selected" : "" %>>En curso</option>
                            <option value="3" <%= "3".equals(request.getAttribute("estadoG")) ? "selected" : "" %>>Finalizado</option>
                        </select>
                    </div>
                    <div class="col-md-1 mb-2">
                        <button class="btn btn-primary w-100" type="submit">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                    <div class="col-md-1 mb-2">
                        <a type="reset" class="btn btn-primary w-100 d-flex align-items-center justify-content-center" href="<%=request.getContextPath()%>/CoordinadorServlet?action=eventoGeneralesC">Limpiar</a>
                    </div>
                    <div class="col-md-2 mb-2">
                        <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=crearEvento" class="btn btn-primary w-100">Crear evento</a>
                    </div>
                </div>
            </form>
        </div>
        <div style="background-color: #f8f9fa; padding: 20px; " >

            <div class="row my-4" style="margin-bottom: 10px;">
                <% if (listaEventos != null) {
                    for (EventoB evento : listaEventos) { %>
                        <div class="col-md-3 mb-4">
                            <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=verEvento&idEvento=<%= evento.getIdEvento() %>" style="text-decoration: none; color: inherit;">
                            <div class="card" style="max-width: 20rem; margin: auto;border-radius: 15px;">
                                <img src="ImagenServlet?action=evento&idImagenEvento=<%=evento.getIdEvento()%>" class="card-img-top rounded-top">
                                <a class="card-header text-secondary  align-items-center text-center"><b><%= evento.getTipoEvento() %></b></a>
                                <div class="card-body">
                                    <h5 class="card-title" style="text-align: left;"><%= evento.getNombre() %></h5>
                                    <% if ("Disponible".equals(evento.getEstadoString())) { %>
                                    <p class="text-success" style="font-size: small;"><b><%= evento.getEstadoString() %></b></p>
                                    <% } else if ("En curso".equals(evento.getEstadoString())) { %>
                                    <p class="text-warning" style="font-size: small; "><b><%= evento.getEstadoString() %></b></p>
                                    <% } else { %>
                                    <p class="text-danger" style="font-size: small;"><b><%= evento.getEstadoString() %></b></p>
                                    <% } %>
                                    <p class="text-wrap" style="font-size: small; margin-bottom: 0;">Fecha de inicio: <%= evento.getFecha_inicio() %></p>
                                    <p class="text-wrap" style="font-size: small; margin-bottom: 0;">Fecha de fin: <%= evento.getFecha_fin() %></p>
                                    <p class="text-wrap" style="font-size: small; margin-bottom: 0;">Coordinador: <%= evento.getNombreCoordinador() %></p>
                                    <a class="link-opacity-50-hover" style="font-size: small;" href="<%=request.getContextPath()%>/CoordinadorServlet?action=verEvento&idEvento=<%= evento.getIdEvento() %>">Más información aquí</a>
                                </div>
                            </div></a>
                        </div>
                <%  }
                } else { %>
                <p>No hay eventos disponibles</p>
                <% } %>
            </div>
            <nav>
                <ul class="pagination">
                    <li class="page-item <%= paginaActual == 1 ? "disabled" : "" %>">
                        <a class="page-link" href="<%=request.getContextPath()%>/CoordinadorServlet?action=eventoGeneralesC&page=<%= paginaActual - 1 %>">Anterior</a>
                    </li>
                    <% if (totalPaginas > 0) { %>
                    <% for (int i = 1; i <= totalPaginas; i++) { %>
                    <li class="page-item <%= i == paginaActual ? "active" : "" %>">
                        <a class="page-link" href="<%=request.getContextPath()%>/CoordinadorServlet?action=eventoGeneralesC&page=<%= i %>"><%= i %></a>
                    </li>
                    <% } %>
                    <% } else { %>
                    <li class="page-item active">
                        <a class="page-link" href="#">1</a>
                    </li>
                    <% } %>
                    <li class="page-item <%= paginaActual == totalPaginas || totalPaginas == 0 ? "disabled" : "" %>">
                        <% if (paginaActual < totalPaginas) { %>
                        <a class="page-link" href="<%=request.getContextPath()%>/CoordinadorServlet?action=eventoGeneralesC&page=<%= paginaActual + 1 %>">Siguiente</a>
                        <% } else { %>
                        <span class="page-link">Siguiente</span>
                        <% } %>
                    </li>
                </ul>
            </nav>
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

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>