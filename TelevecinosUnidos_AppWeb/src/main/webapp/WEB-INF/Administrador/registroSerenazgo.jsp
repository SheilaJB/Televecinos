<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Registar nuevo serenazgo</title>
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
    <style>

        .popup {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }

        .popup_contenido {
            background-color: white;
            width: 50%;
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            text-align: center;
            position: relative;
        }

        .close-btn {
            position: absolute;
            top: 5px;
            right: 10px;
            font-size: 24px;
            cursor: pointer;
            color: rgb(0, 0, 0);
        }

    </style>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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




        <!-- Inicio de Contenido -->
        <div style="background-color: #f8f9fa; padding: 20px; align-items: center;">
            <div class="container text-center">
                <img src="img/serenazgo.jpg" class="img-fluid mb-3" alt="Imagen Serenazgo" width="200">


                <% if(request.getParameter("err") != null) { %>
                <script>
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: '<%= request.getParameter("err") %>',
                    });
                </script>
                <% } %>
                <% if(request.getParameter("success") != null) { %>
                    <script>
                        Swal.fire({
                            icon: "success",
                            title: '<%= request.getParameter("success") %>',
                            showConfirmButton: false,
                            timer: 1700
                        }).then(() => {
                            window.location.href = '<%= request.getContextPath() %>/AdministradorServlet?action=listaSerenazgo_A';
                        });
                    </script>
                <% } %>


                <!-- Formulario -->
                <form id="serenazgoForm" method="post" action="<%=request.getContextPath()%>/AdministradorServlet?action=registrarSerenazgo">
                    <label for="nombre" class="form-label" style="color:#023047;"><b>Nombre del serenazgo</b></label>
                    <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Ingrese el nombre del serenazgo">

                    <label for="apellido" class="form-label" style="color:#023047;"><b>Apellido del serenazgo</b></label>
                    <input type="text" id="apellido" name="apellido" class="form-control" placeholder="Ingrese el apellido del serenazgo">

                    <label for="dni" class="form-label" style="color:#023047;"><b>DNI del serenazgo</b></label>
                    <input type="text" id="dni" name="dni" class="form-control" placeholder="Ingrese el DNI del serenazgo">

                    <label for="direccion" class="form-label" style="color:#023047;"><b>Direccion del serenazgo</b></label>
                    <input type="text" id="direccion" name="direccion" class="form-control" placeholder="Ingrese la direccion del serenazgo">

                    <label for="correo" class="form-label" style="color:#023047;"><b>Correo</b></label>
                    <input type="email" id="correo" name="correo" class="form-control" placeholder="Ingrese el correo del serenazgo">


                    <label for="numTelefono" class="form-label" style="color:#023047;"><b>Número de telefono</b></label>
                    <input type="text" id="numTelefono" name="numTelefono" class="form-control" placeholder="Ingrese el numero de telefono del serenazgo">

                    <label for="fechaNacimiento" class="form-label" style="color:#023047;"><b>Fecha de nacimiento</b></label>
                    <input type="date" id="fechaNacimiento" name="fechaNacimiento" class="form-control" placeholder="Ingrese la fecha de nacimiento del serenazgo">


                    <label for="turno" class="form-label" style="color:#023047;"><b>Elegir turno:</b></label>
                    <select id="turno" class="form-select mb-3" name="turno" aria-label="Seleccione un turno">
                        <option value ="" selected>Seleccione un turno:</option>
                        <option value="1">Diurno</option>
                        <option value="2">Nocturno</option>
                    </select>



                    <label for="tipo" class="form-label" style="color:#023047;"><b>Tipo de serenazgo:</b></label>
                    <select id="tipo" class="form-select mb-3" name="tipo" aria-label="Seleccione un tipo">
                        <option value ="" selected>Seleccione un tipo:</option>
                        <option value="1">Bicicleta</option>
                        <option value="2">A pie</option>
                        <option value="3">Canino</option>
                        <option value="4">Vehículo</option>
                    </select>

                    <div class="form-group" style = "padding-top: 2%">
                        <div class="m-n2" style="padding-bottom: 5%; ">
                            <button type="button" class="btn btn-warning m-2 text-white" onclick="regresar()">Regresar</button>

                            <button type="submit" class="btn btn-success m-2">Registrar</button>
                        </div>
                    </div>

                    <script>
                        function regresar(){
                            window.location.href="<%=request.getContextPath()%>/AdministradorServlet?action=listaSerenazgo_A";
                        }
                    </script>




                </form>


            </div>
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


    <!-- Botón de Volver Arriba -->
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
<script src="js/custom.js"></script>

<script>
    const openPopupBtn = document.getElementById('openPopupBtn');
    const closePopupBtn = document.getElementById('closePopupBtn');
    const navbar = document.getElementById('navbar');
    const popup = document.getElementById('popup');

    openPopupBtn.addEventListener('click', () => {
        popup.style.display = 'block';
    });

    closePopupBtn.addEventListener('click', () => {
        popup.style.display = 'none';
    });
    function desactivarStickyTop() {
        navbar.classList.remove('sticky-top');
    }

    function activarStickyTop() {
        navbar.classList.add('sticky-top');
    }

    document.getElementById('openPopupBtn').addEventListener('click', function() {
        desactivarStickyTop();
        popup.style.display = 'block';
    });

    document.getElementById('closePopupBtn').addEventListener('click', function() {
        activarStickyTop();
        popup.style.display = 'none';
    });


</script>




</body>
</html>
