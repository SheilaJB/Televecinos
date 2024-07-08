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
    <title>Forgot Password | Televecinos Unidos</title>
</head>
<body>
<!----------------------- Pantalla principal -------------------------->
<div class="container d-flex justify-content-center align-items-center min-vh-100">
    <!----------------------- Login  -------------------------->
    <div class="row border rounded-5 p-3 bg-white shadow box-area">
        <!--------------------------- Cuadro izquierda ----------------------------->
        <div class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column left-box" style="background: #f8f8fa25;">
            <div class="featured-image mb-3" style="width: 250px; height: 250px; display: flex; justify-content: center; align-items: center;">
                <img src="/img/logo.jpg" class="rounded-circle ms-3" style="max-width: 100%; max-height: 100%;">
            </div>
        </div>
        <!-------------------- ------ Cuadro derecha ---------------------------->
        <div class="col-md-6 right-box">
            <div class="row align-items-center">
                <div class="header-text mb-4 text-center"> <!-- Agregado el texto-center -->
                    <h2>¿Olvidaste tu contraseña?</h2>
                    <p>Ingresa tu dirección de correo electrónico a continuación y te enviaremos instrucciones sobre cómo cambiar tu contraseña.</p>
                </div>
                <div class="input-group mb-3">
                    <input type="email" id = "email"class="form-control form-control-lg bg-light fs-6" placeholder="Dirección de correo electrónico">
                    <span class="input-group-text"><i class="fa-solid fa-envelope"></i></span>
                </div>
                <div class="input-group mb-3">
                    <button id="sendButton" class="btn btn-lg btn-primary w-100 fs-6">Enviar</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function validarCorreo(email) {
        var expReg = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/;
        var esValido = expReg.test(email);
        if (!esValido) {
            alert("El correo electrónico NO es válido");
        }
        return esValido;
    }
    window.onload = function() {
        var emailField = document.getElementById('email');
        var sendButton = document.getElementById('sendButton');

        function updateSendButtonState() {
            sendButton.disabled = emailField.value === '';
        }

        emailField.addEventListener('input', updateSendButtonState);

        updateSendButtonState();

        sendButton.addEventListener('click', function(event) {
            event.preventDefault(); // Previene la acción por defecto del botón de formulario

            if(emailField.value === '') {
                alert('Por favor, llene el campo de correo electrónico.');
                return;
            }

            if (!validarCorreo(emailField.value)) {
                // Si el correo no es válido, no continuamos con el inicio de sesión
                return;
            }
            // Si todo está correcto, podemos continuar con la lógica de inicio de sesión
            // Por ejemplo, aquí se podría enviar la información a un servidor
            alert('¡Correo enviado de manera exitosa! Revise su bandeja');
        });
    }
</script>
</body>
</html>
