<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="incidencia" scope="request" type="org.example.televecinosunidos_appweb.model.beans.IncidenciasB"/>
<jsp:useBean id="nombreVecinoDuenoIncidencia" scope="request" type="java.lang.String"/>

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
    <link href="css/app.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style_incidencias.css">
    <link href="css/style_vec.css" rel="stylesheet">
    <link href="css/style_serenazgo.css" rel="stylesheet">



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

        <!-- LLENAR-->
        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="container">
                <div class="col-md-12" style="text-align: center;">
                    <h2>Ver información de la incidencia</h2>
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-md-12 d-flex justify-content-between">
                        <div class="col-auto">
                            <a href="<%=request.getContextPath()%>/SerenazgoServlet?action=listaIncidencias_S">
                                <button class="btn btn-lg btn-primary m-2" style="background-color: #023047; border-color: #023047; color: #ffffff;"><i class="fas fa-arrow-alt-circle-left"></i> Regresar</button>
                            </a>
                        </div>
                        <div class="col-auto">
                            <%if(incidencia.getSerenazgo_idSerenazgo()==0 || incidencia.getEstadosIncidencia_idEstadoIncidencia() <=2){%>
                            <a href="<%=request.getContextPath()%>/SerenazgoServlet?action=gestionar_Incidencia_S&id=<%=incidencia.getIdIncidencias()%>">
                                <button class="btn btn-lg btn-primary m-2" style="background-color: #146951; border-color: #146951; color: #ffffff;margin-top: 10px;">Gestionar</button>
                            </a>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-6" style="margin-top: 15px;">
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
                                            <label for="NombreIncidencia" class="form-label" style="color:#023047;"><b>Nombre de la incidencia: </b></label>
                                            <br>
                                            <a style="color: #000000;">• <%=incidencia.getNombreIncidencia()%></a>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label for="TipoIncidencia" class="form-label" style="color:#023047;"><b>Tipo de incidencia:</b></label>
                                            <br>
                                            <a style="color: #000000;">•<%=incidencia.getTipoIncidencia_idTipoIncidenciaStr()%></a>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label for="esPara" class="form-label" style="color:#023047;"><b>La incidencia pertenece a:</b></label>
                                            <br>
                                            <a style="color: #000000;">•<%=nombreVecinoDuenoIncidencia%></a>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label for="esPara" class="form-label" style="color:#023047;"><b>Es para:</b></label>
                                            <br>
                                            <%if(incidencia.getIncidenciaPersonal()==0){%>
                                            <a style="color: #000000;">•Otra persona</a>
                                            <%}else{%>
                                            <a style="color: #000000;">•El mismo vecino</a>
                                            <%}%>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label for="esPara" class="form-label" style="color:#023047;"><b>Urbanizacion:</b></label>
                                            <br>
                                            <a style="color: #000000;">•<%=incidencia.getUrbanizacion()%></a>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label for="lugarExacto" class="form-label" style="color:#023047;"><b>Lugar exacto:</b></label>
                                            <br>
                                            <a style="color: #000000;">•<%=incidencia.getLugarExacto()%></a>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label for="referencia" class="form-label" style="color:#023047;"><b>Referencia:</b></label>
                                            <br>
                                            <a style="color: #000000;">•<%=incidencia.getReferencia()%></a>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label for="contacto" class="form-label" style="color:#023047;"><b>Número de contacto:</b></label>
                                            <br>
                                            <% if (incidencia.getNumeroContacto() == null){%>
                                            <a style="color: #000000;">•No ha sido registrado por el vecino></a>
                                            <%}else{%>
                                            <a style="color: #000000;">•<%=incidencia.getNumeroContacto()%></a>
                                            <%}%>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label for="ambulancia" class="form-label" style="color:#023047;"><b>¿Se requiere ambulancia?</b></label>
                                            <br>
                                            <%if(incidencia.getAmbulancia()==1){ %>
                                            <a style="color: #000000;">•Sí</a>
                                            <%}else{ %>
                                            <a style="color: #000000;">•No</a>
                                            <%} %>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label for="fechaGenereación" class="form-label" style="color:#023047;"><b>Fecha y hora de la generación de incidencia:</b></label>
                                            <br>
                                            <a style="color: #000000;">•<%=incidencia.getFecha()%> </a>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-6" style="margin-top: 10px;">
                        <form>
                            <label class="form-label"><b style="color: #000000;">Foto del incidente</b></label>
                            <div class="rounded h-100 p-4" style="background-color: #023047;">
                                <div class="mb-3">
                                    <%if(incidencia.getNombreFoto() == null || incidencia.getNombreFoto().equals("") ){%>
                                    <div style="color: white;">
                                        No se ingresó ninguna imagen de referencia
                                    </div>
                                    <%}else{%>
                                    <img src="ImagenServlet?action=incidencia&idImagenIncidencia=<%=incidencia.getIdIncidencias()%>" class="img-responsive" alt="" style="width: 100%; height: auto;"  />
                                    <%}%>
                                </div>
                            </div>
                            <%if(incidencia.getEstadosIncidencia_idEstadoIncidencia()==5){%>
                                <div style="margin-top: 15px;">
                                    <form>
                                        <div class="card shadow-sm">
                                            <div class="card-body">
                                                <div>
                                                    <label class="form-label" style="color:#023047;"><b>Incidencia gestionada por: </b></label>
                                                    <a style="color: #000000;"> <%=incidencia.getNombrePersonalTurno()%></a>
                                                </div>
                                                <div>
                                                    <label class="form-label" style="color:#023047;"><b>Solucion a dar: </b></label>
                                                    <a style="color: #000000;"> <%=incidencia.getSolucionADar()%></a><br>
                                                </div>
                                                <div>
                                                    <label class="form-label" style="color:#023047;"><b>Criticidad: </b></label>
                                                    <a style="color: #000000;"> <%=incidencia.getCriticidadIncidencia_idCriticidadIncidenciaStr()%></a><br>
                                                </div>
                                                <div>
                                                    <label class="form-label" style="color:#023047;"><b>Personal requerido: </b></label>
                                                    <a style="color: #000000;"> <%=incidencia.getPersonalRequeridoStr()%></a><br>
                                                </div>
                                                <div>
                                                    <label class="form-label" style="color:#023047;"><b>Movilidad requerido: </b></label>
                                                    <a style="color: #000000;"> <%=incidencia.getMovilidadRequeridoStr()%></a><br>
                                                </div>



                                            </div>
                                        </div>
                                    </form>
                                </div>
                            <%}%>


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