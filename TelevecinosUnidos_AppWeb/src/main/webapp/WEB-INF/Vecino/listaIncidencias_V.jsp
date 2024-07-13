<%@ page import="org.example.televecinosunidos_appweb.model.beans.IncidenciasB" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<IncidenciasB> lista = (ArrayList<IncidenciasB>) request.getAttribute("lista"); %>

<jsp:useBean id="textoBuscarIncidencia" scope="request" type="java.lang.String" class="java.lang.String"/>
<%
    int paginaActual = request.getAttribute("paginaActual") != null ? (int) request.getAttribute("paginaActual") : 1;
    int totalPaginas = request.getAttribute("totalPaginas") != null ? (int) request.getAttribute("totalPaginas") : 1;
%>
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

    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        .btn-sm-square {
            width: 20px;
            height: 20px;
            padding: 0;
            text-align: center;
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
        <!-- PARTE SUPERIOR FINAL -->

        <!-- LLENAR-->
        <div id="Titulo_Incidencias">
            <h1 class="display-4 text-center" style="margin-top:20px;margin-bottom:20px;padding: 20px">
                <h1 style="text-align: center"><i class="fas fa-exclamation-triangle"></i> ¡Tus incidencias reportadas!</h1>
            </h1>
            <p class="lead text-center">Revisa el estado de las incidencias que has reportado</p>
        </div>
        <% if (session.getAttribute("info") != null) { %>
        <script>
            Swal.fire({
                icon: 'success',
                title: '¡Éxito!',
                text: '<%= session.getAttribute("info") %>',
                showConfirmButton: false,
                timer: 2000
            });
        </script>
        <% session.removeAttribute("info"); %>
        <% } %>

        <div style="background-color: #f8f9fa; padding: 20px; align-items: center;">
            <!-- Filtro -->
            <div style="background-color: #FFB703 ; padding: 20px; border: 1px solid #ccc; border-radius: 5px;">
                <form method="post" action="<%=request.getContextPath()%>/VecinoServlet?action=buscarIncidenciaPorNombre">
                    <div class="row justify-content-center align-items-center">
                        <!-- Busqueda por nombre de incidencia -->
                        <div class="col-md-3 mb-2">
                            <input type="text" class="form-control" id="filtroInput" placeholder="Buscar incidencia..." name="textoBuscarIncidencia"
                                   value="<%=textoBuscarIncidencia%>">
                        </div>
                        <div class="col-md-2 mb-2">
                            <input type="date" class="form-control" name="filtroFecha">
                        </div>
                        <div class="col-md-2 mb-2">
                            <select class="form-select" name="filtroTipo">
                                <option selected disabled>Tipo de Incidencia</option>
                                <option value="1">Seguridad Pública</option>
                                <option value="2">Emergencia Médica</option>
                                <option value="3">Infraestructura y Servicios Públicos</option>
                                <option value="4">Otro</option>
                            </select>
                        </div>
                        <div class="col-md-2 mb-2">
                            <select class="form-select" name="filtroEstado">
                                <option selected disabled>Estado</option>
                                <option value="1">Pendiente</option>
                                <option value="2">En curso</option>
                                <option value="3">Cancelado</option>
                                <option value="4">Rechazado</option>
                                <option value="5">Procesado</option>
                            </select>
                        </div>
                        <div class="col-md-1 mb-2">
                            <button class="btn btn-primary" type="submit">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                        <div class="col-md-2 mb-2">
                            <a type="reset" class="btn btn-primary" href="<%=request.getContextPath()%>/VecinoServlet?action=listarIncidencia">Limpiar</a>
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
                        <th scope="col">Hora</th>
                        <th scope="col">Tipo</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Ver</th>
                        <th scope="col">Editar</th>
                        <th scope="col">Borrar</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% if (lista != null) {
                        for (IncidenciasB incidencia : lista) { %>
                    <tr>
                        <td><%= incidencia.getNombreIncidencia() %></td>
                        <td><%= incidencia.getFecha() %></td>
                        <td><%= incidencia.getHora() %></td>
                        <td><%= incidencia.getTipoIncidencia() %></td>
                        <td><%= incidencia.getEstadoIncidencia() %></td>
                        <td>
                            <a href="<%=request.getContextPath()%>/VecinoServlet?action=verIncidencia&idIncidencia=<%= incidencia.getIdIncidencias() %>">
                                <button type="button" class="btn btn-primary m-2"><i class="fas fa-eye"></i></button>
                            </a>
                        </td>
                        <% if ("Pendiente".equals(incidencia.getEstadoIncidencia())) { %>
                        <td>
                            <a href="<%=request.getContextPath()%>/VecinoServlet?action=editarIncidencia&idIncidencia=<%= incidencia.getIdIncidencias() %>">
                                <button type="button" class="btn btn-success m-2"><i class="fas fa-pencil-alt"></i></button>
                            </a>
                        </td>
                        <td>
                            <button type="button" class="btn btn-danger m-2" onclick="confirmDelete(<%= incidencia.getIdIncidencias() %>)">
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </td>
                        <% } else { %>
                        <td><button type="button" class="btn btn-success m-2"><i class="fas fa-pencil-alt"></i></button></td>
                        <td><button type="button" class="btn btn-danger m-2"><i class="fas fa-trash-alt"></i></button></td>
                        <% } %>
                    </tr>
                    <% }
                    } else { %>
                    <tr>
                        <td colspan="7" class="text-center">No hay incidencias disponibles</td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
            <nav>
                <ul class="pagination">
                    <li class="page-item <%= paginaActual == 1 ? "disabled" : "" %>">
                        <a class="page-link" href="<%=request.getContextPath()%>/VecinoServlet?action=listarIncidencia&page=<%= paginaActual - 1 %>">Anterior</a>
                    </li>
                    <% if (totalPaginas > 0) { %>
                    <% for (int i = 1; i <= totalPaginas; i++) { %>
                    <li class="page-item <%= i == paginaActual ? "active" : "" %>">
                        <a class="page-link" href="<%=request.getContextPath()%>/VecinoServlet?action=listarIncidencia&page=<%= i %>"><%= i %></a>
                    </li>
                    <% } %>
                    <% } else { %>
                    <li class="page-item active">
                        <a class="page-link" href="#">1</a>
                    </li>
                    <% } %>
                    <li class="page-item <%= paginaActual == totalPaginas || totalPaginas == 0 ? "disabled" : "" %>">
                        <% if (paginaActual < totalPaginas && totalPaginas > 0) { %>
                        <a class="page-link" href="<%=request.getContextPath()%>/VecinoServlet?action=listarIncidencia&page=<%= paginaActual + 1 %>">Siguiente</a>
                        <% } else { %>
                        <span class="page-link">Siguiente</span>
                        <% } %>
                    </li>
                </ul>
            </nav>
        </div>

        <script>
            function viewFunction(idIncidencia) {
                window.location.href ='<%=request.getContextPath()%>/VecinoServlet?action=verIncidencia&id=' +idIncidencia;
            }

            function editFunction(idIncidencia) {
                window.location.href ='<%=request.getContextPath()%>/VecinoServlet?action=editarIncidencia&id=' + idIncidencia;
            }
        </script>
        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light rounded-top p-4">
                <div class="row">
                    <div class="col-12 col-sm-6 text-center text-sm-start">
                        &copy; <a >TelevecinosUnidos</a>, All Right Reserved.
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->
    </div>
</div>
<!-- Content End -->

<!-- JavaScript para SweetAlert -->
<script>
    function confirmDelete(eventId) {
        Swal.fire({
            title: 'Confirmar Eliminación',
            text: "¿Estás seguro de que deseas eliminar este incidente?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Sí, eliminarlo',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = '<%=request.getContextPath()%>/VecinoServlet?action=borrarIncidencia&idIncidencia=' + eventId;
            }
        });
    }
</script>

<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

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
