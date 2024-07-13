<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="org.example.televecinosunidos_appweb.model.beans.UsuarioB" %>
<jsp:useBean id="lista" scope="request" type="ArrayList<org.example.televecinosunidos_appweb.model.beans.UsuarioB>"/>
<jsp:useBean id="textoBusqueda" scope="request" type="java.lang.String" class="java.lang.String"/>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Lista de vecinos</title>
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
    <link href="css/style_popup.css" rel="stylesheet">


    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
    <jsp:include page="../includes/barraLateralAdministrador.jsp"></jsp:include>
    <!-- BARRA AZUL DE LA IZQUIERDA FINAL -->

    <!-- Content Start -->
    <div class="content">
        <!-- PARTE SUPERIOR INICIO -->
        <jsp:include page="../includes/navbarAdministrador.jsp"></jsp:include>
        <!-- PARTE SUPERIOR FINAL -->

        <!-- Bootstrap JS dependencies -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <!-- Bootstrap JS with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Bootstrap JS and dependencies (Popper.js) -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>
        <% if(request.getParameter("success") != null) { %>
        <script>
            Swal.fire({
                icon: "success",
                title: '<%= request.getParameter("success") %>',
                showConfirmButton: false,
                timer: 1700
            })
        </script>
        <% } %>


        <div class="container text-center">
            <div id="Nombre del evento">
                <h1 style="text-align: center; margin-top:50px;margin-bottom:50px;"><b></b></h1>
            </div>
        </div>
        <!-- Fin de iamgen estatica -->
        <div style="background-color: #f8f9fa; padding: 10px; align-items: center;">
            <!-- Filtro -->
            <div style="background-color: #FFB703; padding: 20px; border: 1px solid #ccc; border-radius: 5px;">
                <div class="row justify-content-center align-items-center">
                    <form method="post" action="<%=request.getContextPath()%>/AdministradorServlet?action=buscarVecinoPorNombre">
                        <div class="col-md-7 mb-2">
                            <div class="input-group">
                                <input type="text" class="form-control" id="filtroInput" placeholder="Buscar vecino..." name="textoBuscar" value="<%=textoBusqueda%>"/>
                                <button class="btn btn-primary" type="submit">
                                    <i class="fas fa-search"></i> </button>
                                <a class="btn btn-secondary" href="<%=request.getContextPath()%>/AdministradorServlet?action=listaVecinos_A">
                                    Limpiar
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>




            <div class="bg-light rounded h-100 p-4" style="font-weight: bold;">

                <div class="table-responsive">
                    <table id="eventosTable" class="table" style="background-color: transparent;">
                        <thead>
                        <tr>
                            <th scope="col">Nombre y Apellido</th>
                            <th scope="col">Direccion</th>
                            <th scope="col">DNI</th>
                            <!--<th scope="col">Enviar correo</th>-->
                            <th scope="col">Banear</th>
                            <th scope="col">ver Detalle</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% for(UsuarioB usuarioB : lista){ %>
                        <tr>
                            <td><%=usuarioB.getNombre() + " " + usuarioB.getApellido()%></td>
                            <td><%=usuarioB.getDireccion() %></td>
                            <td><%=usuarioB.getDni() %></td>
                            <!--<td><a href="<%=request.getContextPath()%>/*?action=verSerenazgo&idSerenazgo=<%=usuarioB.getIdUsuario()%>"><button type="button" class="btn btn-success m-2"><i class="fas fa-envelope"></i></button></a></td>-->
                            <td>
                                <!--<a href="<%=request.getContextPath()%>/AdministradorServlet?action=banearVecino&idVecino=<%=usuarioB.getIdUsuario()%>"><button type="button" class="btn btn-danger m-2" ><i class="fas fa-ban"></i></button></a>-->
                                <button type="button" class="btn btn-danger m-2" onclick="confirmarBanear(<%=usuarioB.getIdUsuario()%>)">
                                    <i class="fas fa-ban"></i>
                                </button>
                            </td>
                            <td><a href="<%=request.getContextPath()%>/AdministradorServlet?action=DetalleVecinos_A&idVecino=<%=usuarioB.getIdUsuario()%>"><button type="button" class="btn btn-info m-2"><i class="fas fa-eye"></i></button></a></td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>

                    <!-- Botones para paginación -->
                    <%
                        int paginaActual = (int) request.getAttribute("paginaActual");
                        int totalPaginas = (int) request.getAttribute("totalPaginas");
                    %>
                    <nav>
                        <ul class="pagination">
                            <li class="page-item <%= paginaActual == 1 ? "disabled" : "" %>">
                                <a class="page-link" href="<%=request.getContextPath()%>/AdministradorServlet?action=listaVecinos_A&page=<%= paginaActual - 1 %>">Anterior</a>
                            </li>
                            <% if (totalPaginas > 0) { %>
                            <% for (int i = 1; i <= totalPaginas; i++) { %>
                            <li class="page-item <%= i == paginaActual ? "active" : "" %>">
                                <a class="page-link" href="<%=request.getContextPath()%>/AdministradorServlet?action=listaVecinos_A&page=<%= i %>"><%= i %></a>
                            </li>
                            <% } %>
                            <% } else { %>
                            <li class="page-item active">
                                <a class="page-link" href="#">1</a>
                            </li>
                            <% } %>
                            <li class="page-item <%= paginaActual == totalPaginas || totalPaginas == 0 ? "disabled" : "" %>">
                                <% if (paginaActual < totalPaginas && totalPaginas > 0) { %>
                                <a class="page-link" href="<%=request.getContextPath()%>/AdministradorServlet?action=listaVecinos_A&page=<%= paginaActual + 1 %>">Siguiente</a>
                                <% } else { %>
                                <span class="page-link">Siguiente</span>
                                <% } %>
                            </li>
                        </ul>
                    </nav>

                </div>
            </div>
        </div>

        <!-- jQuery (opcional si necesitas usar funciones de jQuery específicas) -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Bootstrap 5 JS with Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Tempus Dominus JS (si necesario)
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
        <script>
            function correoFunction(Id) {
                window.location.href ='<%=request.getContextPath()%>/*?action=verSerenazgo&idSerenazgo=' +Id;
            }
            function  banFunction(Id){
                window.location.href ='<%=request.getContextPath()%>/AdministradorServlet?action=banearVecino&idVecino=' +Id;
            }
            function detalleFunction(Id){
                window.location.href ='<%=request.getContextPath()%>/AdministradorServlet?action=DetalleVecinos_A&idVecino=' +Id;
            }
        </script>-->
        <!-- Content End -->

        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    function confirmarBanear(idUsuario) {
        const swalWithBootstrapButtons = Swal.mixin({
            customClass: {
                confirmButton: 'btn btn-success',
                cancelButton: 'btn btn-danger'
            },
            buttonsStyling: false
        });

        swalWithBootstrapButtons.fire({
            title: '¿Estás seguro que deseas banear al usuario?',
            text: 'Podrás desbanearlo luego',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: '¡Sí, quiero banearlo!',
            cancelButtonText: '¡No, cancelar!',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {

                swalWithBootstrapButtons.fire({
                    title: 'Baneado',
                    text: 'El usuario ha sido baneado exitosamente',
                    icon: 'success'
                }).then(() => {

                    window.location.href = '<%= request.getContextPath() %>/AdministradorServlet?action=banearVecino&idVecino=' + idUsuario;
                });
            } else if (result.dismiss === Swal.DismissReason.cancel) {
                swalWithBootstrapButtons.fire({
                    title: 'Baneo cancelado',
                    text: 'No se ha baneado al usuario',
                    icon: 'error'
                });
            }
        });
    }
</script>


<!-- Template Javascript -->
<script src="js/main.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {

        function desactivarStickyTop() {
            navbar.classList.remove('sticky-top');
        }

        function activarStickyTop() {
            navbar.classList.add('sticky-top');
        }
        document.addEventListener('click', function(event) {
            if (event.target.classList.contains('btn-banear')) {
                desactivarStickyTop();
                var popup = event.target.nextElementSibling;
                popup.style.display = 'block';
            }
        });

        document.addEventListener('click', function(event) {
            if (event.target.classList.contains('close-btn')) {
                activarStickyTop();
                var popup = event.target.closest('.popup1');
                popup.style.display = 'none';
            }
        });
    });

</script>
</body>

</html>