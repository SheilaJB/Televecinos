<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.televecinosunidos_appweb.model.beans.EventoB" %>

<%
    ArrayList<EventoB> listaEventos = (ArrayList<EventoB>) request.getAttribute("listaEventos");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Eventos de cultura</title>
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

    <!-- Custom Stylesheet for cards -->
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

        <div id="Titulo_Eventos">
            <h1 style="text-align: center; margin-top:70px; margin-bottom:70px;">Descubre y participa en nuestros eventos</h1>
            <p style="text-align: center; font-size: normal; margin-top: 50px; margin-bottom: 50px;padding: 20px;">
                ¡Únete a la acción con los eventos organizados por la Municipalidad de San Miguel! Desde vibrantes festivales comunitarios hasta emocionantes competiciones deportivas, nuestra ciudad ofrece una amplia gama de actividades para todos los gustos. Descubre eventos que promueven la participación ciudadana, el deporte, la cultura y el entretenimiento, ¡todo diseñado para enriquecer la vida de nuestros residentes y visitantes!
            </p>
        </div>

        <div style="background-color: #FFB703 ; padding: 20px; border: 1px solid #ccc; border-radius: 5px;">
            <div class="row justify-content-auto align-items-auto">
                <div class="col-md-6 mb-2">
                    <input type="text" class="form-control" id="filtroInput" placeholder="Buscar...">
                </div>

                <div class="col-md-2 mb-2">
                    <select id="filtroEstado" class="form-select">
                        <option selected>Estado</option>
                        <option value="disponible">Disponible</option>
                        <option value="enCurso">En curso</option>
                        <option value="finalizado">Finalizado</option>
                    </select>
                </div>
                <div class="col-md-2 mb-2">
                    <button type="button" class="btn btn-primary w-100" onclick="filtrar()"><b>Filtrar</b></button>
                </div>
                <div class="col-md-2 mb-2">
                    <button type="button" class="btn btn-primary w-100" onclick="crearEvento()"><b>Crear evento</b></button>
                </div>
            </div>
        </div>

        <div style="background-color: #f8f9fa; padding: 20px;">
            <div class="row my-4" style="margin-bottom: 10px;">
                <% if (listaEventos != null) {
                    for (EventoB evento : listaEventos) { %>
                <div class="col-md-3 mb-4">
                    <a href="<%=request.getContextPath()%>/VecinoServlet?action=verEvento&idEvento=<%= evento.getIdEvento() %>" style="text-decoration: none; color: inherit;">
                        <div class="card" style="max-width: 20rem; margin: auto; border-radius: 15px;">
                            <img src="ImagenServlet?idImagenEvento=<%=evento.getIdEvento()%>" class="card-img-top rounded-top">
                            <div class="card-body">
                                <h5 class="card-title" style="text-align: left;"><%= evento.getNombre() %></h5>
                                <p class="card-status" style="font-size: small; margin-bottom: 0;">Estado: <%= evento.getEstadoString() %></p>
                                <p class="text-wrap" style="font-size: small; margin-bottom: 0;">Fecha de inicio: <%= evento.getFecha_inicio() %></p>
                                <p class="text-wrap" style="font-size: small; margin-bottom: 0;">Fecha de fin: <%= evento.getFecha_fin() %></p>
                                <% if ("Disponible".equals(evento.getEstadoString())){ %>
                                    <p class="text-wrap" style="font-size: small; margin-bottom: 0;">Vacantes Disponibles: <%= evento.getCantDisponibles() %></p>
                                    <a class="link-opacity-50-hover" style="font-size: small;" href="<%=request.getContextPath()%>/VecinoServlet?action=verEvento&idEvento=<%= evento.getIdEvento() %>">Inscribirse aquí</a>
                                <% } else { %>
                                    <a class="link-opacity-50-hover" style="font-size: small;" href="<%=request.getContextPath()%>/VecinoServlet?action=verEvento&idEvento=<%= evento.getIdEvento() %>">Más información</a>
                                <% } %>
                            </div>
                        </div>
                    </a>
                </div>
                <%  }
                } else { %>
                <p>No hay eventos disponibles</p>
                <% } %>
            </div>

            <div style="display: flex; justify-content: center; align-items: center;">
                <!-- Paginación-->
                <section class="paginacion">
                    <ul style="list-style: none; padding: 0; margin: 0; display: flex;">
                        <div style="background-color: white; padding: 5px; margin:10px">
                            <li style="margin: 0 5px;"><a class="link-opacity-50-hover" href="#" class="active">1</a></li>
                        </div>
                        <div style="background-color:white; padding: 5px; margin:10px">
                            <li style="margin: 0 5px;"><a class="link-opacity-50-hover" href="#" class="active">2</a></li>
                        </div>
                        <div style="background-color: white; padding: 5px; margin:10px">
                            <li style="margin: 0 5px;"><a class="link-opacity-50-hover" href="#" class="active">3</a></li>
                        </div>
                        <div style="background-color: white; padding: 5px; margin:10px">
                            <li style="margin: 0 5px;"><a class="link-opacity-50-hover" href="#" class="active">4</a></li>
                        </div>
                        <div style="background-color: white; padding: 5px; margin:10px">
                            <li style="margin: 0 5px;"><a class="link-opacity-50-hover" href="#" class="active">5</a></li>
                        </div>
                    </ul>
                </section>
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
<script src="js/main.js"></script>
</body>

</html>
