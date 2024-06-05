<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Editar Evento</title>
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

    <link rel="stylesheet" href="path/to/bootstrap.min.css">

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
                <a href="<%=request.getContextPath()%>/VistaServlet?idVista=inicioCoordinador"class="nav-item nav-link "><i class="fa fa-home me-2"></i><span style="font-size: 13.5px;"><b>Inicio</b></span></a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"><i class="fa fa-calendar me-2"></i><span style="font-size: 13.5px;"><b>Eventos</b></span></a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="<%=request.getContextPath()%>/VistaServlet?idVista=eventoGeneralesC" class="dropdown-item"><span style="font-size: 13.5px;"><b>Eventos generales</b></span></a>
                        <a href="<%=request.getContextPath()%>/VistaServlet?idVista=creacionEventoC" class="dropdown-item"><span style="font-size: 13.5px;"><b>Crear evento</b></span></a>
                        <a href="<%=request.getContextPath()%>/CoordinadorServlet" class="dropdown-item"><span style="font-size: 13.5px;"><b>Eventos propios</b></span></a>
                    </div>
                </div>

                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle " data-bs-toggle="dropdown"><i class="fa fa-th-list me-2"></i><span style="font-size: 13.5px;"><b>Incidencias</b></span></a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="<%=request.getContextPath()%>/VistaServlet?idVista=generarIncidenciaC" class="dropdown-item"><span style="font-size: 13.5px;"><b>Crear incidencia</b></span></a>
                        <a href="<%=request.getContextPath()%>/VistaServlet?idVista=listaIncidenciaC" class="dropdown-item"><span style="font-size: 13.5px;"><b>Lista de incidencias</b></span></a>
                    </div>
                </div>
                <a href="<%=request.getContextPath()%>/VistaServlet?idVista=preguntasFrecuentesC" class="nav-item nav-link font-al"><i class="fa fa-question-circle me-2" ></i><span style="font-size: 13.5px;"><b>Preguntas frecuentes</b></span></a>
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
                        <a href="<%=request.getContextPath()%>/VistaServlet?idVista=perfilC" class="dropdown-item">Mi perfil</a>
                        <a href="<%=request.getContextPath()%>/VistaServlet?idVista=Index" class="dropdown-item">Cerrar sesión</a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Navbar End -->


        <h2 class="mb-2 text-center" style = "padding-top: 3%;" style="color:#023047;">Editar evento</h2>
        <!-- Form Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="row g-4">
                <div class="col-sm-12">
                    <div class="rounded h-100 p-4" style=" background-color: #ffb703;">
                        <form method="post" action="<%=request.getContextPath()%>/CoordinadorServlet?action=editar">
                            <!---Nombre del evento-->
                            <div class="mb-3">
                                <label for="nombreEvento" class="form-label" style="color:#023047;"><b>Ingrese un nombre del evento:</b></label>
                                <input type="text" class="form-control" id="nombreEvento" placeholder="Escribir">
                            </div>

                            <!---Descripción del evento-->
                            <div class="mb-3">
                                <label for="descripcionEvento" class="form-label" style="color:#023047;"><b>Ingrese una descripción del evento:</b></label>
                                <textarea class="form-control" id="descripcionEvento" rows="2" placeholder="Escribir una breve descripción"></textarea>
                            </div>
                            <!---Nombre del coordinador-->
                            <div class="mb-3">
                                <label for="nombreCoordinador" class="form-label" style="color:#023047;"><b>Ingrese nombre del coordinador:</b></label>
                                <input type="text" class="form-control" id="nombreCoordinador" placeholder="Escribir">
                            </div>
                        </form>
                    </div>
                </div>


                <div class="col-sm-12 col-sm-12 col-xl-6">
                    <div class="rounded h-100 p-4" style = "background-color:#219ebc;">
                        <!---Nombre del profesor-->
                        <div class="mb-3">
                            <label for="nombreCoordinador" class="form-label" style="color:#023047;"><b>Ingrese nombre del profesor:</b></label>
                            <input type="text" class="form-control" id="nombreCoordinador" placeholder="Escribir">
                        </div>
                        <!---Lugar del evento-->
                        <div class="mb-3">
                            <label for="lugarEvento" class="form-label" style="color:#023047;"><b>Lugar del evento:</b></label>
                            <input type="text" class="form-control" id="lugarEvento" placeholder="Escribir">
                        </div>
                        <!----Frecuencia del evento----->
                        <label for="frecuenciaEvento" class="form-label" style="color:#023047;"><b>Frecuencia del evento:</b></label>
                        <select id="frecuenciaEvento" class="form-select mb-3" aria-label="Default select example" onchange="mostrarOpciones()">
                            <option selected>Seleccione la frecuencia del evento</option>
                            <option value="1">Dos veces por semana</option>
                            <option value="2">Semanal</option>
                        </select>

                        <div id="opcionesInterdiarias" style="display:none;">
                            <select id="diasInterdiarios" class="form-select mb-3" aria-label="Default select example">
                                <option selected>Seleccione la opción: </option>
                                <option value="1">Lunes-Miércoles</option>
                                <option value="2">Martes-Jueves</option>
                            </select>
                        </div>

                        <div id="opcionesSemanal" style="display:none;">
                            <label for="diaSemana" class="form-label" style="color:#023047;"><b>Elegir día:</b></label>
                            <select id="diaSemana" class="form-select mb-3" aria-label="Default select example">
                                <option selected>Seleccione el día a la semana:</option>
                                <option value="1">Lunes</option>
                                <option value="2">Martes</option>
                                <option value="3">Miércoles</option>
                                <option value="4">Jueves</option>
                                <option value="5">Viernes</option>
                            </select>
                        </div>

                        <script>
                            function mostrarOpciones() {
                                var frecuenciaSeleccionada = document.getElementById("frecuenciaEvento").value;
                                var opcionesInterdiarias = document.getElementById("opcionesInterdiarias");
                                var opcionesSemanal = document.getElementById("opcionesSemanal");

                                if (frecuenciaSeleccionada === "1") {
                                    opcionesInterdiarias.style.display = "block";
                                    opcionesSemanal.style.display = "none";
                                } else if (frecuenciaSeleccionada === "2") {
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
                        <select id="cantVacantes" class="form-select mb-3" aria-label="Default select example">
                            <option selected>Seleccione la cantidad de vacantes disponibles</option>
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
                            <input type="date" class="form-control" id="fechaInicioEvento" name="fecha_inicio">
                        </div>
                        <div class="mb-3">
                            <label for="fechaFinEvento" class="form-label" style="color:#023047;"><b>Fecha de finalización:</b></label>
                            <input type="date" class="form-control" id="fechaFinEvento" name="fecha_fin">
                        </div>

                        <!-- Hora de inicio del evento -->
                        <div class="mb-3">
                            <label for="horaInicioEvento" class="form-label" style="color:#023047;"><b>Hora de inicio:</b></label>
                            <input type="time" class="form-control" id="horaInicioEvento" name="hora_inicio">
                        </div>

                        <!-- Hora de finalización del evento -->
                        <div class="mb-3">
                            <label for="horaFinEvento" class="form-label" style="color:#023047;"><b>Hora de finalización:</b></label>
                            <input type="time" class="form-control" id="horaFinEvento" name="hora_fin">
                        </div>
                        <!----Estado del evento---->

                        <div class="mb-3">
                            <label for="estadoEvento" class="form-label" style="color:#023047;"><b>Estado del evento:</b></label>
                            <select id="estadoEvento" class="form-select mb-3" aria-label="Default select example">
                                <option selected>Seleccione una opción</option>
                                <option value="1">Disponible</option>
                                <option value="2">En curso</option>
                                <option value="3">Finalizado</option>
                            </select>
                        </div>
                    </div>

                </div>


                <!----Subir foto---->
                <div class="col-sm-12 col-xl-6">
                    <div class="rounded h-100 p-4" style="background-color:#fb8500" >
                        <h5 class="mb-4" style="color:#023047;"><b>Subir foto</b></h5>
                        <div class="mb-3">
                            <label for="subirFoto" class="boton-subir" style="color:#023047;"><b>Subir una foto en formato * .jpg .jpeg o .png</b></label>
                            <input class="form-control" type="file" id="subirFoto" accept=".jpg, .jpeg, .png">
                        </div>
                        <script src="path/to/bootstrap.bundle.min.js"></script>
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
                        <div class="mb-3" id="materialesContainer">
                            <label for="materialesEvento" class="form-label" style="color:#023047;"><b>Materiales:</b></label>
                            <div class="input-group mb-3">
                                <input type="text" class="form-control" name="materiales[]" placeholder="Presione + para añadir más materiales">
                                <button class="btn btn-outline-secondary" type="button" id="addMaterial">+</button>
                            </div>
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

                <!---Registro de asistencia--->
                <h5>Registro de Asistencia:</h5>

                <div class="mb-3">
                    <div class="mb-3">
                        <label for="horaInicioEvento" class="form-label" style="color:#023047;"><b>Marcar entrada:</b></label><br>
                        <!-- Checkbox para marcar la entrada -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="marcarEntrada" name="marcarEntrada" onclick="mostrarHoraEntrada()">
                            <label class="form-check-label" for="marcarEntrada">
                                ¿Marcar Entrada?
                            </label>
                        </div>
                    </div>

                    <!-- Campo para mostrar la hora de entrada -->
                    <div class="mb-3">
                        <label for="horaActualEntrada" class="form-label" style="color:#023047;"><b>Hora de Entrada:</b></label><br>
                        <input class="form-control" type="text" id="horaActualEntrada" readonly>
                    </div>

                    <script>
                        function mostrarHoraEntrada() {
                            // Obtener el checkbox de marcar entrada
                            var checkboxEntrada = document.getElementById("marcarEntrada");
                            // Obtener el campo de entrada para mostrar la hora de entrada
                            var campoHoraEntrada = document.getElementById("horaActualEntrada");
                            // Obtener la hora actual
                            var horaActual = new Date().toLocaleTimeString();
                            // Si el checkbox está marcado, mostrar la hora de entrada
                            if (checkboxEntrada.checked) {
                                campoHoraEntrada.value = horaActual;
                            } else {
                                // Si el checkbox está desmarcado, limpiar el campo de entrada
                                campoHoraEntrada.value = "";
                            }
                        }
                    </script>
                </div>


                <!-- Hora de finalización del evento -->
                <div class="mb-3">
                    <div class="mb-3">
                        <label for="horaFinEvento" class="form-label" style="color:#023047;"><b>Marcar salida:</b></label><br>
                        <!-- Checkbox para marcar la entrada -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="marcarSalida" name="marcarEntrada" onclick="mostrarHoraSalida()">
                            <label class="form-check-label" for="marcarSalida">
                                ¿Marcar salida?
                            </label>
                        </div>
                    </div>

                    <!-- Campo para mostrar la hora de entrada -->
                    <div class="mb-3">
                        <label for="horaActualSalida" class="form-label" style="color:#023047;"><b>Hora de salida:</b></label><br>
                        <input class="form-control" type="text" id="horaActualSalida" readonly>
                    </div>

                    <script>
                        function mostrarHoraSalida() {
                            // Obtener el checkbox de marcar entrada
                            var checkboxEntrada = document.getElementById("marcarSalida");
                            // Obtener el campo de entrada para mostrar la hora de entrada
                            var campoHoraEntrada = document.getElementById("horaActualSalida");
                            // Obtener la hora actual
                            var horaActual = new Date().toLocaleTimeString();
                            // Si el checkbox está marcado, mostrar la hora de entrada
                            if (checkboxEntrada.checked) {
                                campoHoraEntrada.value = horaActual;
                            } else {
                                // Si el checkbox está desmarcado, limpiar el campo de entrada
                                campoHoraEntrada.value = "";
                            }
                        }
                    </script>
                </div>

                <!--Como fue nuestro evento-->
                <h5>Inserta fotos (máximo 3 fotos) de cómo fue el evento</h5>
                <label for="variasFotos" class="boton-subir">Insertar la cantidad de archivos deseada a la vez</label>
                <input class="form-control" type="file" id="variasFotos" accept=".jpg, .jpeg, .png">
                <script src="path/to/bootstrap.bundle.min.js"></script>
            </div>
            <!-- Form End -->

            <!-- Botón para hacer cambios del evento -->
            <div style="text-align: right; margin-right: 100px; padding-top: 2%;">
                <button type="submit" class="btn btn-primary" style="background-color: #023047; border-color: #023047; color: #ffffff;" onclick="listaInscritos()"><b>Continuar</b></button>
            </div>

            <script>
                function listaInscritos() {
                    window.location.href = 'listaInscritos.html';
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