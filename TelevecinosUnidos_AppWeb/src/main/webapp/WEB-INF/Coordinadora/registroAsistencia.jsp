<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.televecinosunidos_appweb.model.beans.EventoB" %>
<% ArrayList<EventoB> lista = (ArrayList<EventoB>) request.getAttribute("lista"); %>
<jsp:useBean id="textoBuscarEvento" scope="request" type="java.lang.String" class="java.lang.String"/>
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
    <!-- Tempus Dominus CSS (si necesario) -->
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
</head>
<body>
<div class="container-xxl position-relative bg-white d-flex flex-column flex-md-row p-0">
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

        <section id="titulo-eventos" class="container my-5">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h1 style="text-align: center"><i class="bi bi-calendar-check-fill"></i> Registrar mi asistencia</h1>
                    <p class="lead">
                        Aquí puedes marcar tu entrada y salida en cada uno de tus eventos.
                    </p>
                    <p class="lead text-danger">
                        Importante: ¡Recuerda adjuntar una foto para validar tu registro!
                    </p>
                </div>
            </div>
        </section>
        <div style="background-color: #f8f9fa; padding: 10px; align-items: center;">
            <div style="background-color: #FFB703; padding: 20px; border: 1px solid #ccc; border-radius: 5px;">
                <!-- Filtro -->
                <form method="post" action="<%=request.getContextPath()%>/CoordinadorServlet?action=buscarRegistro">
                    <div class="row justify-content-center align-items-center">
                        <!-- Busqueda por nombre de evento -->
                        <div class="col-md-3 mb-2">
                            <input type="text" class="form-control" id="filtroInput" placeholder="Buscar..." name="textoBuscarEvento"
                                   value="<%=request.getAttribute("textoBuscarEvento") != null ? request.getAttribute("textoBuscarEvento") : ""%>">
                        </div>
                        <div class="col-md-2 mb-2">
                            <input type="date" class="form-control" name="fecha"
                                   value="<%=request.getAttribute("fecha") != null ? request.getAttribute("fecha") : ""%>">
                        </div>
                        <div class="col-md-2 mb-2">
                            <select class="form-select" name="frecuencia">
                                <option selected disabled>Frecuencia</option>
                                <option value="1" <%= "1".equals(request.getAttribute("frecuencia")) ? "selected" : "" %>>Semanal</option>
                                <option value="2" <%= "2".equals(request.getAttribute("frecuencia")) ? "selected" : "" %>>Dos veces por semana</option>
                            </select>
                        </div>
                        <div class="col-md-2 mb-2">
                            <select class="form-select" name="estado">
                                <option selected disabled>Estado</option>
                                <option value="1" <%= "1".equals(request.getAttribute("estado")) ? "selected" : "" %>>Disponible</option>
                                <option value="2" <%= "2".equals(request.getAttribute("estado")) ? "selected" : "" %>>En curso</option>
                                <option value="3" <%= "3".equals(request.getAttribute("estado")) ? "selected" : "" %>>Finalizado</option>
                            </select>
                        </div>
                        <div class="col-md-1 mb-2">
                            <button class="btn btn-primary w-100" type="submit">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                        <div class="col-md-2 mb-2">
                            <a type="reset" class="btn btn-primary w-100" href="<%=request.getContextPath()%>/CoordinadorServlet?action=registrarAsistencia">Limpiar</a>
                        </div>
                    </div>
                </form>
            </div>
            <div class="table-responsive">
                <table id="eventosTable" class="table table-striped table-hover" style="background-color: transparent;">
                    <thead>
                    <tr class="form-text">
                        <th scope="col">Nombre</th>
                        <th scope="col">Inicio</th>
                        <th scope="col">Fin</th>
                        <th scope="col">Frecuencia</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Registrar</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% if (lista != null) {
                        for(EventoB eventoB : lista){ %>
                    <tr>
                        <td><%= eventoB.getNombre() %></td>
                        <td><%= eventoB.getFecha_inicio() %></td>
                        <td><%=eventoB.getFecha_fin() %></td>
                        <td><%= eventoB.getFrecuenciaString() %></td>
                        <td><%= eventoB.getEstadoString() %></td>
                        <td>
                            <% if ("Finalizado".equals(eventoB.getEstadoString())) { %>
                                <button type="button" class="btn btn-primary btn-sm-square m-1" disabled><i class="bi bi-calendar-check"></i></button>
                            <% } else { %>
                            <a onclick="checkFunction(<%=eventoB.getIdEvento()%>)">
                                <button type="button" class="btn btn-primary btn-sm-square m-1" ><i class="bi bi-calendar-check"></i></button>
                            </a>
                            <% } %>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="8">No hay eventos encontrado.</td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>

            <script>
                function toggleTime(checkbox) {
                    var timeInfo = checkbox.nextElementSibling;
                    if (checkbox.checked) {
                        var now = new Date();
                        var hours = now.getHours().toString().padStart(2, '0');
                        var minutes = now.getMinutes().toString().padStart(2, '0');
                        var currentTime = hours + ':' + minutes;
                        timeInfo.textContent =  currentTime;
                    } else {
                        timeInfo.textContent = '';
                    }
                }
            </script>
            <script>
                function checkFunction(idEvento) {
                    window.location.href = '<%=request.getContextPath()%>/CoordinadorServlet?action=asistencia&idEventoX=' + idEvento;
                }
            </script>

           <!-- Paginación-->
            <nav>
                <ul class="pagination">
                    <li class="page-item <%= paginaActual == 1 ? "disabled" : "" %>">
                        <a class="page-link" href="<%=request.getContextPath()%>/CoordinadorServlet?action=registrarAsistencia&page=<%= paginaActual - 1 %>">Anterior</a>
                    </li>
                    <% if (totalPaginas > 0) { %>
                    <% for(int i = 1; i <= totalPaginas; i++) { %>
                    <li class="page-item <%= i == paginaActual ? "active" : "" %>">
                        <a class="page-link" href="<%=request.getContextPath()%>/CoordinadorServlet?action=registrarAsistencia&page=<%= i %>"><%= i %></a>
                    </li>
                    <% } %>
                    <% } else { %>
                    <li class="page-item active">
                        <a class="page-link" href="#">1</a>
                    </li>
                    <% } %>
                    <li class="page-item <%= paginaActual == totalPaginas || totalPaginas == 0 ? "disabled" : "" %>">
                        <% if (paginaActual < totalPaginas) { %>
                        <a class="page-link" href="<%=request.getContextPath()%>/CoordinadorServlet?action=registrarAsistencia&page=<%= paginaActual + 1 %>">Siguiente</a>
                        <% } else { %>
                        <span class="page-link">Siguiente</span>
                        <% } %>
                    </li>
                </ul>
            </nav>
        </div>

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

    <!-- Popup de Confirmación para Eliminar Eventos -->
    <div id="deleteConfirmationPopup" class="popup">
        <div class="popup-content">
            <span class="close-btn" id="closeDeletePopupBtn">&times;</span>
            <img src="img/warning.png" alt="check" width="48" height="48" style="margin-top: -10px;">
            <h2 style="margin-top: 20px;">Confirmar Eliminación</h2>
            <p>¿Estás seguro de que deseas eliminar este evento?</p>
            <button id="confirmDeleteBtn" class="btn btn-danger">Eliminar</button>
            <button onclick="closeDeletePopup()" class="btn btn-secondary">Cancelar</button>
        </div>
    </div>

    <!-- JavaScript para Popup -->
    <script>
        const closeDeletePopupBtn = document.getElementById('closeDeletePopupBtn');
        const deleteConfirmationPopup = document.getElementById('deleteConfirmationPopup');
        const confirmDeleteBtn = document.getElementById('confirmDeleteBtn');
        const mainContent = document.querySelector('.content'); // Selecciona el contenido principal que quieres deshabilitar
        let eventIdToDelete; // Variable para almacenar el ID del evento a eliminar

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

        // Función para cerrar el popup
        function closeDeletePopup() {
            deleteConfirmationPopup.style.display = 'none';
            enableInteractions();
        }

        // Eventos para manejar el popup
        closeDeletePopupBtn.addEventListener('click', closeDeletePopup);

        // Función para confirmar eliminación
        confirmDeleteBtn.addEventListener('click', function() {
            window.location.href = '<%=request.getContextPath()%>/CoordinadorServlet?action=borrarEvento&idEvento=' + eventIdToDelete;
            closeDeletePopup();
        });

        // Función para abrir el popup de confirmación
        function confirmDelete(eventId) {
            eventIdToDelete = eventId; // Almacenar el ID del evento a eliminar
            deleteConfirmationPopup.style.display = 'block';
            disableInteractions();
        }
    </script>

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

