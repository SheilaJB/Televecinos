<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.televecinosunidos_appweb.model.beans.EventoB" %>
<%@ page import="org.example.televecinosunidos_appweb.model.beans.UsuarioB" %>
<%@ page import="java.util.List" %>

<% List<UsuarioB> inscritos = (List<UsuarioB>) request.getAttribute("inscritos"); %>
<% EventoB evento = (EventoB) request.getAttribute("evento"); %>


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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style_vec.css" rel="stylesheet">
    <style>
        .btn-sm-square {
            width: 20px;
            height: 20px;
            padding: 0;
            text-align: center;
        }
    </style>
    <!-- Tempus Dominus CSS (si necesario) -->
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
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

        <!-- Lista de eventos -->
        <section id="titulo-eventos" class="container my-5">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h1 style="text-align: center"><i class="fas fa-calendar-alt"></i> Lista de vecinos inscritos</h1>
                    <h2>Inscritos al evento: <%= evento.getNombre() %></h2>
                    <p class="lead">
                        Aquí puedes revisar a los vecinos inscritos y tienes la opción de excluirlos del evento
                    </p>
                    <p class="lead">
                        **Importante** Recuerda que puedes eliminarlos del evento por algún historial de mal comportamiento
                    </p>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-6" style="text-align: center">
                    <a onclick="goBack()" class="btn btn-outline-secondary btn-lg btn-block mt-3">
                        <i class="bi bi-info-circle"></i> Regresar a detalles del evento
                    </a>
                </div>
            </div>
        </section>

        <div style="background-color: #f8f9fa; padding: 10px; align-items: center;">
            <div style="background-color: #FFB703; padding: 20px; border: 1px solid #ccc; border-radius: 5px;">

            </div>
            <div class="table-responsive">
                <table id="eventosTable" class="table table-striped table-hover" style="background-color: transparent;">
                    <thead>
                    <tr class="form-text">
                        <th scope="col">Nombre</th>
                        <th scope="col">Apellido</th>
                        <th scope="col">Correo</th>
                        <% if (!"Finalizado".equals(evento.getEstadoString())) { %>
                        <th scope="col">Eliminar del evento</th>
                        <% } %>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (UsuarioB usuario : inscritos) { %>
                    <tr>
                        <td><%= usuario.getNombre() %></td>
                        <td><%= usuario.getApellido() %></td>
                        <td><%= usuario.getCorreo() %></td>
                        <% if (!"Finalizado".equals(evento.getEstadoString())) { %>
                        <td>
                            <a onclick="confirmarEliminarInscrito(<%= evento.getidEvento() %>, <%= usuario.getIdUsuario() %>)">
                                <button type="button" class="btn btn-danger btn-sm-square m-1" data-bs-toggle="modal" data-bs-target="#eliminarInscritoModal">
                                    <i class="fas fa-trash-alt fa-xs"></i>
                                </button>
                            </a>
                        </td>
                        <% } %>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
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

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>
<script>
    function viewFunction(idEvento) {
        window.location.href = '<%=request.getContextPath()%>/CoordinadorServlet?action=verEvento&idEvento=' + idEvento;
    }
    function editFunction(idEvento) {
        window.location.href = '<%=request.getContextPath()%>/CoordinadorServlet?action=editarEvento&idEvento=' + idEvento;
    }
</script>
<script>
    function goBack() {
        window.history.back(); // Esta función te lleva a la página anterior en el historial del navegador
    }
</script>
<script>
    function confirmarEliminarInscrito(idEvento, idUsuario) {
        Swal.fire({
            title: '¿Estás seguro?',
            text: "¡No podrás revertir esto!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, eliminar',
            cancelButtonText: 'No, cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = '<%=request.getContextPath()%>/CoordinadorServlet?action=eliminarInscrito&idEvento=' + idEvento + '&idUsuario=' + idUsuario;
            }
        })
    }
</script>
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
