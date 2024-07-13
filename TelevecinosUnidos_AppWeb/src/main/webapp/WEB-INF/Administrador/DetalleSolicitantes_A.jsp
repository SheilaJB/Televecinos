<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="vecino" scope="request" type="org.example.televecinosunidos_appweb.model.beans.UsuarioB"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Detalles del vecino</title>
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

        .container {
            width: 80%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .bar {
            position: relative;
            background-color: #064668;
            height: 40px;
            line-height: 50px;
            text-align: center;
            color: #ffffff;
            margin-bottom: 15px;
            border-radius: 10px;
            padding: 0 5%; /* Utilizamos porcentaje para hacerlo responsive */
            max-width: 100%; /* Limitamos el ancho máximo para que no se desborde en pantallas pequeñas */
        }
        .bar::before {
            content: attr(data-label); /* Inserta el contenido del atributo data-label */
            position: absolute;
            top: -15px; /* Ajusta la posición verticalmente */
            left: 0;
            width: 100%;
            color: #29b2e8;
            font-size: 11px;
            font-weight: bold;
        }

        /* Estilo adicional para hacer que la barra ocupe el ancho completo en pantallas pequeñas */
        @media only screen and (max-width: 600px) {
            .bar {
                padding: 0;
            }
        }

        /* Estilos para los botones */
        .button {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        /* Colores para los botones */
        .regresar {
            background-color: #efdb04;
            color: #fff;
        }

        .convertCoordinadora {
            background-color: #27ae60;
            color: #fff;
        }

        .banear {
            background-color: #e74c3c;
            color: #fff;
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



        <!-- Fin de iamgen estatica -->
        <div style="background-color: #f8f9fa; padding: 20px; align-items: center;">


            <div class="container text-center">
                <%if(vecino.getGenero()==1){%>
                    <img src="img/user.jpg" class="img-fluid mb-3" alt="Responsive image" width="200">
                <%}else{%>
                    <img src="img/user.png" class="img-fluid mb-3" alt="Responsive image" width="200">
                <%}%>

                <div class="bar" data-label="ID"><%=vecino.getIdUsuario()%></div>
                <div class="bar" data-label="Nombre"><%=vecino.getNombre()%></div>
                <div class="bar" data-label="Apellido"><%=vecino.getApellido()%></div>
                <div class="bar" data-label="DNI"><%=vecino.getDni()%></div>
                <div class="bar" data-label="Dirección"><%=vecino.getDireccion()%></div>
                <div class="bar" data-label="Correo"><%=vecino.getCorreo()%></div>
                <a href="<%=request.getContextPath()%>/AdministradorServlet?action=nuevasSolicitudes_A"><button class="button regresar">Regresar</button></a>


                <!--<a href="<%=request.getContextPath()%>/AdministradorServlet?action=banearVecino&idVecino=<%=vecino.getIdUsuario()%>"><button class="button banear btn-banear">Banear</button></a>-->



            </div>

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
