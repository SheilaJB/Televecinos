<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/6aca7755ca.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="style.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title>Login | Televecinos Unidos</title>
</head>
<body>
<div class="container d-flex justify-content-center align-items-center min-vh-100">
    <div class="row border rounded-5 p-3 bg-white shadow box-area">
        <div class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column">
            <div class="featured-image mb-3" style="width: 250px; height: 250px; display: flex; justify-content: center; align-items: center;">
                <img src="img/logoTele.jpg" class="rounded-circle ms-3" style="max-width: 150%; max-height: 150%;">
            </div>
        </div>

        <div class="col-md-6 right-box">
            <form method="post" action="<%=request.getContextPath()%>/LoginServlet" id="loginForm">
                <div class="row align-items-center">
                    <div class="welcome-text mb-4">
                        <h2>Bienvenido</h2>
                        <p>Inicia sesión con tu cuenta</p>
                    </div>
                    <%-- Código JSP para mostrar un mensaje de error si el atributo "err" está presente en la solicitud --%>
                    <% if(request.getAttribute("err") != null) { %>
                    <script>
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: 'Correo o contraseña inválidos',
                        });
                    </script>
                    <% } %>
                    <%-- Código JSP para mostrar un mensaje de éxito si se establece el atributo "exito" en la solicitud --%>
                    <% if (request.getAttribute("exito") != null) { %>
                    <script>
                        alert("Ingreso correcto");
                    </script>
                    <% } %>
                    <div class="input-group mb-3">
                        <input type="email" id="email" class="form-control form-control-lg bg-light fs-6" name="correo" placeholder="Dirección gmail">
                        <span class="input-group-text"><i class="fa-solid fa-envelope"></i></span>
                    </div>
                    <div class="input-group mb-1">
                        <input type="password" id="password" class="form-control form-control-lg bg-light fs-6" name="contrasena" placeholder="Contraseña">
                        <span class="input-group-text"><i class="fa-solid fa-lock"></i></span>
                    </div>
                    <div class="input-group mb-5 d-flex justify-content-between">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="formCheck">
                            <label for="formCheck" class="form-check-label text-secondary"><small>Recuérdame</small></label>
                        </div>
                        <div class="forgot">
                            <small><a href="olvidasteContrasena.html">¿Olvidaste tu contraseña?</a></small>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <button type="submit" id="loginButton" class="btn btn-lg btn-primary w-100 fs-6">Iniciar sesión</button>
                    </div>
                </div>
            </form>
            <div class="row" align="center">
                <small>¿No tienes una cuenta?</small>
                <small><a href="registro.html">Regístrate aquí</a></small>
            </div>
            <div class="social-icons mt-3">
                <a href="https://twitter.com/MuniSanMiguelPE"><i class="fab fa-twitter"></i></a>
                <a href="https://www.facebook.com/municipalidadsanmiguel/?locale=es_LA"><i class="fab fa-facebook-f"></i></a>
                <a href="https://www.instagram.com/municipalidadsanmiguel/"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
    </div>
</div>

<script>
    // Optional: Additional JavaScript if needed
</script>
</body>
</html>
