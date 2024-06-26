
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="org.example.televecinosunidos_appweb.model.dto.SerenazgoDTO" %>
<jsp:useBean id="serenazgoLogeado" scope="session" type="SerenazgoDTO" class="org.example.televecinosunidos_appweb.model.dto.SerenazgoDTO" />
<jsp:useBean id="incidencia" scope="request" type="org.example.televecinosunidos_appweb.model.beans.IncidenciasB"/>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Gestionar incidencia</title>
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
    <link href="css/style_serenazgo.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/app.min.css" rel="stylesheet">
    <link href="css/style_vec.css" rel="stylesheet">
    <link href="css/style_popup.css" rel="stylesheet">
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

    <!-- BARRA AZUL DE LA IZQUIERDA INICIO-->
    <jsp:include page="../includes/barraLateralSerenazgo.jsp"></jsp:include>
    <!-- BARRA AZUL DE LA IZQUIERDA FINAL -->


    <!-- Content Start -->
    <div class="content">
        <!-- PARTE SUPERIOR INICIO -->
        <jsp:include page="../includes/navbarSerenazgo.jsp"></jsp:include>
        <!-- PARTE SUPERIOR FINAL -->


        <h2 class="mb-2 text-center" style = "padding-top: 3%;" style="color:#023047;">Evaluación de incidencia: <%=incidencia.getNombreIncidencia()%></h2>
        <form method="post" action="<%=request.getContextPath()%>/SerenazgoServlet?action=gestionarIncidencia">
            <!-- Form Start -->
            <div class="container-fluid pt-4 px-4">
                <td>
                    <button type="button" class="btn btn-danger m-2 btn-banear" onclick="confirmDelete()">
                        🗑️Borrar incidencia
                    </button>
                    <div id="popup1" class="popup1">
                        <div class="popup_contenido1">
                            <span class="close-btn" id="closePopupBtn1">&times;</span>
                            <!--contenido pop up-->
                            <h4>¿Por qué deseas eliminar esta incidencia? </h4>

                            <!-- <p>La acción "Banear" será permanente, debe estar seguro de su desición al respecto</p> -->
                            <div class="mb-3">
                                <label for="descripcionIncidencia" class="form-label" style="color:#023047;"><b> </b></label>
                                <textarea class="form-control" id="descripcionIncidencia" rows="2" placeholder="Elimino esta incidencia porque ..."></textarea>
                            </div>
                            <a href="listaIncidencias_S.html"><button type="button" class="btn btn-success rounded-pill m-2">Aceptar</button></a>
                            <button type="button" class="btn btn-danger rounded-pill m-2" onclick="cerrarPopup()">Cancelar</button>

                        </div>
                    </div>
                </td>
                <td>
                    <button type="button" class="btn btn-false m-2 btn-banear" onclick="confirmDelete()">
                        ⛔ Falsa <!-- Texto a lado del ícono -->
                    </button>
                    <div id="popup1" class="popup1">
                        <div class="popup_contenido1">
                            <!--contenido pop up-->
                            <h4>¿Estás seguro? </h4>
                            <a href="listaIncidencias_S.html"><button type="button" class="btn btn-success rounded-pill m-2">Si</button></a>
                            <a href="gestionar_Incidencia_S.html"><button type="button" class="btn btn-danger rounded-pill m-2" >No</button></a>
                            <!-- <button type="button" class="btn btn-danger rounded-pill m-2" >No</button> -->
                        </div>
                    </div>
                </td>
                <div class="row g-4">
                    <div class="col-sm-12">
                        <div class="rounded h-100 p-4" style=" background-color: #ffb703;">
                            <!---Descripción de la incidencia-->
                            <div class="mb-3">
                                <label for="descripcionIncidencia" class="form-label" style="color:#023047;"><b>Ingrese una descripción de la solución a dar a la incidencia:</b></label>
                                <input type="text" id="nombre" name="solucionADar" class="form-control" placeholder="Escribir una breve descripción">
                            </div>
                        </div>

                    </div>
                    <div class="col-sm-12 col-sm-12 col-xl-6">
                        <div class="rounded h-100 p-4" style = "background-color:#219ebc;">
                            <input type="hidden" name="idIncidencia" class="form-control" value="<%=incidencia.getIdIncidencias()%>">

                            <div class="mb-3">
                                <label class="form-label" style="color:#023047;"><b>Nombre del serenazgo encargado de la incidencia:</b></label>
                                <input type="text" id="idUsuario" class="form-control" value="<%=serenazgoLogeado.getNombreSerenazgo() + " " + serenazgoLogeado.getApellidoSerenazgo()%>" readonly>
                                <input type="hidden" name="idUsuario" class="form-control" value="<%=serenazgoLogeado.getNombreSerenazgo() + " " + serenazgoLogeado.getApellidoSerenazgo()%>" readonly>
                            </div>

                            <!----Criticidad de la incidencia----->
                            <label class="form-label" style="color:#023047;"><b>Criticidad:</b></label>
                            <select name="criticidadIncidencia" class="form-select mb-3" aria-label="Default select example" onchange="mostrarOpciones()">
                                <option selected>Seleccione la criticidad de la incidencia </option>
                                <option value="1">Baja</option>
                                <option value="2">Media</option>
                                <option value="3">Alta</option>
                            </select>
                            <!----Personal para la incidencia----->
                            <label  class="form-label" style="color:#023047;"><b>Personal:</b></label>
                            <select name="personalRequerido" class="form-select mb-3" aria-label="Default select example" onchange="mostrarOpciones()">
                                <option selected>Seleccione el personal para la incidencia </option>
                                <option value="1">Ambulancia</option>
                                <option value="2">Policia</option>
                                <option value="3">Bomberos</option>
                            </select>

                            <div id="inputContainer" style="display: none;">
                                <input type="text" class="form-control" id="nombrePersonal" placeholder="">
                            </div>

                            <script>
                                function mostrarOpciones() {
                                    var select = document.getElementById("personal_Incidencia");
                                    var inputContainer = document.getElementById("inputContainer");
                                    var inputField = document.getElementById("nombrePersonal");

                                    if (select.value == "1") {
                                        inputField.placeholder = "Ingrese el nombre de la comisaría";
                                        inputContainer.style.display = "block";
                                    } else if (select.value == "3") {
                                        inputField.placeholder = "Ingrese el nombre del personal en turno";
                                        inputContainer.style.display = "block";
                                    } else {
                                        inputContainer.style.display = "none";
                                    }
                                }
                            </script>


                        </div>

                    </div>

                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-light rounded h-100 p-4">
                            <!----Movilidad de la incidencia----->
                            <label for="movilidad" class="form-label" style="color:#023047;"><b>Movilidad:</b></label>
                            <select id="movilidad" name="movilidadIncidencia" class="form-select mb-3" aria-label="Default select example" onchange="mostrarOpciones()">
                                <option selected>Seleccione la movilidad para la incidencia </option>
                                <option value="1">Bicicleta</option>
                                <option value="2">A pie</option>
                                <option value="3">Canino</option>
                                <option value="3">Vehículo</option>
                            </select>
                            <!----Estado de la incidencia----->
                            <label  class="form-label" style="color:#023047;"><b>Estado de la incidencia:</b></label>
                            <select name="estadoIncidencia" class="form-select mb-3" aria-label="Default select example" onchange="mostrarOpciones()">
                                <option selected>Seleccione el estado de la incidencia </option>
                                <option value="1">Pendiente</option>
                                <option value="5">Procesado</option>

                            </select>

                        </div>
                    </div>

                </div>
            </div>

            <!-- Botón para guardar evaluación de incidencia -->
            <div style="text-align: right; margin-right: 100px; padding-top: 2%;">
                <button type="submit" class="btn btn-primary" style="background-color: #023047; border-color: #023047; color: #ffffff;" onclick="mostrarMensajeExito()"><b>Guardar</b></button>
            </div>

        </form>
        <!-- Form End -->



        <script>
            function mostrarMensajeExito() {
                // Mostrar ventana emergente con mensaje de éxito
                alert("La incidencia fue evaluada exitosamente.");
                window.location.href = 'ListaEvent-Coordinador.html'; <!--REVISAR-->
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
    <!-- Popup de Confirmación para crear Eventos -->
    <div id="createConfirmationPopup" class="popup">
        <div class="popup-content">
            <span class="close-btn" id="closeCreatePopupBtn">&times;</span>
            <img src="img/check.png" alt="check" width="48" height="48" style="margin-top: -10px;">
            <h2>Evaluación Exitosa</h2>
            <p>El incidente ha sido evaluado con éxito.</p>
            <button onclick="closeCreatePopup()" class="btn btn-secondary">Regresar</button>
        </div>
    </div>
    <script>
        const closeCreatePopupBtn = document.getElementById('closeCreatePopupBtn');
        const createConfirmationPopup = document.getElementById('createConfirmationPopup');
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


        // Función para cerrar el popup y potencialmente redirigir al usuario
        function closeCreatePopup() {
            createConfirmationPopup.style.display = 'none';
            enableInteractions();
            //redirigir al usuario o recargar la página
            window.location.href = 'listaIncidencias_S.html';
        }

        // Evento para cerrar el popup cuando se presiona el botón de cerrar
        closeCreatePopupBtn.addEventListener('click', closeCreatePopup);

        // Función para mostrar el mensaje de éxito al crear un evento
        function mostrarMensajeExito() {
            createConfirmationPopup.style.display = 'block';
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

<script>
    document.addEventListener('DOMContentLoaded', function() {

        function desactivarStickyTop() {
            navbar.classList.remove('sticky-top');
        }

        function activarStickyTop() {
            navbar.classList.add('sticky-top');
        }
        document.addEventListener('click', function(event) {
            if (event.target.classList.contains('btn-banear')) {
                desactivarStickyTop();
                var popup = event.target.nextElementSibling;
                popup.style.display = 'block';
            }
        });

        document.addEventListener('click', function(event) {
            if (event.target.classList.contains('close-btn')) {
                activarStickyTop();
                var popup = event.target.closest('.popup1');
                popup.style.display = 'none';
            }
        });
    });

</script>
<!--cerrar pop up -->
<script>
    function cerrarPopup() {
        var popup = document.getElementById("popup1");
        popup.style.display = "none";
    }
</script>
</body>

</html>