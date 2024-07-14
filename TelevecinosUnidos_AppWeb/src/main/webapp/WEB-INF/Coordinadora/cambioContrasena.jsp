<%@ page import="org.example.televecinosunidos_appweb.model.beans.UsuarioB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuarioLogueado" scope="session" type="UsuarioB" class="org.example.televecinosunidos_appweb.model.beans.UsuarioB" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Mi perfil</title>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style_vec.css" rel="stylesheet">

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

        .regresar {
            background-color: #efdb04;
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

    <jsp:include page="../includes/barraLateralCoordinador.jsp"></jsp:include>
    <!-- Sidebar End -->

    <!-- Content Start -->
    <div id="navbar" class="content">
        <!-- Navbar Start -->
        <jsp:include page="../includes/navbarCoordinador.jsp"></jsp:include>
        <!-- Navbar End -->

        <!---Content--->

        <div class="container-fluid d-flex justify-content-center align-items-center vh-100">
            <div class="container text-center">
                <%if(usuarioLogueado.getGenero()==1){%>
                <img src="img/coordinador.jpg" class="img-fluid mb-3" alt="Responsive image" width="200">
                <%}else{%>
                <img src="img/coordinadora.jpg" class="img-fluid mb-3" alt="Responsive image" width="200">
                <%}%>

                <% if(request.getAttribute("err") != null) { %>
                <script>
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: '<%= request.getAttribute("err") %>',
                    });
                </script>
                <% } %>
                <% if(session.getAttribute("success") != null) { %>
                <script>
                    Swal.fire({
                        icon: 'success',
                        title: 'Cambio de contraseña exitoso',
                        text: '<%= session.getAttribute("success") %>',
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = "<%=request.getContextPath()%>/CoordinadorServlet?action=perfilC";
                        }
                    });
                </script>
                <% session.removeAttribute("success"); // Limpiar la sesión después de mostrar el SweetAlert %>
                <% } %>
                <div class="container">
                    <h3 class="text-center">Cambiar contraseña</h3>
                    <label class="form-label"><b>Por favor ingresa tu nueva contraseña y revisa en el apartado inferior las especificaciones que esta debe tener</b></label>
                    <form method="post" action="<%= request.getContextPath() %>/CoordinadorServlet?action=cambiarContrasena">
                        <div class="mb-3">
                            <label for="nuevaContrasena" class="form-label">Nueva Contraseña (*)</label>
                            <input type="password" class="form-control" id="nuevaContrasena" name="nuevaContrasena" required>
                        </div>
                        <div class="mb-3">
                            <label for="confirmarContrasena" class="form-label">Confirmar Contraseña (*)</label>
                            <input type="password" class="form-control" id="confirmarContrasena" name="confirmarContrasena" required>
                        </div>
                        <div class="mb-3">
                            <small class="text-muted">Recuerda que tu nueva contraseña debe contener 8 caracteres como mínimo, incluir al menos un número y una letra, sin espacios vacíos ni caracteres especiales.</small>
                        </div>
                        <button type="submit" class="button alert-success">Guardar Cambios</button>
                    </form>
                    <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=contrasenaActual"><button class="button alert-danger">Regresar</button></a>
                </div>
            </div>
        </div>
    </div>
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
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick-theme.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>