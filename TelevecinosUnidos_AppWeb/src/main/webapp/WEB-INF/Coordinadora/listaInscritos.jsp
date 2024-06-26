<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Lista de Inscritos</title>
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

        .popup2 {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }
        .popup-content2 {
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
        .close-btn2 {
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



    <jsp:include page="../includes/barraLateralCoordinador.jsp"></jsp:include>
    <!-- Sidebar End -->

    <!-- Content Start -->
    <div id="navbar" class="content">
        <!-- Navbar Start -->
        <jsp:include page="../includes/navbarCoordinador.jsp"></jsp:include>
        <!-- Navbar End -->



        <!-- Lista de Inscritos-->

        <!-- Titulo -->
        <div>
            <h3 style="text-align: left; margin-top:20px;margin-bottom:20px;padding: 20px">Lista de inscritos</h3>
        </div>
        <div style="background-color: #f8f9fa; padding: 10px; align-items: center;">
            <!--Filtro-->

            <div style="background-color: #FFB703 ; padding: 20px; border: 1px solid #ccc; border-radius: 5px;">
                <div class="row " style="margin-right:10px;">
                    <div class="col-md-10 mb-2">
                        <input type="text" style="width: 100%; " class="form-control" id="filtroInput" placeholder="Buscar...">
                    </div>
                    <div class="col-md-2 mb-2">
                        <button type="button" class="btn btn-primary w-100"style="width: 100%; " onclick="filtrar()"><b>Buscar</b></button>
                    </div>
                </div>
            </div>
            <div class="bg-light rounded h-100 p-4" style="font-weight: bold;">

                <div class="table-responsive">
                    <table class="table" style="background-color: transparent;">
                        <thead>
                        <tr>
                            <th scope="col">N°</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Apellido</th>
                            <th scope="col">Borrar</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Ana</td>
                            <td>Perez</td>
                            <td>
                                <button type="button" class="btn btn-danger m-2" onclick="confirmDelete(1)">
                                    <i class="fas fa-trash-alt"></i> <!-- Ícono de basurero de FontAwesome -->
                                </button>
                            </td>

                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Luis</td>
                            <td>Delgado</td>
                            <td>
                                <button type="button" class="btn btn-danger m-2" onclick="confirmDelete(2)">
                                    <i class="fas fa-trash-alt"></i> <!-- Ícono de basurero de FontAwesome -->
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>Juan</td>
                            <td>Flores</td>
                            <td>
                                <button type="button" class="btn btn-danger m-2" onclick="confirmDelete(3)">
                                    <i class="fas fa-trash-alt"></i> <!-- Ícono de basurero de FontAwesome -->
                                </button>
                            </td>

                        </tr>
                        </tbody>
                    </table>
                </div>

                <!----Modal de bootstrap para la confirmación de la eliminación------>
                <div class="modal fade" id="deleteConfirmationModal" tabindex="-1" aria-labelledby="deleteConfirmationModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteConfirmationModalLabel">¡Advertencia!</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                El participante seleccionado será eliminado permanentemente. ¿Estás seguro de continuar?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <!-- El ID del evento a eliminar se establecerá dinámicamente al abrir el modal -->
                                <button type="button" class="btn btn-primary" id="confirmDeleteButton">Aceptar</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

        <!-- Botón para hacer cambios del evento -->
        <div class="d-flex justify-content-between"  style="margin-left: 60px;margin-right: 60px; padding: 25px">
            <button type="submit" class="btn btn-primary" style="background-color: #023047; border-color: #023047; color: #ffffff;" onclick="crearEvento()"><b>Atrás</b></button>
            <button type="submit" class="btn btn-primary " style="background-color: #023047; border-color: #023047; color: #ffffff; " onclick="guardarCambios()"><b>Guardar Cambios</b></button>
        </div>
        <!--Regresar-->

        <script>
            function guardarCambios() {
                window.location.href = '<%=request.getContextPath()%>/CoordinadorServlet?action=lista';
            }
        </script>
        <script>
            function crearEvento() {
                window.location.href = 'editarEvento.html';
            }
        </script>
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

    <!-- Popup de Confirmación para Eliminar Eventos -->
    <div id="deleteConfirmationPopup" class="popup" >
        <div class="popup-content">
            <span class="close-btn" id="closeDeletePopupBtn">&times;</span>
            <img src="img/warning.png" alt="check" width="48" height="48" style="margin-top: -10px;">
            <h2 style="margin-top: 20px;">Confirmar Eliminación</h2>
            <p>¿Estás seguro de que deseas eliminar este participante?</p>
            <button id="confirmDeleteBtn" class="btn btn-danger">Eliminar</button>
            <button onclick="closeDeletePopup()" class="btn btn-secondary">Cancelar</button>
        </div>
    </div>

    <!-- JavaScript para Popup1 -->
    <script>
        const closeDeletePopupBtn = document.getElementById('closeDeletePopupBtn');
        const deleteConfirmationPopup = document.getElementById('deleteConfirmationPopup');
        const confirmDeleteBtn = document.getElementById('confirmDeleteBtn');
        const mainContent = document.querySelector('.content'); // Selecciona el contenido principal que quieres deshabilitar

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
        confirmDeleteBtn.addEventListener('click', function() {
            console.log('Eliminar el evento'); // Implementar eliminación real aquí
            closeDeletePopup();
        });

        // Función para abrir el popup de confirmación
        function confirmDelete() {
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