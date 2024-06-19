<%@ page import="org.example.televecinosunidos_appweb.model.beans.ProfesoresEvento" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<% ArrayList<ProfesoresEvento> lista = (ArrayList<ProfesoresEvento>) request.getAttribute("lista");%>

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
                <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=inicioCoordinador" class="nav-item nav-link "><i class="fa fa-home me-2"></i><span style="font-size: 13.5px;"><b>Inicio</b></span></a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle active " data-bs-toggle="dropdown"><i class="fa fa-calendar me-2"></i><span style="font-size: 13.5px;"><b>Eventos</b></span></a>
                    <div class="dropdown-menu bg-transparent border-0 ">
                        <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=eventoGeneralesC" class="dropdown-item"><span style="font-size: 13.5px;"><b>Eventos generales</b></span></a>
                        <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=crearEvento " class="dropdown-item active"><span style="font-size: 13.5px;"><b>Crear evento</b></span></a>
                        <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=lista" class="dropdown-item"><span style="font-size: 13.5px;"><b>Eventos propios</b></span></a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle " data-bs-toggle="dropdown"><i class="fa fa-th-list me-2"></i><span style="font-size: 13.5px;"><b>Incidencias</b></span></a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=generarIncidenciaC" class="dropdown-item"><span style="font-size: 13.5px;"><b>Crear incidencia</b></span></a>
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


        <h2 class="mb-2 text-center" style = "padding-top: 3%;" style="color:#023047;">Creación de un nuevo evento</h2>
        <div id="error-message" class="error">Por favor, complete todos los campos obligatorios.</div>
        <!-- Form Start -->
        <form method="post" action="<%=request.getContextPath()%>/CoordinadorServlet">
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-12">
                        <div class="rounded h-100 p-4" style=" background-color: #ffb703;">
                            <!---Nombre del evento-->
                            <div class="mb-3">
                                <label for="nombreEvento" class="form-label" style="color:#023047;" ><b>Ingrese un nombre del evento:</b></label>
                                <input type="text" class="form-control" id="nombreEvento" placeholder="Escribir" name="nombreEvento" required>
                            </div>

                            <!---Descripción del evento-->
                            <div class="mb-3">
                                <label for="descripcionEvento" class="form-label" style="color:#023047;" ><b>Ingrese una descripción del evento:</b></label>
                                <textarea class="form-control" id="descripcionEvento" rows="2" placeholder="Escribir una breve descripción" name="descripcionEvento" required></textarea>
                            </div>
                            <!---Nombre del coordinador-->
                            <div class="mb-3">
                                <label for="nombreCoordinador" class="form-label" style="color:#023047;" ><b>Ingrese nombre del coordinador:</b></label>
                                <input type="text" class="form-control" id="nombreCoordinador" placeholder="Escribir" name="idCoordinador" required>
                            </div>
                        </div>
                    </div>


                    <div class="col-sm-12 col-sm-12 col-xl-6">
                        <div class="rounded h-100 p-4" style = "background-color:#219ebc;">
                            <!---Nombre del profesor-->
                            <div class="mb-3">
                                <label for="nombreInstructor" class="form-label" style="color:#023047;" ><b>Ingrese nombre del profesor:</b></label>
                                <select id="nombreInstructor" class="form-select mb-3" aria-label="Default select example" name="nombreProfesor" required>
                                    <option value="" selected>Seleccione un instructor</option>
                                    <% int i = 1; %>
                                    <% for (ProfesoresEvento pEvento : lista) { %>
                                    <option value="<%= pEvento.getIdProfesoresEvento() %>"><%= pEvento.getNombre() %> <%= pEvento.getApellido() %></option>
                                    <% i++;%>
                                    <% } %>
                                </select>
                            </div>
                            <!---Lugar del evento-->
                            <div class="mb-3">
                                <label for="lugarEvento" class="form-label" style="color:#023047;"><b>Lugar del evento:</b></label>
                                <input type="text" class="form-control" id="lugarEvento" placeholder="Escribir" name="lugar" required>
                            </div>
                            <!----Frecuencia del evento----->
                            <label for="frecuenciaEvento" class="form-label" style="color:#023047;"><b>Frecuencia del evento:</b></label>
                            <select id="frecuenciaEvento" class="form-select mb-3" aria-label="Default select example" onchange="mostrarOpciones()" name="frecuencia" required>
                                <option value="" selected>Seleccione la frecuencia del evento</option>
                                <option value="2">Dos veces por semana</option>
                                <option value="1">Semanal</option>
                            </select>

                            <div id="opcionesInterdiarias" style="display:none;">
                                <select id="diasInterdiarios" class="form-select mb-3" aria-label="Default select example" name="opcionesDias">
                                    <option value="" selected>Seleccione la opción: </option>
                                    <option value="Lunes-Miércoles">Lunes-Miércoles</option>
                                    <option value="Martes-Jueves">Martes-Jueves</option>
                                </select>
                            </div>

                            <div id="opcionesSemanal" style="display:none;">
                                <label for="diaSemana" class="form-label" style="color:#023047;"><b>Elegir día:</b></label>
                                <select id="diaSemana" class="form-select mb-3" aria-label="Default select example" name="opcionesDias1">
                                    <option value="" selected>Seleccione el día a la semana:</option>
                                    <option value="Lunes">Lunes</option>
                                    <option value="Martes">Martes</option>
                                    <option value="Miércoles">Miércoles</option>
                                    <option value="Jueves">Jueves</option>
                                    <option value="Viernes">Viernes</option>
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
                            <label for="cantVacantes" class="form-label" style="color:#023047;"><b>Cantidad de vacantes:</b> </label>
                            <select id="cantVacantes" class="form-select mb-3" aria-label="Default select example" name="cantidadVacantes" required>
                                <option value="" selected>Seleccione la cantidad de vacantes disponibles</option>
                                <!-- Las opciones se agregarán dinámicamente con JavaScript -->
                            </select>
                        </div>
                        <script>
                            // Función que se ejecutará al cargar la ventana
                            window.onload = function() {
                                var selectElement = document.getElementById('cantVacantes');

                                // Crear opciones de 10 a 30
                                for(var i = 10; i <= 30; i++) {
                                    var option = new Option(i, i);
                                    selectElement.add(option);
                                }
                            };
                        </script>
                    </div>

                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-light rounded h-100 p-4">
                            <!-- Fecha del evento -->
                            <div class="mb-3">
                                <label for="fechaInicioEvento" class="form-label" style="color:#023047;"><b>Fecha de inicio:</b></label>
                                <input type="date" class="form-control" id="fechaInicioEvento" name="fecha_inicio" required>
                            </div>
                            <div class="mb-3">
                                <label for="fechaFinEvento" class="form-label" style="color:#023047;"><b>Fecha de finalización:</b></label>
                                <input type="date" class="form-control" id="fechaFinEvento" name="fecha_fin" required>
                            </div>

                            <!-- Hora de inicio del evento -->
                            <div class="mb-3">
                                <label for="horaInicioEvento" class="form-label" style="color:#023047;"><b>Hora de inicio:</b></label>
                                <input type="time" class="form-control" id="horaInicioEvento" name="hora_inicio" required>
                            </div>

                            <!-- Hora de finalización del evento -->
                            <div class="mb-3">
                                <label for="horaFinEvento" class="form-label" style="color:#023047;"><b>Hora de finalización:</b></label>
                                <input type="time" class="form-control" id="horaFinEvento" name="hora_fin" required>
                            </div>
                        </div>
                    </div>


                    <!----Subir foto---->
                    <div class="col-sm-12 col-xl-6">
                        <div class="rounded h-100 p-4" style="background-color:#fb8500" >
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
                    <div class="col-sm-12 col-xl-6">
                        <div class="rounded h-100 p-4" style = "background-color: #8ecae6;">
                            <label  class="form-label" style="color:#023047;"><b>Materiales:</b></label>
                            <div class="input-group mb-3">
                                <input type="text" class="form-control" name="materiales" placeholder="Escriba los materiales a usar">
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
            window.location.href = 'ListaEvent-Coordinador.html'; // Redirige al usuario a la lista de eventos
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
