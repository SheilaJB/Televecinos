<%@ page import="org.example.televecinosunidos_appweb.model.beans.IncidenciasB" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%
    IncidenciasB incidenciaB = (IncidenciasB) request.getAttribute("incidenciaB");
    HashMap<String, String> errores = (HashMap<String, String>) request.getAttribute("errores2");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Actualización de incidencia</title>
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


    <!-- BARRA AZUL DE LA IZQUIERDA INICIO-->
    <jsp:include page="../includes/barraLateralVecino.jsp"></jsp:include>
    <!-- BARRA AZUL DE LA IZQUIERDA FINAL -->


    <!-- Content Start -->
    <div class="content">
        <!-- PARTE SUPERIOR INICIO -->
        <jsp:include page="../includes/navbarVecino.jsp"></jsp:include>
        <% assert incidenciaB != null; %>
        <!-- PARTE SUPERIOR FINAL -->

        <!-- LLENAR-->
        <!-- Footer Start -->

        <form method="post" action="<%=request.getContextPath()%>/VecinoServlet?action=editarIncidencia" enctype="multipart/form-data">
            <div class="container-fluid pt-4 px-4">
                <div class="container">
                    <div class="columna columna1">
                        <div class="campo">
                            <h2>Actualizar incidencia</h2>
                            <h2 style="font-size: large;">Actualice los siguientes datos</h2>
                        </div>
                        <input type="hidden" name="idIncidencia" value="<%= incidenciaB != null ? incidenciaB.getIdIncidencias() : "" %>">
                        <div class="campo">
                            <label for="nombreIncidencia">Nombre de la incidencia:</label><br>
                            <input type="text" id="nombreIncidencia" name="nombreIncidencia" placeholder="Escribe aquí" value="<%= incidenciaB != null ? incidenciaB.getNombreIncidencia() : "" %>"><br>
                            <% if (errores != null && errores.containsKey("nombreIncidencia2")) { %>
                            <span class="text-danger"><%= errores.get("nombreIncidencia2") %></span>
                            <% } %>
                        </div>
                        <div class="campo">
                            <label for="foto">Subir foto:</label><br>
                            <div class="mb-3">
                                <label for="foto" class="form-label" style="color:#023047;"><b>Formatos permitidos: .jpg .jpeg o .png</b></label>
                                <input class="form-control" type="file" id="foto" accept=".jpg, .jpeg, .png" name="foto" >
                            </div>
                            <!-- Contenedor para la previsualización de la imagen -->
                            <div class="mb-3">
                                <img id="preview" src="ImagenServlet?idImagenIncidencia=<%= incidenciaB.getIdIncidencias() %>" alt="Vista previa de la imagen" class="img-thumbnail" style="display: <%= incidenciaB.getFoto() != null ? "block" : "none"%>;">

                            </div>
                            <script>
                                document.getElementById('foto').addEventListener('change', function(event) {
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
                        </div>
                        <div class="campo" style="margin-bottom: -35px;">
                            <label for="tipoIncidencia">Tipo de incidencia:</label><br>
                            <select id="tipoIncidencia" name="TipoIncidencia_idTipoIncidencia">
                                <option value="Seguridad Pública" <%= incidenciaB != null && "Seguridad Pública".equals(incidenciaB.getTipoIncidencia()) ? "selected" : "" %>>Seguridad Pública</option>
                                <option value="Emergencia Médica" <%= incidenciaB != null && "Emergencia Médica".equals(incidenciaB.getTipoIncidencia()) ? "selected" : "" %>>Emergencia Médica</option>
                                <option value="Infraestructura y Servicios Públicos" <%= incidenciaB != null && "Infraestructura y Servicios Públicos".equals(incidenciaB.getTipoIncidencia()) ? "selected" : "" %>>Infraestructura y Servicios Públicos</option>
                                <option value="Otro" <%= incidenciaB != null && "Otro".equals(incidenciaB.getTipoIncidencia()) ? "selected" : "" %>>Otro</option>
                            </select><br>
                            <br>
                            <% if (errores != null && errores.containsKey("tipoIncidencia2")) { %>
                            <span class="text-danger"><%= errores.get("tipoIncidencia2") %></span>
                            <% } %>
                        </div>
                        <div class="campo" style="margin-bottom: -35px;">
                            <label for="urbanizacion">Urbanización:</label><br>
                            <select id="urbanizacion" name="urbanizacion_idUrbanizacion">
                                <option value="Rafael Escardó" <%= incidenciaB != null && "Rafael Escardó".equals(incidenciaB.getUrbanizacion()) ? "selected" : "" %>>Rafael Escardó</option>
                                <option value="José de La Riva Agüero" <%= incidenciaB != null && "José de La Riva Agüero".equals(incidenciaB.getUrbanizacion()) ? "selected" : "" %>>José de La Riva Agüero</option>
                                <option value="Juan XXIII" <%= incidenciaB != null && "Juan XXIII".equals(incidenciaB.getUrbanizacion()) ? "selected" : "" %>>Juan XXIII</option>
                                <option value="Libertad" <%= incidenciaB != null && "Libertad".equals(incidenciaB.getUrbanizacion()) ? "selected" : "" %>>Libertad</option>
                                <option value="Los Jardines de La Marina" <%= incidenciaB != null && "Los Jardines de La Marina".equals(incidenciaB.getUrbanizacion()) ? "selected" : "" %>>Los Jardines de La Marina</option>
                                <option value="Las Leyendas" <%= incidenciaB != null && "Las Leyendas".equals(incidenciaB.getUrbanizacion()) ? "selected" : "" %>>Las Leyendas</option>
                                <option value="Las Torres San Miguelito" <%= incidenciaB != null && "Las Torres San Miguelito".equals(incidenciaB.getUrbanizacion()) ? "selected" : "" %>>Las Torres San Miguelito</option>
                                <option value="Elmer Faucett" <%= incidenciaB != null && "Elmer Faucett".equals(incidenciaB.getUrbanizacion()) ? "selected" : "" %>>Elmer Faucett</option>
                                <option value="Maranga" <%= incidenciaB != null && "Maranga".equals(incidenciaB.getUrbanizacion()) ? "selected" : "" %>>Maranga</option>
                                <option value="Pando" <%= incidenciaB != null && "Pando".equals(incidenciaB.getUrbanizacion()) ? "selected" : "" %>>Pando</option>
                                <option value="Parques de La Huaca" <%= incidenciaB != null && "Parques de La Huaca".equals(incidenciaB.getUrbanizacion()) ? "selected" : "" %>>Parques de La Huaca</option>
                                <option value="Otro" <%= incidenciaB != null && "Otro".equals(incidenciaB.getUrbanizacion()) ? "selected" : "" %>>Otro</option>
                            </select>
                            <br>
                            <br>
                            <% if (errores != null && errores.containsKey("urbanizacion2")) { %>
                            <span class="text-danger"><%= errores.get("urbanizacion2") %></span>
                            <% } %>
                        </div>
                        <div class="form-group">
                            <label for="paraMi">La incidencia será para:</label><br>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="incidenciaPersonal" id="paraMi" value="1" <%= incidenciaB != null && incidenciaB.getIncidenciaPersonal() == 1 ? "checked" : "" %>>
                                <label class="form-check-label" for="paraMi">
                                    Para mi
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="incidenciaPersonal" id="paraOtraPersona" value="0" <%= incidenciaB != null && incidenciaB.getIncidenciaPersonal() == 0 ? "checked" : "" %>>
                                <label class="form-check-label" for="paraOtraPersona">
                                    Para otra persona
                                </label>
                            </div>
                            <% if (errores != null && errores.containsKey("incidenciaPersonal2")) { %>
                            <span class="text-danger"><%= errores.get("incidenciaPersonal2") %></span>
                            <% } %>
                        </div>
                    </div>
                    <div class="columna columna2" style="margin-top: 102px;">
                        <div class="campo">
                            <label for="lugarExacto">Lugar exacto</label><br>
                            <input type="text" id="lugarExacto" name="lugarExacto" placeholder="Escribe aquí" value="<%= incidenciaB != null ? incidenciaB.getLugarExacto() : "" %>"><br>
                            <% if (errores != null && errores.containsKey("lugarExacto2")) { %>
                            <span class="text-danger"><%= errores.get("lugarExacto2") %></span>
                            <% } %>
                        </div>
                        <div class="campo">
                            <label for="referencia">Referencia</label><br>
                            <input type="text" id="referencia" name="referencia" placeholder="Escribe aquí" value="<%= incidenciaB != null ? incidenciaB.getReferencia() : "" %>"><br>
                            <% if (errores != null && errores.containsKey("referencia2")) { %>
                            <span class="text-danger"><%= errores.get("referencia2") %></span>
                            <% } %>
                        </div>
                        <div class="campo">
                            <label for="contacto">Contacto (opcional)</label><br>
                            <input type="text" id="contacto" name="numeroContacto" placeholder="Escribe aquí" value="<%= incidenciaB != null ? incidenciaB.getNumeroContacto() : "" %>"><br>
                            <% if (errores != null && errores.containsKey("numeroContacto2")) { %>
                            <span class="text-danger"><%= errores.get("numeroContacto2") %></span>
                            <% } %>
                        </div>
                        <div class="campo">
                            <label>¿Requiere ambulancia?</label><br>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="ambulancia" id="gridRadios1" value="1" <%= incidenciaB != null && incidenciaB.getAmbulancia() == 1 ? "checked" : "" %>>
                                <label class="form-check-label" for="gridRadios1">
                                    Sí
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="ambulancia" id="gridRadios2" value="0" <%= incidenciaB != null && incidenciaB.getAmbulancia() == 0 ? "checked" : "" %>>
                                <label class="form-check-label" for="gridRadios2">
                                    No
                                </label>
                            </div>
                            <% if (errores != null && errores.containsKey("ambulancia2")) { %>
                            <span class="text-danger"><%= errores.get("ambulancia2") %></span>
                            <% } %>
                        </div>
                        <div class="m-n2">
                            <button type="submit" class="btn btn-secondary m-2">Actualizar incidencia</button>
                            <a href="<%=request.getContextPath()%>/VecinoServlet?action=listarIncidencia"><button type="button" class="btn btn-danger m-2">Cancelar</button></a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light rounded-top p-4">
                <div class="row">
                    <div class="col-12 col-sm-6 text-center text-sm-start">
                        &copy; <a >TelevecinosUnidos</a>, All Right Reserved.
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