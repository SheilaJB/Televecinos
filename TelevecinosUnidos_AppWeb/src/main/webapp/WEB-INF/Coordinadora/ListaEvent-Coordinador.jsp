<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.televecinosunidos_appweb.model.beans.EventoB" %>
<% ArrayList<EventoB> lista = (ArrayList<EventoB>) request.getAttribute("lista"); %>
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
    <div class="sidebar pe-4 pb-3" style="background-color: #8ecae6;">
        <nav class="navbar" style="background-color: #8ecae6;" >
            <a class="navbar-brand mx-3 mt-3">
                <h4 style="color:#023047"><b>Televecinos Unidos</b></h4>
            </a>
            <div class="d-flex align-items-center ms-4 mb-4"  >
                <img class="rounded-circle" src="img/coordinadora.jpg" alt="" style="width: 50px; height: 50px;">
                <div class="ms-3 m-3" >
                    <h6 class="mb-0" style="color:#023047;"><b>Nombre Apellido</b></h6>
                    <span class="text-muted"><b>Coordinador</b></span>
                </div>
            </div>
            <div class="navbar-nav w-100">
                <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=inicioCoordinador" class="nav-item nav-link"><i class="fa fa-home me-2"></i><span style="font-size: 13.5px;"><b>Inicio</b></span></a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"><i class="fa fa-calendar me-2"></i><span style="font-size: 13.5px;"><b>Eventos</b></span></a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=eventoGeneralesC" class="dropdown-item"><span style="font-size: 13.5px;"><b>Eventos generales</b></span></a>
                        <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=crearEvento" class="dropdown-item"><span style="font-size: 13.5px;"><b>Crear evento</b></span></a>
                        <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=lista" class="dropdown-item active"><span style="font-size: 13.5px;"><b>Eventos propios</b></span></a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle " data-bs-toggle="dropdown"><i class="fa fa-th-list me-2"></i><span style="font-size: 13.5px;"><b>Incidencias</b></span></a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="<%=request.getContextPath()%>/CoordIncidServlet?action=generarIncidenciaC" class="dropdown-item"><span style="font-size: 13.5px;"><b>Crear incidencia</b></span></a>
                        <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=listarIncidencia" class="dropdown-item"><span style="font-size: 13.5px;"><b>Lista de incidencias</b></span></a>
                    </div>
                </div>
                <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=preguntasFrecuentesC" class="nav-item nav-link font-al"><i class="fa fa-question-circle me-2" ></i><span style="font-size: 13.5px;"><b>Preguntas frecuentes</b></span></a>
            </div>
        </nav>
    </div>
    <!-- Sidebar End -->

    <!-- Content Start -->
    <div class="content">
        <!-- Navbar Start -->
        <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
            <a href="#" class="sidebar-toggler flex-shrink-0">
                <i class="fa fa-bars"></i>
            </a>
            <a class="navbar-brand mx-4 mb-3 d-flex align-items-center" style="padding-top: 2%;">
                <img class="rounded-circle" src="img/logo.jpg" alt="" style="width: 40px; height: 40px;">
                <h3 class="m-0 me-2 px-2" style="color:#023047;">¡Bienvenido, coordinador!</h3>
            </a>
            <div class="navbar-nav align-items-center ms-auto">
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <img class="rounded-circle me-lg-2" src="img/coordinadora.jpg" alt="" style="width: 40px; height: 40px;">
                        <span class="d-none d-lg-inline-flex" style="color:#023047;"><b>Nombre Apellido</b></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                        <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=perfilC" class="dropdown-item">Mi perfil</a>
                        <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=Index" class="dropdown-item">Cerrar sesión</a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Navbar End -->

        <!-- Lista de eventos -->
        <div class="container text-center">
            <div id="Nombre del evento">
                <h1 style="text-align: center; margin-top:50px;margin-bottom:50px;"><b>Eventos propios</b></h1>
            </div>
        </div>
        <div style="background-color: #f8f9fa; padding: 10px; align-items: center;">
            <!-- Filtro -->
            <div style="background-color: #FFB703; padding: 20px; border: 1px solid #ccc; border-radius: 5px;">
                <div class="row justify-content-center align-items-center">
                    <div class="col-md-5 mb-2">
                        <input type="text" class="form-control" id="filtroInput" placeholder="Buscar..." onkeyup="filtrar()">
                    </div>
                    <div class="col-md-2 mb-2">
                        <select id="filtroCategoria" class="form-select" onchange="filtrar()">
                            <option selected value="">Frecuencia</option>
                            <option value="Semanal">Semanal</option>
                            <option value="Dos veces por semana">Dos veces por semana</option>

                        </select>
                    </div>
                    <div class="col-md-3 mb-2">
                        <select id="filtroEstado" class="form-select" onchange="filtrar()">
                            <option selected value="">Estado</option>
                            <option value="Disponible">Disponible</option>
                            <option value="En curso">En curso</option>
                            <option value="Finalizado">Finalizado</option>
                        </select>
                    </div>
                    <div class="col-md-2 mb-2">
                        <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=crearEvento" class="btn btn-primary w-100">
                            <b>Crear evento</b>
                        </a>
                    </div>
                </div>
            </div>

            <div class="bg-light rounded h-100 p-4" style="font-weight: bold;">
                <script>
                    function crearEvento() {
                        window.location.href = 'creacionEvento.html';
                    }
                </script>

                <div class="table-responsive">
                    <table id="eventosTable" class="table" style="background-color: transparent;">
                        <thead>
                        <tr>
                            <th scope="col">Nombre</th>
                            <th scope="col">Fecha de inicio</th>
                            <th scope="col">Estado</th>
                            <th scope="col">Frecuencia</th>
                            <th scope="col">Visualizar</th>
                            <th scope="col">Editar</th>
                            <th scope="col">Borrar</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% for(EventoB eventoB : lista){ %>
                        <tr>
                            <td><%= eventoB.getNombre() %></td>
                            <td><%= eventoB.getFecha_inicio() %></td>
                            <td><%= eventoB.getEstadoString() %></td>
                            <td><%= eventoB.getFrecuenciaString() %></td>
                            <td><a href="<%=request.getContextPath()%>/CoordinadorServlet?action=verEvento&idEvento=<%=eventoB.getidEvento()%>"><button type="button" class="btn btn-info m-2"><i class="fas fa-eye"></i></button></a></td>
                            <td><a href="<%=request.getContextPath()%>/CoordinadorServlet?action=editarEvento&idEvento=<%=eventoB.getidEvento()%>"><button type="button" class="btn btn-success m-2"><i class="fas fa-pencil-alt"></i></button></a></td>
                            <td><button type="button" class="btn btn-danger m-2" onclick="confirmDelete(<%=eventoB.getidEvento()%>)"><i class="fas fa-trash-alt"></i></button></td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Filtro -->
        <div id="Barra-Filtro">
            <script>
                function filtrar() {
                    var input = document.getElementById('filtroInput').value.toUpperCase();
                    var categoria = document.getElementById('filtroCategoria').value.toUpperCase();
                    var estado = document.getElementById('filtroEstado').value.toUpperCase();
                    var table = document.getElementById('eventosTable');
                    var tr = table.getElementsByTagName('tr');

                    for (var i = 1; i < tr.length; i++) {
                        var tdNombre = tr[i].getElementsByTagName('td')[0];
                        var tdEstado = tr[i].getElementsByTagName('td')[2];
                        var tdFrecuencia = tr[i].getElementsByTagName('td')[3];
                        if (tdNombre && tdEstado && tdFrecuencia) {
                            var txtValueNombre = tdNombre.textContent || tdNombre.innerText;
                            var txtValueEstado = tdEstado.textContent || tdEstado.innerText;
                            var txtValueFrecuencia = tdFrecuencia.textContent || tdFrecuencia.innerText;
                            var visible = true;

                            if (input && txtValueNombre.toUpperCase().indexOf(input) === -1) {
                                visible = false;
                            }
                            if (estado && txtValueEstado.toUpperCase().indexOf(estado) === -1) {
                                visible = false;
                            }
                            if (categoria && txtValueFrecuencia.toUpperCase().indexOf(categoria) === -1) {
                                visible = false;
                            }
                            tr[i].style.display = visible ? '' : 'none';
                        }
                    }
                }
            </script>
        </div>

        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light rounded-top p-4">
                <div class="row">
                    <div class="col-12 col-sm-6 text-center text-sm-start">
                        &copy; <a href="#">Televecinos</a>, All Right Reserved.
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
