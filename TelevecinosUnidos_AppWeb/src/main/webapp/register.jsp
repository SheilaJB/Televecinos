<%@ page import="org.example.televecinosunidos_appweb.model.beans.UsuarioB" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Registro | Televecinos Unidos</title>
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
            <form method="post" action="<%=request.getContextPath()%>/LoginServlet?action=register" id="registerForm">
                <div class="row align-items-center">
                    <div class="welcome-text mb-4 text-center">
                        <h2>Registro de Usuario</h2>
                        <p><b>Crea tu cuenta</b></p>
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
                        <input type="text" id="nombre" class="form-control form-control-lg bg-light fs-6" name="nombre" placeholder="Nombre" required>
                        <span class="input-group-text"><i class="fa-solid fa-user"></i></span>
                    </div>
                    <div class="input-group mb-3">
                        <input type="text" id="apellido" class="form-control form-control-lg bg-light fs-6" name="apellido" placeholder="Apellido" required>
                        <span class="input-group-text"><i class="fa-solid fa-user"></i></span>
                    </div>
                    <div class="input-group mb-3">
                        <input type="text" id="dni" class="form-control form-control-lg bg-light fs-6" name="dni" placeholder="DNI" required>
                        <span class="input-group-text"><i class="fa-solid fa-id-card"></i></span>
                    </div>
                    <div class="input-group mb-3">
                        <input type="text" id="direccion" class="form-control form-control-lg bg-light fs-6" name="direccion" placeholder="Dirección" required>
                        <span class="input-group-text"><i class="fa-solid fa-map-marker-alt"></i></span>
                    </div>
                    <div class="input-group mb-3">
                        <select id="urbanizacion" class="form-control form-control-lg bg-light fs-6" name="urbanizacion" required>
                            <option value="" selected>Urbanización en la que reside</option>
                            <%
                                ArrayList<UsuarioB> urbanizaciones = (ArrayList<UsuarioB>) request.getAttribute("urbanizaciones");
                                if (urbanizaciones != null && !urbanizaciones.isEmpty()) {
                                    for (UsuarioB urbanizacion : urbanizaciones) {
                            %>
                            <option value="<%= urbanizacion.getUrbanizacion_idUrbanizacion() %>"><%= urbanizacion.getUrbanizacionString() %></option>
                            <%
                                }
                            } else {
                            %>
                            <option value="">No hay urbanizaciones disponibles</option>
                            <% } %>
                        </select>
                        <span class="input-group-text"><i class="fa-solid fa-city"></i></span>
                    </div>
                    <div class="input-group mb-3">
                        <input type="email" id="correo" class="form-control form-control-lg bg-light fs-6" name="correo" placeholder="Correo (Gmail)" required>
                        <span class="input-group-text"><i class="fa-solid fa-envelope"></i></span>
                    </div>
                    <div class="input-group mb-3">
                        <button type="submit" id="registerButton" class="btn btn-lg btn-primary w-100 fs-6">Registrar</button>
                    </div>
                </div>
            </form>
            <div class="row text-center">
                <small class="text-white"><b>¿Ya tienes una cuenta?</b></small>
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
