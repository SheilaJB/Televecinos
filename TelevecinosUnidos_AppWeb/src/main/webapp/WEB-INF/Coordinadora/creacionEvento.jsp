<%@ page import="org.example.televecinosunidos_appweb.model.beans.ProfesoresEvento" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.televecinosunidos_appweb.model.beans.UsuarioB" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuarioLogueado" scope="session" type="UsuarioB" class="org.example.televecinosunidos_appweb.model.beans.UsuarioB" />
<%@ page pageEncoding="UTF-8" %>
<% ArrayList<ProfesoresEvento> lista = (ArrayList<ProfesoresEvento>) request.getAttribute("lista"); %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Crear Evento</title>
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

        .error {
            color: red;
            display: none;
        }

        .highlight {
            border-color: red;
        }

        .display-box {
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 4px;
            background-color: white;
            display: inline-block;
            width: 100%;
            box-sizing: border-box;
            font-size: 14px;
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


        <h2 class="mb-2 text-center" style="padding-top: 3%; color:#023047;">Creación de un nuevo evento</h2>
        <div id="error-message" class="error">Por favor, complete todos los campos obligatorios.</div>
        <!-- Form Start -->
        <form method="post" action="<%=request.getContextPath()%>/CoordinadorServlet?action=crear" enctype="multipart/form-data">
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-12">
                        <div class="rounded h-100 p-4" style="background-color: #ffb703;">
                            <!---Nombre del evento-->
                            <div class="mb-3" class="campo ${not empty erroresEvento ? 'error-div' : ''}">
                                <label for="nombreEvento" class="form-label" style="color:#023047;"><b>Ingrese un nombre del evento:</b></label>
                                <input type="text" class="form-control" id="nombreEvento" placeholder="Escribir" name="nombreEvento" required value="${nombreEvento}" class="campo">
                            </div>

                            <!---Descripción del evento-->
                            <div class="mb-3" class="campo ${not empty erroresEvento ? 'error-div' : ''}">
                                <label for="descripcionEvento" class="form-label" style="color:#023047;"><b>Ingrese una descripción del evento:</b></label>
                                <textarea class="form-control" id="descripcionEvento" type="text" placeholder="Escribir una breve descripción" name="descripcionEvento" required class="campo">${descripcionEvento}</textarea>
                            </div>
                            <!---Nombre del coordinador-->
                            <div class="mb-3">
                                <label for="nombreCoordinador" class="form-label" style="color:#023047;"><b>Nombre del coordinador:</b></label>
                                <div class="display-box"><%= usuarioLogueado.getNombre() + " " + usuarioLogueado.getApellido() %></div>
                                <input type="hidden" name="idCoordinador" value="<%= usuarioLogueado.getIdUsuario() %>">
                                <input type="hidden" name="tipoCoordinador" value="<%= usuarioLogueado.getTipoCoordinador_idTipoCoordinador() %>">
                            </div>
                        </div>
                    </div>


                    <div class="col-sm-12 col-sm-12 col-xl-6">
                        <div class="rounded h-100 p-4" style="background-color:#219ebc;">
                            <!---Nombre del profesor-->
                            <div class="mb-3" class="campo ${not empty erroresEvento ? 'error-div' : ''}">
                                <label for="nombreInstructor" class="form-label" style="color:#023047;"><b>Ingrese nombre del profesor:</b></label>
                                <select id="nombreInstructor" class="form-select mb-3" aria-label="Default select example" name="nombreProfesor" required>
                                    <option value="${nombreProfesor}" class="campo" selected>Seleccione un instructor</option>
                                    <% int i = 1; %>
                                    <% for (ProfesoresEvento pEvento : lista) { %>
                                    <option value="<%= pEvento.getIdProfesoresEvento() %>" ${nombreProfesor == '0' ? 'selected' : ''}><%= pEvento.getNombre() %> <%= pEvento.getApellido() %></option>
                                    <% i++; %>
                                    <% } %>
                                </select>
                            </div>
                            <!---Lugar del evento-->
                            <div class="mb-3" class="campo ${not empty erroresEvento ? 'error-div' : ''}">
                                <label for="lugarEvento" class="form-label" style="color:#023047;"><b>Lugar del evento:</b></label>
                                <input type="text" class="form-control" id="lugarEvento" placeholder="Escribir" name="lugar" required value="${lugar}" class="campo">
                            </div>
                            <!----Frecuencia del evento----->
                            <div class="mb-3" class="campo ${not empty erroresEvento ? 'error-div' : ''}">
                                <label for="frecuenciaEvento" class="form-label" style="color:#023047;"><b>Frecuencia del evento:</b></label>
                                <select id="frecuenciaEvento" class="form-select mb-3" aria-label="Default select example" oninput="mostrarOpciones()" name="frecuencia" required>
                                    <option value="" selected>Seleccione la frecuencia del evento</option>
                                    <option value="2" ${frecuencia == '2' ? 'selected' : ''}>Dos veces por semana</option>
                                    <option value="1" ${frecuencia == '1' ? 'selected' : ''}>Semanal</option>
                                </select>
                            </div>


                            <div id="opcionesInterdiarias" style="display:none;" class="campo ${not empty erroresEvento ? 'error-div' : ''}">
                                <select id="diasInterdiarios" class="form-select mb-3" aria-label="Default select example" name="opcionesDias">
                                    <option value="" selected>Seleccione la opción: </option>
                                    <option value="Lunes-Miércoles" ${opcionesDias == 'Lunes-Miércoles' ? 'selected' : ''}>Lunes-Miércoles</option>
                                    <option value="Martes-Jueves" ${opcionesDias == 'Martes-Jueves' ? 'selected' : ''}>Martes-Jueves</option>
                                </select>
                            </div>

                            <div id="opcionesSemanal" style="display:none;" class="campo ${not empty erroresEvento ? 'error-div' : ''}">
                                <label for="diaSemana" class="form-label" style="color:#023047;"><b>Elegir día:</b></label>
                                <select id="diaSemana" class="form-select mb-3" aria-label="Default select example" name="opcionesDias1">
                                    <option value="" selected>Seleccione el día a la semana:</option>
                                    <option value="Lunes" ${opcionesDias1 == 'Lunes' ? 'selected' : ''}>Lunes</option>
                                    <option value="Martes" ${opcionesDias1 == 'Martes' ? 'selected' : ''}>Martes</option>
                                    <option value="Miércoles" ${opcionesDias1 == 'Miércoles' ? 'selected' : ''}>Miércoles</option>
                                    <option value="Jueves" ${opcionesDias1 == 'Jueves' ? 'selected' : ''}>Jueves</option>
                                    <option value="Viernes" ${opcionesDias1 == 'Viernes' ? 'selected' : ''}>Viernes</option>
                                </select>
                            </div>

                            <script>
                                function mostrarOpciones() {
                                    var frecuenciaSeleccionada = document.getElementById("frecuenciaEvento").value;
                                    var opcionesInterdiarias = document.getElementById("opcionesInterdiarias");
                                    var opcionesSemanal = document.getElementById("opcionesSemanal");

                                    if (frecuenciaSeleccionada === "2") {
                                        opcionesInterdiarias.style.display = "block";
                                        opcionesSemanal.style.display = "none";
                                    } else if (frecuenciaSeleccionada === "1") {
                                        opcionesInterdiarias.style.display = "none";
                                        opcionesSemanal.style.display = "block";
                                    } else {
                                        opcionesInterdiarias.style.display = "none";
                                        opcionesSemanal.style.display = "none";
                                    }
                                }
                            </script>

                            <!----Cantidad de vacantes disponibles----->
                            <div class="campo ${not empty erroresEvento ? 'error-div' : ''}">
                                <label for="cantidadVacantes" class="form-label" style="color:#023047;"><b>Cantidad de vacantes:</b> </label>
                                <input type="number" class="form-control" id="cantidadVacantes" placeholder="Escribir" name="cantidadVacantes" value="${cantidadVacantes}" class="campo" required>

                            </div>

                        </div>
                    </div>

                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-light rounded h-100 p-4">
                            <!-- Fecha del evento -->
                            <div class="mb-3" class="campo ${not empty erroresEvento['fechaInicio'] ? 'error-div' : ''}">
                                <label for="fechaInicioEvento" class="form-label" style="color:#023047;"><b>Fecha de inicio:</b></label>
                                <input type="date" class="form-control" id="fechaInicioEvento" name="fecha_inicio" required value="${fecha_inicio}" class="${not empty erroresEvento['fechaInicio'] ? 'error' : ''}">
                                <div>
                                    <c:if test="${not empty erroresEvento['fechaInicio']}">
                                        <span class="error-messege" style="color: red;">${erroresEvento['fechaInicio']}</span>
                                    </c:if>
                                </div>
                                <div>
                                    <c:if test="${not empty erroresEvento['errorFechaInicio']}">
                                        <span class="error-message" style="color: red;">${erroresEvento['errorFechaInicio']}</span>
                                    </c:if>
                                </div>


                            </div>
                            <div class="mb-3" class="campo ${not empty erroresEvento['fechaFin'] ? 'error-div' : ''}">
                                <label for="fechaFinEvento" class="form-label" style="color:#023047;"><b>Fecha de finalización:</b></label>
                                <input type="date" class="form-control" id="fechaFinEvento" name="fecha_fin" required value="${fecha_fin}" class="${not empty erroresEvento['fechaFin'] ? 'error' : ''}">
                                <div>
                                    <c:if test="${not empty erroresEvento['fechaFin']}">
                                        <span class="error-message" style="color: red;">${erroresEvento['fechaFin']}</span>
                                    </c:if>
                                </div>
                                <div>
                                    <c:if test="${not empty erroresEvento['errorFechaFin']}">
                                        <span class="error-message" style="color: red;">${erroresEvento['errorFechaFin']}</span>
                                    </c:if>
                                </div>

                            </div>

                            <!-- Hora de inicio del evento -->
                            <div class="mb-3" class="campo ${not empty erroresEvento ? 'error-div' : ''}">
                                <label for="horaInicioEvento" class="form-label" style="color:#023047;"><b>Hora de inicio:</b></label>
                                <input type="time" class="form-control" id="horaInicioEvento" name="hora_inicio" required value="${hora_inicio}" class="${not empty erroresEvento ? 'error' : ''}">
                            </div>

                            <!-- Hora de finalización del evento -->
                            <div class="mb-3" class="campo ${not empty erroresEvento['fechaFin'] ? 'error-div' : ''}">
                                <label for="horaFinEvento" class="form-label" style="color:#023047;"><b>Hora de finalización:</b></label>
                                <input type="time" class="form-control" id="horaFinEvento" name="hora_fin" required value="${hora_fin}" class="${not empty erroresEvento['errorHoraFin'] ? 'error' : ''}">
                                <c:if test="${not empty erroresEvento['errorHoraFin']}">
                                    <span class="error-message" style="color: red;">${erroresEvento['errorHoraFin']}</span>
                                </c:if>
                            </div>
                        </div>
                    </div>


                    <!----Subir foto---->
                    <div class="col-sm-12 col-xl-6">
                        <div class="rounded h-100 p-4" style="background-color:#fb8500;">
                            <h5 class="mb-4" style="color:#023047;"><b>Subir foto</b></h5>
                            <div class="mb-3">
                                <label for="subirFoto" class="form-label" style="color:#023047;"><b>Subir una foto en formato * .jpg .jpeg o .png</b></label>
                                <input class="form-control" type="file" id="subirFoto" accept=".jpg, .jpeg, .png" name="foto">
                            </div>
                            <!-- Contenedor para la previsualización de la imagen -->
                            <div class="mb-3">
                                <img id="preview" src="#" alt="Vista previa de la imagen" class="img-thumbnail" style="display: none;">
                            </div>
                        </div>
                    </div>
                    <script>
                        document.getElementById('subirFoto').addEventListener('change', function(event) {
                            var file = event.target.files[0];
                            if (file) {
                                var reader = new FileReader();
                                reader.onload = function(e) {
                                    var imgElement = document.getElementById('preview');
                                    imgElement.src = e.target.result;
                                    imgElement.style.display = 'block'; // Muestra la imagen
                                };
                                reader.readAsDataURL(file);
                            }
                        });
                    </script>


                    <!-- Materiales -->
                    <div class="col-sm-12 col-xl-6" >
                        <div class="rounded h-100 p-4" style="background-color: #8ecae6;">
                            <label class="form-label" style="color:#023047;"><b>Materiales:</b></label>
                            <div class="input-group mb-3" class="campo ${not empty erroresEvento ? 'error-div' : ''}">
                                <input type="text" class="form-control" name="materiales" placeholder="Escriba los materiales a usar" required value="${materiales}" class="campo">
                            </div>
                        </div>
                    </div>
                    <script>
                        document.addEventListener('DOMContentLoaded', function() {
                            var materialesContainer = document.getElementById('materialesContainer');
                            var addMaterialButton = document.getElementById('addMaterial');

                            addMaterialButton.addEventListener('click', function() {
                                var newInputGroup = document.createElement('div');
                                newInputGroup.classList.add('input-group', 'mb-3');

                                var newInput = document.createElement('input');
                                newInput.type = 'text';
                                newInput.name = 'materiales[]';
                                newInput.classList.add('form-control');
                                newInput.placeholder = 'Presione - para eliminar este material';

                                var removeButton = document.createElement('button');
                                removeButton.classList.add('btn', 'btn-outline-danger');
                                removeButton.type = 'button';
                                removeButton.textContent = '−';

                                // Evento para eliminar el campo
                                removeButton.addEventListener('click', function() {
                                    this.parentElement.remove();
                                });

                                newInputGroup.appendChild(newInput);
                                newInputGroup.appendChild(removeButton);

                                materialesContainer.appendChild(newInputGroup);
                            });
                        });
                    </script>
                </div>
            </div>
            <!-- Form End -->

            <!-- Botón para crear evento -->
            <div style="text-align: right; margin-right: 100px; padding-top: 2%;">
                <button type="submit" class="btn btn-primary" style="background-color: #023047; border-color: #023047; color: #ffffff;" onclick="return validarFormulario()"><b>Crear Evento</b></button>
            </div>
            <script>
                function validarFormulario() {
                    var camposObligatorios = document.querySelectorAll('input[required], select[required], textarea[required]');
                    var formularioValido = true;

                    camposObligatorios.forEach(function(campo) {
                        if (!campo.value.trim()) {
                            campo.classList.add('highlight');
                            formularioValido = false;
                        } else {
                            campo.classList.remove('highlight');
                        }
                    });

                    if (!formularioValido) {
                        document.getElementById('error-message').style.display = 'block';
                    } else {
                        document.getElementById('error-message').style.display = 'none';
                    }

                    return formularioValido;
                }
            </script>
        </form>
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
            <h2>Creación Exitosa</h2>
            <p>El evento ha sido creado con éxito.</p>
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
            window.location.href = '<%=request.getContextPath()%>/CoordinadorServlet?action=lista';
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
</body>

</html>
