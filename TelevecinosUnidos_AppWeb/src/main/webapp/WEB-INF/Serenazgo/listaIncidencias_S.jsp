<%@ page import="org.example.televecinosunidos_appweb.model.beans.IncidenciasB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="lista" scope="request" type="java.util.ArrayList<org.example.televecinosunidos_appweb.model.beans.IncidenciasB>" />
<jsp:useBean id="textoBusqueda" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="criticidad" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="tipo" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="estado" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="urbanizacion" scope="request" type="java.lang.String" class="java.lang.String"/>

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

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!---->
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            text-align: center;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
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



        <!-- LLENAR-->

        <!-- Bootstrap JS dependencies -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


        <!-- Filtro -->
        <div id="Titulo_Incidencias">
            <h1 class="display-4 text-center" style="margin-top:20px;margin-bottom:20px;padding: 20px">
                <h1 style="text-align: center"><i class="fas fa-clipboard-list"></i> Lista de incidencias por gestionar</h1>
            </h1>
            <p class="lead text-center">Revisa el estado de las incidencias que los usuarios han reportado</p>
        </div>
        <div style="background-color: #f8f9fa; padding: 20px; align-items: center;">

            <div style="background-color: #FFB703; padding: 20px; border: 1px solid #ccc; border-radius: 5px;">


                <form method="post" action="<%=request.getContextPath()%>/SerenazgoServlet?action=buscarIncidenciaFiltro">
                    <div class="row justify-content-center align-items-center">
                        <div class="col-md-2 mb-2">
                            <input type="text" class="form-control" id="filtroInput" placeholder="Buscar..." name="textoBuscarIncidencia" value="<%=textoBusqueda%>"/>
                        </div>
                        <div class="col-md-2 mb-2">
                            <!-- Selector de criticidad -->
                            <select name="criticidad" style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; width: 100%;">
                                <option selected disabled>Criticidad</option>
                                <option value="1" <%= criticidad.equals("1") ? "selected" : "" %>>Baja</option>
                                <option value="2" <%= criticidad.equals("2") ? "selected" : "" %>>Media</option>
                                <option value="3" <%= criticidad.equals("3") ? "selected" : "" %>>Alta</option>

                            </select>
                        </div>
                        <div class="col-md-2 mb-2">
                            <!-- Selector de tipo de incidencia -->
                            <select name="tipoIncidencia" style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; width: 100%;">
                                <option selected disabled>Tipo de Incidencia</option>

                                <option value="1" <%= tipo.equals("1") ? "selected" : "" %>>Seguridad Publica</option>
                                <option value="2" <%= tipo.equals("2") ? "selected" : "" %>>Emergencia pública</option>
                                <option value="3" <%= tipo.equals("3") ? "selected" : "" %>>Infraestructura y Servicios Públicos</option>
                                <option value="4" <%= tipo.equals("4") ? "selected" : "" %>>Otro</option>

                            </select>
                        </div>

                        <div class="col-md-2 mb-2">
                            <!-- Selector de estado -->
                            <select name="estadoIncidencia" style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; width: 100%;">
                                <option selected disabled>Estado</option>

                                <option value="1" <%= estado.equals("1") ? "selected" : "" %>>Pendiente</option>
                                <option value="2" <%= estado.equals("2") ? "selected" : "" %>>En curso</option>
                                <option value="3" <%= estado.equals("3") ? "selected" : "" %>>Cancelado</option>
                                <option value="4" <%= estado.equals("4") ? "selected" : "" %>>Rechazado</option>
                                <option value="5" <%= estado.equals("5") ? "selected" : "" %>>Procesado</option>


                            </select>
                        </div>
                        <div class="col-md-2 mb-2">
                            <!-- Selector de urbanización -->
                            <select name="urbanizacion" style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; width: 100%;">
                                <option selected disabled>Urbanización</option>
                                <option value="1" <%= urbanizacion.equals("1") ? "selected" : "" %>>Rafael Escardó</option>
                                <option value="2" <%= urbanizacion.equals("2") ? "selected" : "" %>>José de La Riva Agüero</option>
                                <option value="3" <%= urbanizacion.equals("3") ? "selected" : "" %>>Juan XXIII</option>
                                <option value="4" <%= urbanizacion.equals("4") ? "selected" : "" %>>Libertad</option>
                                <option value="5" <%= urbanizacion.equals("5") ? "selected" : "" %>>Los Jardines de La Marina</option>
                                <option value="6" <%= urbanizacion.equals("6") ? "selected" : "" %>>Las Leyendas</option>
                                <option value="7" <%= urbanizacion.equals("7") ? "selected" : "" %>>Las Torres San Miguelito</option>
                                <option value="8" <%= urbanizacion.equals("8") ? "selected" : "" %>>Elmer Faucett</option>
                                <option value="9" <%= urbanizacion.equals("9") ? "selected" : "" %>>Maranga</option>
                                <option value="10" <%= urbanizacion.equals("10") ? "selected" : "" %>>Pando</option>
                                <option value="11" <%= urbanizacion.equals("11") ? "selected" : "" %>>Parques de La Huaca</option>
                                <option value="12" <%= urbanizacion.equals("12") ? "selected" : "" %>>Otro</option>

                            </select>
                        </div>

                        <!-- Botón de filtrado -->
                        <div class="col-md-1 mb-2">
                            <button class="btn btn-primary" type="submit" style="width: 100%;">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                        <div class="col-md-1 mb-2">
                            <a class="btn btn-secondary text-center" href="<%=request.getContextPath()%>/SerenazgoServlet?action=listaIncidencias_S" style="width: 100%;"><i class="fas fa-eraser"></i></a>
                        </div>
                    </div>
                </form>

            </div>




            <div class="table-responsive">
                <table class="table" style="background-color: transparent;">
                    <thead>

                    <tr>
                        <th scope="col">Nombre</th>
                        <th scope="col">Fecha</th>
                        <th scope="col">Tipo</th>
                        <th scope="col">Urbanización</th>
                        <th scope="col">Criticidad</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Gestionar</th>
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
                        <td><%=incidenciasB.getUrbanizacion()%>
                        </td>
                        <% if(incidenciasB.getCriticidadIncidencia_idCriticidadIncidenciaStr() != null){%>
                        <% String color = null;
                            String estiloFuente = "font-weight: bold;"; // Estilo de fuente más grueso

                            switch (incidenciasB.getCriticidadIncidencia_idCriticidadIncidenciaStr()) {
                                case "Baja":
                                    color = "green";
                                    break;
                                case "Media":
                                    color = "orange";
                                    break;
                                case "Alta":
                                    color = "red";
                                    break;
                            }
                        %>
                        <td style="color: <%= color %>; <%= estiloFuente %>">
                            <%= incidenciasB.getCriticidadIncidencia_idCriticidadIncidenciaStr() %>
                        </td>

                        <%}else{%>
                            <td>-</td>
                        <%}%>
                        <% String color_estados = null;
                            String estiloFuente = "font-weight: bold;"; // Estilo de fuente más grueso

                            switch (incidenciasB.getEstadosIncidencia_idEstadoIncidenciaStr()) {
                                case "Pendiente":
                                    color_estados = "red";
                                    break;
                                case "En curso":
                                    color_estados = "blue";
                                    break;
                                case "Cancelado":
                                    color_estados = "grey";
                                    break;
                                case "Rechazado":
                                    color_estados = "brown";
                                    break;
                                case "Procesado":
                                    color_estados = "black";
                                    break;
                            }
                        %>
                        <td style="color: <%= color_estados %>; <%= estiloFuente %>">
                            <%= incidenciasB.getEstadosIncidencia_idEstadoIncidenciaStr() %>
                        </td>

                        <% if (incidenciasB.getEstadosIncidencia_idEstadoIncidencia() == 5) { %>
                        <td><button type="button" class="btn btn-danger m-2" style="background-color: grey;" onclick="incidenciaYaGestionada('<%=incidenciasB.getNombrePersonalTurno()%>','<%=incidenciasB.getIdIncidencias()%>','<%=incidenciasB.getUsuario_idUsuario()%>')"><i class="fas fa-clipboard-list"></i></button></td>
                        <% } else if (incidenciasB.getEstadosIncidencia_idEstadoIncidencia() == 3) { %>
                        <td><button type="button" class="btn btn-danger m-2" style="background-color: grey;" onclick="incidenciaCancelada()"><i class="fas fa-clipboard-list"></i></button></td>
                        <% } else if (incidenciasB.getEstadosIncidencia_idEstadoIncidencia() == 4) { %>
                        <td><button type="button" class="btn btn-danger m-2" style="background-color: grey;" onclick="incidenciaRechazada()"><i class="fas fa-clipboard-list"></i></button></td>
                        <% } else { %>
                        <!--<td><a href="<%=request.getContextPath()%>/SerenazgoServlet?action=gestionar_Incidencia_S&id=<%=incidenciasB.getIdIncidencias()%>"><button type="button" class="btn btn-success-puedeGestionar m-2"><i class="fas fa-clipboard-list"></i></button></a></td>-->
                        <td><button type="button" class="btn btn-success-puedeGestionar m-2" onclick="incidenciaPorGestionar('<%=incidenciasB.getNombrePersonalTurno()%>','<%=incidenciasB.getIdIncidencias()%>','<%=incidenciasB.getUsuario_idUsuario()%>')"><i class="fas fa-clipboard-list"></i></button></td>
                        <% } %>



                    </tr>

                    <% } %>
                    </tbody>

                </table>
                <%
                    int paginaActual = (int) request.getAttribute("paginaActual");
                    int totalPaginas = (int) request.getAttribute("totalPaginas");
                %>
                <nav>
                    <ul class="pagination">
                        <li class="page-item <%= paginaActual == 1 ? "disabled" : "" %>">
                            <a class="page-link" href="<%=request.getContextPath()%>/SerenazgoServlet?action=listaIncidencias_S&page=<%= paginaActual - 1 %>">Anterior</a>
                        </li>
                        <% if (totalPaginas > 0) { %>
                        <% for (int i = 1; i <= totalPaginas; i++) { %>
                        <li class="page-item <%= i == paginaActual ? "active" : "" %>">
                            <a class="page-link" href="<%=request.getContextPath()%>/SerenazgoServlet?action=listaIncidencias_S&page=<%= i %>"><%= i %></a>
                        </li>
                        <% } %>
                        <% } else { %>
                        <li class="page-item active">
                            <a class="page-link" href="#">1</a>
                        </li>
                        <% } %>
                        <li class="page-item <%= paginaActual == totalPaginas || totalPaginas == 0 ? "disabled" : "" %>">
                            <% if (paginaActual < totalPaginas && totalPaginas > 0) { %>
                            <a class="page-link" href="<%=request.getContextPath()%>/SerenazgoServlet?action=listaIncidencias_S&page=<%= paginaActual + 1 %>">Siguiente</a>
                            <% } else { %>
                            <span class="page-link">Siguiente</span>
                            <% } %>
                        </li>
                    </ul>
                </nav>
                <script>
                    function incidenciaRechazada() {
                        Swal.fire({
                            icon: "error",
                            title: "Error",
                            text: "Esta incidencia ha sido rechazada por ser falsa",
                        });

                    }
                </script>

                <script>
                    function incidenciaCancelada() {
                        Swal.fire({
                            icon: "error",
                            title: "Error",
                            text: "Esta incidencia ha sido cancelada por el vecino",
                        });

                    }
                </script>

                <script>
                    function incidenciaPorGestionar(nombrePersonalTurno,idIncidencia,idVecinoDuenoIncidencia) {
                        Swal.fire({
                            title: "¿Qué deseas hacer?",
                            showDenyButton: true,
                            showCancelButton: true,
                            confirmButtonColor: "#023047",
                            denyButtonColor: "#146951",
                            cancelButtonColor: "#d93030",
                            confirmButtonText: "Ver incidencia",
                            denyButtonText: `Gestionar incidencia`,
                            cancelButtonText: "Regresar"
                        }).then((result) => {
                            /* Read more about isConfirmed, isDenied below */
                            if (result.isConfirmed) {
                                window.location.href = '<%= request.getContextPath() %>/SerenazgoServlet?action=verDetalleIncidencia&idIncidencia=' + idIncidencia + "&idVecinoDuenoIncidencia="+idVecinoDuenoIncidencia;
                            } else if (result.isDenied) {
                                window.location.href = href="<%=request.getContextPath()%>/SerenazgoServlet?action=gestionar_Incidencia_S&id=" + idIncidencia;
                            }
                        });

                    }
                </script>



                <script>
                    function incidenciaYaGestionada(nombrePersonalTurno,idIncidencia,idVecinoDuenoIncidencia) {
                        Swal.fire({
                            title: "Error",
                            text: "Esta incidencia ya ha sido gestionada por: "+ nombrePersonalTurno,
                            icon: "warning",
                            showCancelButton: true,
                            confirmButtonColor: "#3085d6",
                            cancelButtonColor: "#d33",
                            confirmButtonText: "Ver detalle",
                            cancelButtonText: "Regresar"

                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = '<%= request.getContextPath() %>/SerenazgoServlet?action=verDetalleIncidencia&idIncidencia=' + idIncidencia + "&idVecinoDuenoIncidencia="+idVecinoDuenoIncidencia;

                            }
                        });

                    }
                </script>




            </div>
        </div>
        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light rounded-top p-4">
                <div class="row">
                    <div class="col-12 col-sm-6 text-center text-sm-start">
                        &copy; <a>Televecinos Unidos</a>, All Right Reserved.
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->


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
<script src="js/script_actualizar_incidencia.js"></script>
</body>

</html>