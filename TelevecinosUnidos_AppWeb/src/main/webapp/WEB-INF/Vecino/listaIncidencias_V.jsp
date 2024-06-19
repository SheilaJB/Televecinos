<%@ page import="org.example.televecinosunidos_appweb.model.beans.IncidenciasB" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<IncidenciasB> lista = (ArrayList<IncidenciasB>) request.getAttribute("lista"); %>

<jsp:useBean id="textoBuscarIncidencia" scope="request" type="java.lang.String" class="java.lang.String"/>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <title>Lista de incidencias</title>
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
    <link href="css/app.min.css" rel="stylesheet">
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
    <div class="sidebar pe-4 pb-3 colorBarraLateral">
        <nav class="navbar" style="background-color: #8ecae6;" >
            <a class="navbar-brand mx-3 mt-3">
                <h4 style="color:#023047"><b>Televecinos Unidos</b></h4>
            </a>
            <!-- Sección del perfil del usuario en el sidebar-->
            <div class="d-flex align-items-center ms-4 mb-4"   >
                <img class="rounded-circle" src="img/Icon_perfil.png" alt="Icono del perfil del usuario" style="width: 50px; height: 50px;">
                <div class="ms-3 m-3">
                    <h6 class="mb-0" style="color:#023047;"><b>Nombre Apellido</b></h6>
                    <span class="text-muted"><b>Vecino</b></span>
                </div>
            </div>
            <!-- Fin del perfil del usuario en el sidebar-->
            <div class="navbar-nav w-100">
                <a href="<%=request.getContextPath()%>/VecinoServlet?action=inicioVecino" class="nav-item nav-link active"><i class="fa fa-home me-2"></i><span style="font-size: 13.5px;"><b>Inicio</b></a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle " data-bs-toggle="dropdown"><i class="fa fa-calendar me-2"></i><span style="font-size: 13.5px;"><b>Eventos</b></a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="<%=request.getContextPath()%>/VecinoServlet?action=eventoDeporte" class="dropdown-item"><span style="font-size: 13.5px;"><b>Deporte</b></a>
                        <a href="<%=request.getContextPath()%>/VecinoServlet?action=eventoCultura" class="dropdown-item "><span style="font-size: 13.5px;"><b>Cultura</b></a>
                        <a href="<%=request.getContextPath()%>/VecinoServlet?action=eventosInscritos" class="dropdown-item"><span style="font-size: 13.5px;"><b>Eventos inscritos</b></a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-th-list me-2"></i><span style="font-size: 13.5px;"><b>Incidencias</b></a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="<%=request.getContextPath()%>/VecinoServlet?action=generarIncidencia" class="dropdown-item"><span style="font-size: 13.5px;"><b>Crear Incidencia</b></a>
                        <a href="<%=request.getContextPath()%>/VecinoServlet?action=listarIncidencia" class="dropdown-item"><span style="font-size: 13.5px;"><b>Lista de incidencias</b></a>
                    </div>
                </div>
                <a href="<%=request.getContextPath()%>/VecinoServlet?action=preguntasFrecuentes"class="nav-item nav-link "><i class="fa fa-question-circle me-2"></i><span style="font-size: 13.5px;"><b>Preguntas frecuentes</b></a>
            </div>
        </nav>
    </div>
    <!-- BARRA AZUL DE LA IZQUIERDA FINAL -->


    <!-- Content Start -->
    <div class="content">
        <!-- PARTE SUPERIOR INICIO -->
        <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0"">

        <a href="#" class="sidebar-toggler flex-shrink-0">
            <i class="fa fa-bars"></i>
        </a>
        <a class="navbar-brand mx-4 mb-3 d-flex align-items-center" style="padding-top: 2%;">
            <img class="rounded-circle" src="img/logo.jpg" alt="" style="width: 40px; height: 40px;">
            <h3 class="m-0 me-2 px-2" style="color:#023047;">¡Bienvenido, televecino!</h3>
        </a>

        <div class="navbar-nav align-items-center ms-auto">

            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                    <img class="rounded-circle me-lg-2" src="img/Icon_perfil.png" alt="" style="width: 40px; height: 40px;">
                    <span class="d-none d-lg-inline-flex" style="color:#023047;"><b>Nombre Apellido</b></span>
                </a>
                <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                    <a href="<%=request.getContextPath()%>/VecinoServlet?action=perfilVecino" class="dropdown-item itemperfil">Mi perfil</a>
                    <a href="login/login.html" class="dropdown-item itemperfil">Cerrar Sesión</a>
                </div>
            </div>
        </div>
        </nav>
        <!-- PARTE SUPERIOR FINAL -->



        <!-- LLENAR-->

        <!-- Bootstrap JS dependencies -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <div id="Nombre del evento">
            <h3 style="text-align: left; margin-top:20px;margin-bottom:20px;padding: 20px">Lista de incidencias</h3>
        </div>
        <% if (session.getAttribute("info") != null) { %>
        <div class="alert alert-success" role="alert">
            <%= session.getAttribute("info") %>
        </div>
        <% session.removeAttribute("info"); %>
        <% } %>
        <div style="background-color: #f8f9fa; padding: 20px; align-items: center;">
            <!-- Filtro -->
            <div style="background-color: #FFB703 ; padding: 20px; border: 1px solid #ccc; border-radius: 5px;">
                <form  method="post" action="<%=request.getContextPath()%>/VecinoServlet?action=buscarIncidenciaPorNombre">
                    <div class="row justify-content-center align-items-center">
                        <!-- Busqueda por nombre de incidencia -->
                        <div class="col-md-3 mb-2">
                            <input type="text" class="form-control" id="filtroInput" placeholder="Buscar incidencia..." name="textoBuscarIncidencia"
                                   value="<%=textoBuscarIncidencia%>">
                        </div>

                        <div class="col-md-2 mb-2">
                            <input type="date" class="form-control"  name="filtroFecha">
                        </div>

                        <div class="col-md-2 mb-2">
                            <select  class="form-select" name="filtroTipo">
                                <option selected disabled>Tipo de Incidencia</option>
                                <option value="1" >Seguridad Pública</option>
                                <option value="2 " >Emergencia Médica</option>
                                <option value="3" >Infraestructura y Servicios Públicos</option>
                                <option value="4" >Otro</option>
                            </select>
                        </div>
                        <div class="col-md-2 mb-2">
                            <select  class="form-select" name="filtroEstado">
                                <option selected disabled>Estado</option>
                                <option value="1" >Pendiente</option>
                                <option value="2" >En curso</option>
                                <option value="3" >Cancelado</option>
                                <option value="4" >Rechazado</option>
                                <option value="5" >Procesado</option>
                            </select>
                        </div>
                        <div class="col-md-1 mb-2">
                            <button class="btn btn-primary " type="submit">
                                <i class="fas fa-search"></i> </button>
                        </div>
                        <div class="col-md-2 mb-2">
                            <a type="reset" class="btn btn-primary " href="<%=request.getContextPath()%>/VecinoServlet?action=listarIncidencia" >Limpiar</a>

                        </div>
                    </div>
                </form>
            </div>

            <div class="table-responsive">
                <table class="table" style="background-color: transparent;">
                    <thead>
                    <tr>
                        <th scope="col">Nombre de la incidencia</th>
                        <th scope="col">Fecha</th>
                        <th scope="col">Hora</th>
                        <th scope="col">Tipo</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Ver</th>
                        <th scope="col">Editar</th>
                        <th scope="col">Borrar</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% if (lista != null) {
                        for (IncidenciasB incidencia : lista) { %>
                    <tr>
                        <td><%= incidencia.getNombreIncidencia() %></td>
                        <td><%= incidencia.getFecha() %></td>
                        <td><%= incidencia.getHora() %></td>
                        <td><%= incidencia.getTipoIncidencia() %></td>
                        <td><%= incidencia.getEstadoIncidencia() %></td>
                        <td>
                            <a href="<%=request.getContextPath()%>/VecinoServlet?action=verIncidencia&idIncidencia=<%= incidencia.getIdIncidencias()%>">
                                <button type="button" class="btn btn-primary m-2"><i class="fas fa-eye"></i></button>
                            </a>
                        </td>
                        <% if ("Pendiente".equals(incidencia.getEstadoIncidencia())) { %>
                        <td>
                            <a href="<%=request.getContextPath()%>/VecinoServlet?action=editarIncidencia&idIncidencia=<%=incidencia.getIdIncidencias()%>">
                                <button type="button" class="btn btn-success m-2"><i class="fas fa-pencil-alt"></i></button>
                            </a>
                        </td>
                        <td>
                            <button type="button" class="btn btn-danger m-2" onclick="confirmDelete(<%=incidencia.getIdIncidencias()%>)"><i class="fas fa-trash-alt"></i></button>
                        </td>
                        <% } else { %>
                        <td><button type="button" class="btn btn-success m-2"><i class="fas fa-pencil-alt"></i></button></td>
                        <td><button type="button" class="btn btn-danger m-2"><i class="fas fa-trash-alt"></i></button></td>
                        <% } %>
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
            <div  style="display: flex; justify-content: center; align-items: center;">
                <section class="paginacion" >
                    <ul style="list-style: none;padding: 0;margin: 0;display: flex;">
                        <div style="background-color: white ; padding: 5px; margin:10px">
                            <li style="margin: 0 5px;"><a class="link-opacity-50-hover" href="#" class="active">1</a></li>
                        </div>
                        <div style="background-color:white ; padding: 5px;margin:10px">
                            <li style="margin: 0 5px;"><a class="link-opacity-50-hover" href="#" class="active">2</a></li>
                        </div>
                        <div style="background-color: white ; padding: 5px;margin:10px">
                            <li style="margin: 0 5px;"><a class="link-opacity-50-hover" href="#" class="active">3</a></li>
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
</div>
<!-- Content End -->



<!-- Popup de confirmation para eliminar una incidencia -->

<div id="deleteConfirmationPopup" class="popup">
    <div class="popup-content">
        <span class="close-btn" id="closeDeletePopupBtn">&times;</span>
        <img src="img/warning.png" alt="check" width="48" height="48" style="margin-top: -10px;">
        <h2 style="margin-top: 20px;">Confirmar Eliminación</h2>
        <p>¿Estás seguro de que deseas eliminar este incidente?</p>
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
        window.location.href = '<%=request.getContextPath()%>/VecinoServlet?action=borrarIncidencia&idIncidencia=' + eventIdToDelete;;
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

<!-- Template Javascript -->
<script src="js/main.js"></script>
<script src="js/script_actualizar_incidencia.js"></script>
</body>

</html>