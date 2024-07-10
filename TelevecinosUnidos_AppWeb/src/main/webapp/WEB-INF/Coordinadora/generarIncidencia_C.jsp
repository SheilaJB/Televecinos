<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.televecinosunidos_appweb.model.beans.IncidenciasB" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Generar Incidencia</title>
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
    <link rel="stylesheet" href="css/style_incidencias.css">
    <link href="css/style_vec.css" rel="stylesheet">

    <link rel="stylesheet" href="path/to/bootstrap.min.css">

    <style>
        .campo {
            margin-bottom: 20px;
        }

        .error-message {
            color: red;
            margin-top: 5px;
            font-size: 0.9em;
        }

        .form-check {
            margin-bottom: 10px;
        }

        .btn-secondary {
            background-color: #8ecae6;
            border-color: #8ecae6;
        }

        .btn-secondary:hover {
            background-color: #023047;
            border-color: #023047;
        }

        .error-label {
            border: 1px solid red;
            padding: 3px;
            border-radius: 3px;
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
        <!-- PARTE SUPERIOR FINAL -->

        <!-- LLENAR-->
        <form method="post" action="<%=request.getContextPath()%>/CoordinadorServlet?action=crearIncidencia" enctype="multipart/form-data">
            <div class="container-fluid pt-4 px-4">
                <div class="container">
                    <div class="columna columna1">
                        <div class="campo">
                            <h2>Reportar incidencia</h2>
                            <h2 style="font-size: large;">Complete los siguientes datos</h2>
                        </div>
                        <div class="campo ${not empty errores['nombreIncidencia'] ? 'error-div' : ''}">
                            <label for="nombreIncidencia">Nombre de la incidencia:</label><br>
                            <input type="text" id="nombreIncidencia" name="nombreIncidencia" placeholder="Escribe aquí" value="${nombreIncidencia}" class="${not empty errores['nombreIncidencia'] ? 'error' : ''}"><br>
                            <c:if test="${not empty errores['nombreIncidencia']}">
                                <span class="error-message">${errores['nombreIncidencia']}</span>
                            </c:if>
                        </div>
                        <div class="campo ${not empty errores['foto3'] ? 'error-div' : ''}">
                            <label for="foto3">Subir foto:</label><br>
                            <input class="form-control" type="file" id="foto3" accept=".jpg, .jpeg, .png" name="foto3" value="${foto3}" class="${not empty errores['foto3'] ? 'error' : ''}"><br>
                            <c:if test="${not empty errores['foto3']}">
                                <span class="error-message">${errores['foto3']}</span>
                            </c:if>
                        </div>
                        <div class="campo ${not empty errores['tipoIncidencia'] ? 'error-div' : ''}">
                            <label for="tipoIncidencia">Tipo de incidencia:</label><br>
                            <select id="tipoIncidencia" name="TipoIncidencia_idTipoIncidencia" class="${not empty errores['tipoIncidencia'] ? 'error' : ''}">
                                <option value="" disabled selected>Seleccione una opción</option>
                                <option value="1" ${tipoIncidencia == '1' ? 'selected' : ''}>Seguridad Pública</option>
                                <option value="2" ${tipoIncidencia == '2' ? 'selected' : ''}>Emergencia Médica</option>
                                <option value="3" ${tipoIncidencia == '3' ? 'selected' : ''}>Infraestructura y Servicios Públicos</option>
                                <option value="4" ${tipoIncidencia == '4' ? 'selected' : ''}>Otro</option>
                            </select><br>
                            <c:if test="${not empty errores['tipoIncidencia']}">
                                <span class="error-message">${errores['tipoIncidencia']}</span>
                            </c:if>
                        </div>
                        <div class="campo ${not empty errores['urbanizacion'] ? 'error-div' : ''}">
                            <label for="urbanizacion">Urbanización:</label><br>
                            <select id="urbanizacion" name="urbanizacion_idUrbanizacion" class="${not empty errores['urbanizacion'] ? 'error' : ''}">
                                <option value="" disabled selected>Seleccione una opción</option>
                                <option value="1" ${urbanizacion == '1' ? 'selected' : ''}>Rafael Escardó</option>
                                <option value="2" ${urbanizacion == '2' ? 'selected' : ''}>José de La Riva Agüero</option>
                                <option value="3" ${urbanizacion == '3' ? 'selected' : ''}>Juan XXIII</option>
                                <option value="4" ${urbanizacion == '4' ? 'selected' : ''}>Libertad</option>
                                <option value="5" ${urbanizacion == '5' ? 'selected' : ''}>Los Jardines de La Marina</option>
                                <option value="6" ${urbanizacion == '6' ? 'selected' : ''}>Las Leyendas</option>
                                <option value="7" ${urbanizacion == '7' ? 'selected' : ''}>Las Torres San Miguelito</option>
                                <option value="8" ${urbanizacion == '8' ? 'selected' : ''}>Elmer Faucett</option>
                                <option value="9" ${urbanizacion == '9' ? 'selected' : ''}>Maranga</option>
                                <option value="10" ${urbanizacion == '10' ? 'selected' : ''}>Pando</option>
                                <option value="11" ${urbanizacion == '11' ? 'selected' : ''}>Parques de La Huaca</option>
                                <option value="12" ${urbanizacion == '12' ? 'selected' : ''}>Otro</option>
                            </select>
                            <c:if test="${not empty errores['urbanizacion']}">
                                <span class="error-message">${errores['urbanizacion']}</span>
                            </c:if>
                        </div>
                        <div class="campo ${not empty errores['incidenciaPersonal'] ? 'error-div' : ''}">
                            <label for="paraMi">La incidencia será para:</label><br>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="incidenciaPersonal" id="paraMi" value="1" ${incidenciaPersonal == '1' ? 'checked' : ''}>
                                <label class="form-check-label" for="paraMi">Para mi</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="incidenciaPersonal" id="paraOtraPersona" value="0" ${incidenciaPersonal == '0' ? 'checked' : ''}>
                                <label class="form-check-label" for="paraOtraPersona">Para otra persona</label>
                            </div>
                            <c:if test="${not empty errores['incidenciaPersonal']}">
                                <span class="error-message">${errores['incidenciaPersonal']}</span>
                            </c:if>
                        </div>
                    </div>
                    <div class="columna columna2" style="margin-top: 102px;">
                        <div class="campo ${not empty errores['lugarExacto'] ? 'error-div' : ''}">
                            <label for="lugarExacto">Lugar exacto</label><br>
                            <input type="text" id="lugarExacto" name="lugarExacto" placeholder="Escribe aquí" value="${lugarExacto}" class="${not empty errores['lugarExacto'] ? 'error' : ''}"><br>
                            <c:if test="${not empty errores['lugarExacto']}">
                                <span class="error-message">${errores['lugarExacto']}</span>
                            </c:if>
                        </div>
                        <div class="campo ${not empty errores['referencia'] ? 'error-div' : ''}">
                            <label for="referencia">Referencia</label><br>
                            <input type="text" id="referencia" name="referencia" placeholder="Escribe aquí" value="${referencia}" class="${not empty errores['referencia'] ? 'error' : ''}"><br>
                            <c:if test="${not empty errores['referencia']}">
                                <span class="error-message">${errores['referencia']}</span>
                            </c:if>
                        </div>
                        <div class="campo ${not empty errores['numeroContacto'] ? 'error-div' : ''}">
                            <label for="contacto">Contacto (opcional)</label><br>
                            <input type="text" id="contacto" name="numeroContacto" placeholder="Escribe aquí" value="${numeroContacto}" class="${not empty errores['numeroContacto'] ? 'error' : ''}"><br>
                            <c:if test="${not empty errores['numeroContacto']}">
                                <span class="error-message">${errores['numeroContacto']}</span>
                            </c:if>
                        </div>
                        <div class="campo ${not empty errores['ambulancia'] ? 'error-div' : ''}">
                            <label>¿Requiere ambulancia?</label><br>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="ambulancia" id="gridRadios1" value="1" ${ambulancia == '1' ? 'checked' : ''}>
                                <label class="form-check-label" for="gridRadios1">Sí</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="ambulancia" id="gridRadios2" value="0" ${ambulancia == '0' ? 'checked' : ''}>
                                <label class="form-check-label" for="gridRadios2">No</label>
                            </div>
                            <c:if test="${not empty errores['ambulancia']}">
                                <span class="error-message">${errores['ambulancia']}</span>
                            </c:if>
                        </div>
                        <div class="m-n2">
                            <button type="submit" class="btn btn-secondary m-2">Reportar incidencia</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <div class="container-fluid pt-4 px-4">
            <div class="bg-light rounded-top p-4">
                <div class="row">
                    <div class="col-12 col-sm-6 text-center text-sm-start">
                        &copy; <a href="#">TelevecinosUnidos</a>, All Right Reserved.
                    </div>
                </div>
            </div>
        </div>
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
