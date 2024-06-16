<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="org.example.televecinosunidos_appweb.model.beans.SerenazgoB" %>

<jsp:useBean id="lista" scope="request" type="ArrayList<SerenazgoB>"/><%-- Obtengo la lista de serenazgo--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Lista de serenazgos</title>
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



        <!-- Lista de serenazgo -->
        <div class="container text-center">
            <div id="Nombre del evento">
                <h1 style="text-align: center; margin-top:50px;margin-bottom:50px;"><b></b></h1>
            </div>
        </div>
        <div style="background-color: #f8f9fa; padding: 10px; align-items: center;">
            <!-- Filtro -->
            <div style="background-color: #FFB703; padding: 20px; border: 1px solid #ccc; border-radius: 5px;">
                <div class="row justify-content-center align-items-center">
                    <div class="col-md-5 mb-2">
                        <input type="text" class="form-control" id="filtroInput" placeholder="Buscar..." onkeyup="filtrar()">
                    </div>
                    <div class="col-md-2 mb-2">
                        <select id="filtroCategoria" class="form-select" onchange="filtrar()">
                            <option selected value="">Turno</option>
                            <option value="Semanal">Diurno</option>
                            <option value="Dos veces por semana">Nocturno</option>
                        </select>
                    </div>
                    <div class="col-md-2 mb-2">
                        <select id="filtroCategoria" class="form-select" onchange="filtrar()">
                            <option selected value="">Tipo</option>
                            <option value="Semanal">Canino</option>
                            <option value="Bicicleta">Bicicleta</option>
                            <option value="Vehiculo">Vehiculo</option>
                            <option value="A pie<">A pie</option>
                        </select>
                    </div>


                </div>
            </div>

            <div class="bg-light rounded h-100 p-4" style="font-weight: bold;">
                <script>
                    function crearEvento() {
                        window.location.href = 'creacionEvento.html';
                    }
                </script>

                <div class="table-responsive">
                    <table id="eventosTable" class="table" style="background-color: transparent;">
                        <thead>
                        <tr>
                            <th scope="col">Nombre y Apellido</th>
                            <th scope="col">Turno</th>
                            <th scope="col">Tipo</th>
                            <th scope="col">DNI</th>
                            <th scope="col">Telefono</th>
                            <th scope="col">Enviar correo</th>
                            <th scope="col">Banear</th>
                            <th scope="col">ver Detalle</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% for(SerenazgoB serenazgoB : lista){ %>
                        <tr>
                            <td><%=serenazgoB.getUsuario().getNombre() + " " + serenazgoB.getUsuario().getApellido()%></td>
                            <td><%=serenazgoB.getTurnoSerenazgoStr() %></td>
                            <td><%=serenazgoB.getTipoSerenazgoStr() %></td>
                            <td><%=serenazgoB.getUsuario().getDni() %></td>
                            <td><%=serenazgoB.getNumTelefono() %></td>
                            <td><a href="<%=request.getContextPath()%>/*?action=verSerenazgo&idSerenazgo=<%=serenazgoB.getIdSerenazgo()%>"><button type="button" class="btn btn-success m-2"><i class="fas fa-envelope"></i></button></a></td>
                            <td><a href="<%=request.getContextPath()%>/*?action=verSerenazgo&idSerenazgo=<%=serenazgoB.getIdSerenazgo()%>"><button type="button" class="btn btn-danger m-2" ><i class="fas fa-trash-alt"></i></button></a></td>
                            <td><a href="<%=request.getContextPath()%>/AdministradorServlet?action=verSerenazgo&idSerenazgo=<%=serenazgoB.getIdSerenazgo()%>"><button type="button" class="btn btn-info m-2"><i class="fas fa-eye"></i></button></a></td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Filtro
        <div id="Barra-Filtro">
            <script>
                function filtrar() {
                    var input = document.getElementById('filtroInput').value.toUpperCase();
                    var categoria = document.getElementById('filtroCategoria').value.toUpperCase();
                    var estado = document.getElementById('filtroEstado').value.toUpperCase();
                    var table = document.getElementById('eventosTable');
                    var tr = table.getElementsByTagName('tr');

                    for (var i = 1; i < tr.length; i++) {
                        var tdNombre = tr[i].getElementsByTagName('td')[0];
                        var tdEstado = tr[i].getElementsByTagName('td')[2];
                        var tdFrecuencia = tr[i].getElementsByTagName('td')[3];
                        if (tdNombre && tdEstado && tdFrecuencia) {
                            var txtValueNombre = tdNombre.textContent || tdNombre.innerText;
                            var txtValueEstado = tdEstado.textContent || tdEstado.innerText;
                            var txtValueFrecuencia = tdFrecuencia.textContent || tdFrecuencia.innerText;
                            var visible = true;

                            if (input && txtValueNombre.toUpperCase().indexOf(input) === -1) {
                                visible = false;
                            }
                            if (estado && txtValueEstado.toUpperCase().indexOf(estado) === -1) {
                                visible = false;
                            }
                            if (categoria && txtValueFrecuencia.toUpperCase().indexOf(categoria) === -1) {
                                visible = false;
                            }
                            tr[i].style.display = visible ? '' : 'none';
                        }
                    }
                }
            </script>
        </div>
        -->

        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light rounded-top p-4">
                <div class="row">
                    <div class="col-12 col-sm-6 text-center text-sm-start">
                        &copy; <a href="#">Televecinos</a>, All Right Reserved.
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->
    </div>
    <!-- Content End -->




    <script>
        $(document).ready(function(){
            $('.row').slick({
                infinite: true,
                slidesToShow: 3,
                slidesToScroll: 1
            });
        })
        ;</script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick-theme.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.min.js"></script>
</div>


<!-- Content End -->

<!-- Footer Start -->
<div class="container-fluid pt-4 px-4">
    <div class="bg-light rounded-top p-4">
        <div class="row">
            <div class="col-12 col-sm-6 text-center text-sm-start">
                &copy; <a href="#">Televecinos Unidos</a>, All Right Reserved.
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