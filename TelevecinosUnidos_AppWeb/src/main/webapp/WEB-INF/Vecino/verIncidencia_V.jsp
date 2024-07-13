<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.televecinosunidos_appweb.model.beans.IncidenciasB" %>
<%@ page import="java.util.Optional" %>

<% IncidenciasB incidenciasB = (IncidenciasB) request.getAttribute("incidencia"); %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Ver incidencia</title>
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
        <!-- PARTE SUPERIOR FINAL -->

        <!-- LLENAR-->
        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="campo">
                            <h2>Ver información de la incidencia</h2>
                        </div>
                        <form>
                            <div class="card shadow-sm" >
                                <div class="card-header text-lg-center">
                                    <h5>Información de la Incidencia</h5>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <img id="preview" src="#" alt="Vista previa de la imagen" class="img-thumbnail" style="display: none;">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label class="form-label" style="color:#023047;"><b>Nombre de la incidencia</b></label>
                                            <div class="bar p-2 bg-light rounded" data-label="Nombre de la incidencia">
                                                <%= request.getAttribute("incidencia") != null ? ((IncidenciasB) request.getAttribute("incidencia")).getNombreIncidencia() : "" %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label class="form-label" style="color:#023047;"><b>Tipo de incidencia</b></label>
                                            <div class="bar p-2 bg-light rounded" data-label="Tipo de incidencia">
                                                <%= request.getAttribute("incidencia") != null ? ((IncidenciasB) request.getAttribute("incidencia")).getTipoIncidencia() : "" %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label class="form-label" style="color:#023047;"><b>La incidencia es para:</b></label>
                                            <div class="bar p-2 bg-light rounded" data-label="La incidencia es para">
                                                <%= request.getAttribute("incidencia") != null && ((IncidenciasB) request.getAttribute("incidencia")).getIncidenciaPersonal() == 1 ? "Para otra persona" : "Personal" %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label class="form-label" style="color:#023047;"><b>Lugar exacto:</b></label>
                                            <div class="bar p-2 bg-light rounded" data-label="Lugar exacto">
                                                <%= request.getAttribute("incidencia") != null ? ((IncidenciasB) request.getAttribute("incidencia")).getLugarExacto() : "" %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label class="form-label" style="color:#023047;"><b>Referencia</b></label>
                                            <div class="bar p-2 bg-light rounded" data-label="Referencia">
                                                <%= request.getAttribute("incidencia") != null ? ((IncidenciasB) request.getAttribute("incidencia")).getReferencia() : "" %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label class="form-label" style="color:#023047;"><b>Contacto</b></label>
                                            <div class="bar p-2 bg-light rounded" data-label="Contacto">
                                                <%= request.getAttribute("incidencia") != null ? ((IncidenciasB) request.getAttribute("incidencia")).getNumeroContacto() : "" %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label class="form-label" style="color:#023047;"><b>¿Se requiere ambulancia?</b></label>
                                            <div class="bar p-2 bg-light rounded" data-label="¿Se requiere ambulancia?">
                                                <%= request.getAttribute("incidencia") != null && ((IncidenciasB) request.getAttribute("incidencia")).getAmbulancia() == 1 ? "Sí" : "No" %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label class="form-label" style="color:#023047;"><b>Fecha y hora de la generación de incidencia:</b></label>
                                            <div class="bar p-2 bg-light rounded" data-label="Fecha y hora de la generación de incidencia">
                                                <%= request.getAttribute("incidencia") != null ? ((IncidenciasB) request.getAttribute("incidencia")).getFecha() + " a las " + ((IncidenciasB) request.getAttribute("incidencia")).getHora() : "" %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-6" style="margin-top: 85px;">
                        <form>
                            <label class="form-label"><b>Foto del incidente</b></label>
                            <div class="rounded h-100 p-4" style="background-color: #ffb703;">
                                <div class="mb-3">
                                    <img src="ImagenServlet?idImagenIncidencia=<%= request.getAttribute("incidencia") != null ? ((IncidenciasB) request.getAttribute("incidencia")).getIdIncidencias() : "" %>" class="img-responsive" alt="" style="width: 100%; height: auto;" />
                                </div>
                            </div>

                            <div class="d-flex justify-content-end">
                                <a href="<%=request.getContextPath()%>/VecinoServlet?action=listarIncidencia">
                                    <button type="button" class="btn btn-secondary m-2 d-flex justify-content-between align-items-center">Regresar</button>
                                </a>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4" >
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
