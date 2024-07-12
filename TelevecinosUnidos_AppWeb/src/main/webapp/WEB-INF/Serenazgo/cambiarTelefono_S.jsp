<%@ page import="org.example.televecinosunidos_appweb.model.beans.UsuarioB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuarioLogueado" scope="session" type="UsuarioB" class="org.example.televecinosunidos_appweb.model.beans.UsuarioB" />
<jsp:useBean id="telefonoSereno" scope="request" type="java.lang.String" class="java.lang.String" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Cambiar telefono</title>
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

        .button.alert-danger {
            background-color: #dc3545;
            color: white;
        }

        .button.alert-success {
            background-color: #28a745;
            color: white;
        }

        .button:hover {
            opacity: 0.8;
        }

        .text-muted {
            font-size: 12px;
            color: #ff0000;
            font-weight: bold;
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

        <!---Content--->
        <div class="container-fluid d-flex justify-content-center align-items-center vh-100">
            <div class="container text-center">
                <img src="img/serenazgo.jpg" class="img-fluid mb-3" alt="Responsive image" width="200">
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
                        title: 'Cambio de teléfono exitoso',
                        text: '<%= session.getAttribute("success") %>',
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = "<%=request.getContextPath()%>/SerenazgoServlet?action=perfil_S";
                        }
                    });
                </script>
                <% session.removeAttribute("success"); // Limpiar la sesión después de mostrar el SweetAlert %>
                <% } %>
                <div class="container">
                    <form method="post" action="<%= request.getContextPath() %>/SerenazgoServlet?action=cambiarTelefono">
                        <div class="mb-3">
                            <label for="nuevaContrasena" class="form-label">Telefono actual: <%=telefonoSereno%></label>
                            <input type="text" class="form-control" id="nuevaContrasena" name="nuevoTelefono" placeholder="Nuevo telefono:" required>
                        </div>
                        <div class="mb-3">
                            <small >Debes llenar el campo y tu teléfono contener 9 dígitos</small>
                        </div>
                        <button type="submit" class="button alert-success">Guardar Cambios</button>
                    </form>
                    <a href="<%=request.getContextPath()%>/SerenazgoServlet?action=perfil_S"><button class="button alert-danger">Regresar</button></a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- Libraries JS -->
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="lib/tempusdominus/js/moment.min.js"></script>
<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Custom Scripts -->
<script src="js/main.js"></script>
<script src="js/script.js"></script>

</body>

</html>
