<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.televecinosunidos_appweb.model.beans.AsistenciaCoordB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import ="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.LocalTime" %>
<%

    ArrayList<AsistenciaCoordB> listaFechas = (ArrayList<AsistenciaCoordB>) request.getAttribute("listaFechasEvento");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Marcar Asistencia Evento</title>
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
        /* Estilos para la tabla */
        .custom-table {
            background-color: #ffffff;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            border-collapse: separate;
            border-spacing: 0;
            margin-top: 20px;
        }
        .custom-table th, .custom-table td {
            border: 1px solid #dddddd;
            padding: 8px 12px;
            text-align: center;
            vertical-align: middle;
        }
        .custom-table th {
            background-color: #f8f9fa;
            color: #333333;
        }
        .custom-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .custom-table tr:hover {
            background-color: #e9ecef;
        }

        /* Estilos para los botones */
        .btn-entrada {
            background-color: #28a745;
            color: white;
        }
        .btn-salida {
            background-color: #dc3545;
            color: white;
        }
        .btn-foto {
            background-color: #17a2b8;
            color: white;
        }
        .btn-entrada:hover, .btn-salida:hover, .btn-foto:hover {
            opacity: 0.85;
        }
    </style>
</head>
<body onload="mostrarOpciones()">
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
        <!-- Bootstrap JS dependencies -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <!-- Bootstrap JS with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Bootstrap JS and dependencies (Popper.js) -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>

        <div id="Nombre del evento">
            <h3 style="text-align: left; margin-top:20px;margin-bottom:20px;padding: 20px"><%=listaFechas.get(1).getNombreEvento()%></h3>
        </div>
        <div class="table-responsive">
            <table class="table custom-table">
                <thead>
                <tr>
                    <th scope="col">Fechas</th>
                    <th scope="col">Hora de Inicio</th>
                    <th scope="col">Hora de Fin</th>
                    <th scope="col">Marcar hora de entrada</th>
                    <th scope="col">Marcar hora de salida</th>
                    <th scope="col">Subir foto</th>
                </tr>
                </thead>
                <tbody>
                <% if (listaFechas != null) {
                    for (AsistenciaCoordB asistenciaCoordB : listaFechas) { %>
                <tr>
                    <td><%= asistenciaCoordB.getFechaEvento() %></td>
                    <td><%= asistenciaCoordB.getHora_inicio() %></td>
                    <td><%= asistenciaCoordB.getHora_fin() %></td>
                    <td>
                        <%
                            LocalTime timeNow = LocalTime.now();
                            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
                            String formattedTime = timeNow.format(formatter);
                        %>
                        <form method="post" action="<%=request.getContextPath()%>/CoordinadorServlet?action=marcarHoraEntrada&idAsistencia=<%=asistenciaCoordB.getIdAsistenciaCoordinadora()%>">
                            <button type="submit" class="btn btn-dark m-2">Enviar</button>
                        </form>
                    </td>
                    <td>
                        <form method="post" action="<%=request.getContextPath()%>/CoordinadorServlet?action=marcarHoraSalida&idAsistencia=<%=asistenciaCoordB.getIdAsistenciaCoordinadora()%>">
                            <button type="submit" class="btn btn-dark m-2" _msttexthash="79560" _msthash="48">Enviar</button>
                        </form>
                    </td>
                    <td><button class="btn btn-foto rounded-pill px-3" type="button">Foto</button></td>
                </tr>
                <% } %>
                <% } %>
                </tbody>
            </table>
        </div>
        <!-- Footer End -->
    </div>
    <script>
        // Función para obtener la hora actual en formato HH:mm:ss
        function obtenerHoraActual() {
            const ahora = new Date();
            const horas = ahora.getHours().toString().padStart(2, '0');
            const minutos = ahora.getMinutes().toString().padStart(2, '0');
            const segundos = ahora.getSeconds().toString().padStart(2, '0');
            return `${horas}:${minutos}:${segundos}`;
        }

        // Función para manejar el cambio en el checkbox
        document.getElementById('horaCheckbox').addEventListener('change', function() {
            const checkbox = this;
            if (checkbox.checked) {
                // Si el checkbox está marcado, guardar la hora actual
                const horaActual = obtenerHoraActual();
                localStorage.setItem('horaGuardada', horaActual);
                console.log(`Hora guardada: ${horaActual}`);
            } else {
                // Si el checkbox se desmarca, limpiar la hora guardada
                localStorage.removeItem('horaGuardada');
                console.log('Hora guardada eliminada');
            }
        });

        // Verificar si hay una hora guardada al cargar la página
        window.onload = function() {
            const horaGuardada = localStorage.getItem('horaGuardada');
            if (horaGuardada) {
                document.getElementById('horaCheckbox').checked = true;
                console.log(`Hora previamente guardada: ${horaGuardada}`);
            }
        };
    </script>

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
</body>
</html>

