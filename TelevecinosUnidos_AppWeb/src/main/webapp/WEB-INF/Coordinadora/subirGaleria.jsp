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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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



        <script>
            <% if (session.getAttribute("info") != null) { %>
            Swal.fire({
                icon: 'success',
                title: '¡Éxito!',
                text: '<%= session.getAttribute("info") %>'
            });
            <% session.removeAttribute("info"); %>
            <% } else if (session.getAttribute("error") != null) { %>
            Swal.fire({
                icon: 'error',
                title: '¡Error!',
                text: '<%= session.getAttribute("error") %>'
            });
            <% session.removeAttribute("error"); %>
            <% } %>
        </script>


        <!-- Lista de eventos -->
        <section id="titulo-eventos" class="container my-5">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h1 style="text-align: center"><i class="fas fa-camera"></i> Subida de fotos para galería</h1>
                    <p class="lead">
                        Aquí debes subir 3 fotos para cada galería por evento
                    </p>
                    <p class="lead">
                        **Importante** ¡No olvides subir una galería de fotos al finalizar cada evento para compartirla con la comunidad!
                    </p>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-6" style="text-align: center">
                    <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=lista" class="btn btn-outline-secondary btn-lg btn-block mt-3">
                        <i class="fas fa-calendar"></i> Regresar a lista de eventos propios
                    </a>
                </div>
            </div>
        </section>

        <% if (session.getAttribute("info") != null) { %>
        <div class="alert alert-success" role="alert">
            <%= session.getAttribute("info") %>
        </div>
        <% session.removeAttribute("info"); %>
        <% } %>

        <div style="background-color: #f8f9fa; padding: 10px; align-items: center;">
            <div style="background-color: #FFB703; padding: 20px; border: 1px solid #ccc; border-radius: 5px;">
                <!-- Filtro -->
                <form  method="post" action="<%=request.getContextPath()%>/CoordinadorServlet?action=buscarEventoPorNombreFinalizado">
                    <div class="row justify-content-center align-items-center">
                        <!-- Busqueda por nombre de evento -->
                        <div class="col-md-3 mb-2">
                            <input type="text" class="form-control" id="filtroInput" placeholder="Buscar evento..." name="textoBuscarEvento"
                                   value="<%=textoBuscarEvento%>">
                        </div>
                        <div class="col-md-2 mb-2">
                            <select  class="form-select" name="frecuencia">
                                <option selected disabled>Tipo de Frecuencia</option>
                                <option value="1" >Semanal</option>
                                <option value="2 ">Dos veces por semana</option>
                            </select>
                        </div>

                        <div class="col-md-1 mb-2">
                            <button class="btn btn-primary w-100" type="submit">
                                <i class="fas fa-search"></i> </button>
                        </div>
                        <div class="col-md-2 mb-2">
                            <a type="reset" class="btn btn-primary w-100" href="<%=request.getContextPath()%>/CoordinadorServlet?action=subirGaleria" >Limpiar</a>
                        </div>

                    </div>
                </form>
            </div>

            <!-- Bootstrap JS with Popper -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <!-- Bootstrap JS and dependencies (Popper.js) -->
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>

            <script>
                function crearEvento() {
                    window.location.href = 'creacionEvento.html';
                }
            </script>

            <div class="table-responsive">
                <table id="eventosTable" class="table table-striped table-hover" style="background-color: transparent;">
                    <thead>
                    <tr class="form-text">
                        <th scope="col">Nombre</th>
                        <th scope="col">Fecha de inicio</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Frecuencia</th>
                        <th scope="col">Ver SubirFotos</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% boolean hayEventosFinalizados = false; %>
                    <% for (EventoB eventoB : lista) { %>
                    <% if ("Finalizado".equals(eventoB.getEstadoString())) { %>
                    <% hayEventosFinalizados = true; %>
                    <tr>
                        <td><%= eventoB.getNombre() %></td>
                        <td><%= eventoB.getFecha_inicio() %></td>
                        <td><%= eventoB.getEstadoString() %></td>
                        <td><%= eventoB.getFrecuenciaString() %></td>
                        <td>
                            <a onclick="viewFunction(<%=eventoB.getIdEvento()%>)">
                                <button type="button" class="btn btn-primary btn-sm-square m-1" ><i class="fas fa-eye fa-xs"></i></button>
                            </a>
                            <button type="button" class="btn btn-success btn-sm-square m-1" id="abrirModalBtn_<%= eventoB.getidEvento() %>" data-bs-toggle="modal" data-bs-target="#subirFotosModal" data-evento-id="<%= eventoB.getidEvento() %>">
                                <i class="fas fa-camera fa-xs"></i>
                            </button>
                        </td>
                    </tr>
                    <% } %>
                    <% } %>
                    <% if (!hayEventosFinalizados) { %>
                    <tr>
                        <td colspan="5" class="text-center">No tienes eventos finalizados</td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>

                <div class="modal fade" id="subirFotosModal" tabindex="-1" aria-labelledby="subirFotosModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="subirFotosModalLabel">Subir Fotos</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="<%=request.getContextPath()%>/CoordinadorServlet?action=subirGaleria" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="idEvento" id="idEventoInput">
                                    <div>
                                        <label for="foto1">Foto 1:</label>
                                        <input type="file" name="foto1" id="foto1" accept="image/*" required>
                                    </div>
                                    <div class="mb-3">
                                        <img id="preview1" src="#" alt="Vista previa de la imagen 1" class="img-thumbnail" style="display: none;">
                                    </div>
                                    <div>
                                        <label for="foto2">Foto 2:</label>
                                        <input type="file" name="foto2" id="foto2" accept="image/*" required>
                                    </div>
                                    <div class="mb-3">
                                        <img id="preview2" src="#" alt="Vista previa de la imagen 2" class="img-thumbnail" style="display: none;">
                                    </div>
                                    <div>
                                        <label for="foto3">Foto 3:</label>
                                        <input type="file" name="foto3" id="foto3" accept="image/*" required>
                                    </div>
                                    <div class="mb-3">
                                        <img id="preview3" src="#" alt="Vista previa de la imagen 3" class="img-thumbnail" style="display: none;">
                                    </div>
                                    <script>
                                        function previewImage(inputId, previewId) {
                                            var inputElement = document.getElementById(inputId);
                                            inputElement.addEventListener('change', function(event) {
                                                var file = event.target.files[0];
                                                if (file) {
                                                    var reader = new FileReader();
                                                    reader.onload = function(e) {
                                                        var imgElement = document.getElementById(previewId);
                                                        imgElement.src = e.target.result;
                                                        imgElement.style.display = 'block'; // Muestra la imagen
                                                    };
                                                    reader.readAsDataURL(file);
                                                }
                                            });
                                        }

                                        for (let i = 1; i <= 3; i++) {
                                            previewImage('foto' + i, 'preview' + i);
                                        }
                                    </script>
                                    <button type="submit" class="btn btn-primary"style="margin-top: 3px">Subir fotos</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <script>
                    // Mostrar y ocultar el spinner
                    document.addEventListener("DOMContentLoaded", function() {
                        document.getElementById("spinner").classList.remove("show");
                    });

                    // Script to close modal and clear file input
                    document.querySelectorAll('[data-bs-dismiss="modal"]').forEach(button => {
                        button.addEventListener('click', () => {
                            const modal = button.closest('.modal');
                            modal.querySelectorAll('input[type="file"]').forEach(input => input.value = '');
                            const modalBackdrop = document.querySelector('.modal-backdrop');
                            if (modalBackdrop) modalBackdrop.remove();
                            document.body.classList.remove('modal-open');
                            document.body.style.paddingRight = '';
                        });
                    });
                </script>

                <nav>
                    <ul class="pagination">
                        <li class="page-item <%= paginaActual == 1 ? "disabled" : "" %>">
                            <a class="page-link" href="<%=request.getContextPath()%>/CoordinadorServlet?action=subirGaleria&page=<%= paginaActual - 1 %>">Anterior</a>
                        </li>
                        <% for(int i = 1; i <= totalPaginas; i++) { %>
                        <li class="page-item <%= i == paginaActual ? "active" : "" %>">
                            <a class="page-link" href="<%=request.getContextPath()%>/CoordinadorServlet?action=subirGaleria&page=<%= i %>"><%= i %></a>
                        </li>
                        <% } %>
                        <li class="page-item <%= paginaActual == totalPaginas ? "disabled" : "" %>">
                            <a class="page-link" href="<%=request.getContextPath()%>/CoordinadorServlet?action=subirGaleria&page=<%= paginaActual + 1 %>">Siguiente</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>

        <!-- jQuery (opcional si necesitas usar funciones de jQuery específicas) -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Bootstrap 5 JS with Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Tempus Dominus JS (si necesario) -->
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
        <script>

            function viewFunction(idEvento) {
                window.location.href ='<%=request.getContextPath()%>/CoordinadorServlet?action=verEvento&idEvento=' +idEvento;
            }

            function editFunction(idEvento) {
                window.location.href ='<%=request.getContextPath()%>/CoordinadorServlet?action=editarEvento&idEvento=' + idEvento;}


        </script>

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
