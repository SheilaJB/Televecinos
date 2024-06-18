<%@ page import="org.example.televecinosunidos_appweb.model.beans.IncidenciasB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="lista" scope="request" type="java.util.ArrayList<org.example.televecinosunidos_appweb.model.beans.IncidenciasB>" />
<jsp:useBean id="textoBusqueda" scope="request" type="java.lang.String" class="java.lang.String"/>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <title>Lista de incidencias</title>
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

        <!-- Bootstrap JS dependencies -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <div id="Nombre del evento">
            <h3 style="text-align: left; margin-top:20px;margin-bottom:20px;padding: 20px">Lista de incidencias</h3>
        </div>
        <!-- Filtro -->
        <div style="background-color: #f8f9fa; padding: 20px; align-items: center;">
            <div style="background-color: #FFB703; padding: 20px; border: 1px solid #ccc; border-radius: 5px;">

                <form method="post" action="<%=request.getContextPath()%>/SerenazgoServlet?action=buscarIncidenciaFiltro">
                    <div class="row justify-content-center align-items-center">
                        <div class="col-md-2 mb-2">
                            <input type="text" class="form-control" id="filtroInput" placeholder="Buscar incidencia..." name="textoBuscarIncidencia" value="<%=textoBusqueda%>"/>
                        </div>
                        <div class="col-md-2 mb-2">
                            <!-- Selector de criticidad -->
                            <select id="filtroCriticidad" style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; width: 100%;">
                                <option selected disabled>Criticidad</option>
                                <option name="1">Baja</option>
                                <option name="2">Media</option>
                                <option name="3">Alta</option>
                            </select>
                        </div>
                        <div class="col-md-2 mb-2">
                            <!-- Selector de tipo de incidencia -->
                            <select id="filtroIncidencia" style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; width: 100%;">
                                <option selected disabled>Tipo de Incidencia</option>
                                <option name="1">Seguridad Publica</option>
                                <option name="2">Emergencia pública</option>
                                <option name="3">Infraestructura y Servicios Públicos</option>
                                <option name="4">Otro</option>
                            </select>
                        </div>

                        <div class="col-md-2 mb-2">
                            <!-- Selector de estado -->
                            <select id="filtroEstado" style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; width: 100%;">
                                <option selected disabled>Estado</option>
                                <option value="1">Pendiente</option>
                                <option value="2">En curso</option>
                                <option value="3">Cancelado</option>
                                <option value="4">Rechazado</option>
                                <option value="5">Procesado</option>
                            </select>
                        </div>
                        <div class="col-md-2 mb-2">
                            <!-- Selector de urbanización -->
                            <select id="filtroUrbanizacion" style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; width: 100%;">
                                <option selected disabled>Urbanización</option>
                                <option value="1">Rafael Escardó</option>
                                <option value="2">José de La Riva Agüero</option>
                                <option value="3">Juan XXIII</option>
                                <option value="4">Libertad</option>
                                <option value="5">Los Jardines de La Marina</option>
                                <option value="6">Las Leyendas</option>
                                <option value="7">Las Torres San Miguelito</option>
                                <option value="8">Elmer Faucett</option>
                                <option value="9">Maranga</option>
                                <option value="10">Pando</option>
                                <option value="11">Parques de La Huaca</option>
                                <option value="12">Otro</option>
                            </select>
                        </div>

                        <!-- Botón de filtrado -->
                        <div class="col-md-1 mb-2">
                            <button class="btn btn-primary" type="submit" style="width: 100%;">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                        <div class="col-md-1 mb-2">
                            <a class="btn btn-secondary" href="<%=request.getContextPath()%>/SerenazgoServlet?action=listaIncias_S" style="width: 100%;">Limpiar</a>
                        </div>
                    </div>
                </form>

            </div>




            <div class="table-responsive">
                <table class="table" style="background-color: transparent;">
                    <thead>

                    <tr>
                        <th scope="col">Nombre de la incidencia</th>
                        <th scope="col">Fecha</th>
                        <th scope="col">Tipo</th>
                        <th scope="col">Criticidad</th>
                        <th scope="col">Urbanización</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Gestionar</th>
                        <th scope="col">Ver</th>
                    </tr>
                    </thead>

                    <tbody>
                    <% for (IncidenciasB incidenciasB : lista) { %>
                    <tr>

                        <td><%= incidenciasB.getNombreIncidencia()  %>
                        </td>
                        <td><%=incidenciasB.getFecha()%>
                        </td>
                        <td><%=incidenciasB.getTipoIncidencia_idTipoIncidenciaStr()%>
                        </td>
                        <td><%=incidenciasB.getCriticidadIncidencia_idCriticidadIncidenciaStr()%>
                        </td>
                        <td><%=incidenciasB.getUrbanizacion()%>
                        </td>
                        <td><%=incidenciasB.getEstadosIncidencia_idEstadoIncidenciaStr()%>
                        </td>

                        <td><a href="<%=request.getContextPath()%>/SerenazgoServlet?action=gestionar_Incidencia_S&id=<%=incidenciasB.getIdIncidencias()%>"><button type="button" class="btn btn-success-puedeGestionar m-2"><i class="fas fa-check"></i></button></a></td>
                        <!--
                        <td>Incidencia 1</td>
                        <td>21-Enero</td>
                        <th scope="col">Seguridad pública</th>
                        <td><i class="me-2 colorLetrasBarraLateral"></i>Media</a></td>
                        <th scope="col">Los Jardines de La Marina</th>
                        <td><i class="fa me-2 colorLetrasBarraLateral"></i>Pendiente</a></td>
                        <td>
                            <a href="gestionar_Incidencia_S.html">
                                <button type="button" class="btn btn-success-puedeGestionar m-2" onclick="editEvent(1)">
                                    <i class="fas fa-pencil-alt"></i>
                                </button>
                            </a>
                        </td>
                        <td>
                            <a href="verInicidencia_S.html">
                                <button type="button" class="btn btn-primary m-2" onclick="editEvent(1)">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </a>
                        </td>
                    </tr> -->

                    </tr>

                    <% } %>
                    </tbody>

                </table>

            </div>
            <div  style="display: flex; justify-content: center; align-items: center;">
                <section class="paginacion" >
                    <ul style="list-style: none;padding: 0;margin: 0;display: flex;">
                        <div style="background-color: white ; padding: 5px; margin:10px">
                            <li style="margin: 0 5px;"><a class="link-opacity-50-hover" class="link-opacity-50-hover" href="#" class="active">1</a></li>
                        </div>
                        <div style="background-color:white ; padding: 5px;margin:10px">
                            <li style="margin: 0 5px;"><a class="link-opacity-50-hover" class="link-opacity-50-hover" href="#" class="active">2</a></li>
                        </div>
                        <div style="background-color: white ; padding: 5px;margin:10px">
                            <li style="margin: 0 5px;"><a class="link-opacity-50-hover" class="link-opacity-50-hover" href="#" class="active">3</a></li>
                        </div>
                    </ul>
                </section>
            </div>
        </div>
        </div>
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
<script src="js/script_actualizar_incidencia.js"></script>
</body>

</html>