<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/6aca7755ca.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style_index.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title>¿Olvidaste tu contraseña? | Televecinos Unidos</title>
    <style>
        body {
            background-image: url('img/fondoPantalla.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
            font-family: 'Roboto', sans-serif;
        }
    </style>
</head>

<body>
<div class="container d-flex justify-content-center align-items-center min-vh-100">
    <div class="row border rounded-5 p-3 shadow box-area" style="max-width: 800px; width: 100%;">
        <div class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column">
            <div class="featured-image mb-3" style="width: 200px; height: 200px; display: flex; justify-content: center; align-items: center;">
                <img src="img/logoTele.jpg" class="rounded-circle ms-3" style="max-width: 100%; max-height: 100%;">
            </div>
        </div>

        <div class="col-md-6 right-box">
            <form method="post" action="<%=request.getContextPath()%>/LoginServlet?action=forgotPassword" id="loginForm">
                <div class="row align-items-center">
                    <div class="welcome-text mb-4 text-center">
                        <h2>¿olvidaste tu contraseña?</h2>
                        <p><b>Ingresa tu correo gmail para recibir intstrucciones</b></p>
                    </div>
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
                            icon: 'success',
                            title: 'Registro Exitoso',
                            text: '<%= request.getParameter("success") %>',
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = "<%=request.getContextPath()%>/LoginServlet";
                            }
                        });
                    </script>
                    <% } %>
                    <div class="input-group mb-3">
                        <input type="email" id="email" class="form-control form-control-lg bg-light fs-6" name="correo" placeholder="Dirección gmail">
                        <span class="input-group-text"><i class="fa-solid fa-envelope"></i></span>
                    </div>

                    <div class="input-group mb-3">
                        <button type="submit" id="loginButton" class="btn btn-lg btn-primary w-100 fs-6">Enviar correo</button>
                    </div>
                </div>
            </form>
            <div class="row text-center">
                <small><a href="<%=request.getContextPath()%>/LoginServlet" class="text-link-white" style="text-decoration: underline;"><b>Inicia sesión aquí</b></a></small>
            </div>
        </div>
    </div>
</div>

<script>
    // Optional: Additional JavaScript if needed
</script>
</body>
</html>
