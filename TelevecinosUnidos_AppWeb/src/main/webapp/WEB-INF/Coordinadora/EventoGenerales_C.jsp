<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Eventos-Coordinador</title>
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


    <!-- Sidebar Start -->
    <div class="sidebar pe-4 pb-3" style="background-color: #8ecae6;">
        <nav class="navbar" style="background-color: #8ecae6;" >
            <a class="navbar-brand mx-3 mt-3">
                <h4 style="color:#023047"><b>Televecinos Unidos</b></h4>
            </a>
            <div class="d-flex align-items-center ms-4 mb-4"  >
                <img class="rounded-circle" src="img/coordinadora.jpg" alt="" style="width: 50px; height: 50px;">
                <div class="ms-3 m-3" >
                    <h6 class="mb-0" style="color:#023047;"><b>Nombre Apellido</b></h6>
                    <span class="text-muted"><b>Coordinador</b></span>
                </div>
            </div>
            <div class="navbar-nav w-100">
                <a href="CoordinadorServlet?action=inicioCoordinador" class="nav-item nav-link "><i class="fa fa-home me-2"></i><span style="font-size: 13.5px;"><b>Inicio</b></span></a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle active " data-bs-toggle="dropdown"><i class="fa fa-calendar me-2"></i><span style="font-size: 13.5px;"><b>Eventos</b></span></a>
                    <div class="dropdown-menu bg-transparent border-0 ">
                        <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=eventoGeneralesC" class="dropdown-item active"><span style="font-size: 13.5px;"><b>Eventos generales</b></span></a>
                        <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=crearEvento" class="dropdown-item"><span style="font-size: 13.5px;"><b>Crear evento</b></span></a>
                        <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=lista" class="dropdown-item"><span style="font-size: 13.5px;"><b>Eventos propios</b></span></a>
                        <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=registrarAsistencia" class="dropdown-item "><span style="font-size: 13.5px;"><b>Registrar asistencia</b></span></a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle " data-bs-toggle="dropdown"><i class="fa fa-th-list me-2"></i><span style="font-size: 13.5px;"><b>Incidencias</b></span></a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=generarIncidenciaC" class="dropdown-item"><span style="font-size: 13.5px;"><b>Crear incidencia</b></span></a>
                        <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=listarIncidencia" class="dropdown-item"><span style="font-size: 13.5px;"><b>Lista de incidencias</b></span></a>
                    </div>
                </div>
                <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=preguntasFrecuentesC" class="nav-item nav-link font-al"><i class="fa fa-question-circle me-2" ></i><span style="font-size: 13.5px;"><b>Preguntas frecuentes</b></span></a>
            </div>
        </nav>
    </div>
    <!-- Sidebar End -->


    <!-- Content Start -->
    <div class="content">
        <!-- Navbar Start -->
        <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
            <a href="#" class="sidebar-toggler flex-shrink-0">
                <i class="fa fa-bars"></i>
            </a>
            <a class="navbar-brand mx-4 mb-3 d-flex align-items-center" style="padding-top: 2%;">
                <img class="rounded-circle" src="img/logo.jpg" alt="" style="width: 40px; height: 40px;">
                <h3 class="m-0 me-2 px-2" style="color:#023047;">¡Bienvenido, coordinador!</h3>
            </a>
            <div class="navbar-nav align-items-center ms-auto">

                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <img class="rounded-circle me-lg-2" src="img/coordinadora.jpg" alt="" style="width: 40px; height: 40px;">
                        <span class="d-none d-lg-inline-flex" style="color:#023047;"><b>Nombre Apellido</b></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                        <a href="CoordinadorServlet?action=perfilC" class="dropdown-item">Mi perfil</a>
                        <a href="CoordinadorServlet?action=Index" class="dropdown-item">Cerrar sesión</a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Navbar End -->


        <!-- Mostrar eventos de deporte-->


        <div id="Barra-Filtro" >

            <script>
                function crearEvento() {
                    window.location.href = 'creacionEvento.html';
                }
            </script>
            <script>
                function filtrar() {
                    var input, filtro, ul, li, txtValue, categoria, estado;
                    input = document.getElementById('filtroInput');
                    filtro = input.value.toUpperCase();
                    ul = document.getElementById("lista");
                    li = ul.getElementsByTagName('li');
                    categoria = document.getElementById('filtroCategoria').value;
                    estado = document.getElementById('filtroEstado').value;
                    for (var i = 0; i < li.length; i++) {
                        txtValue = li[i].textContent || li[i].innerText;
                        var visible = true;
                        if (txtValue.toUpperCase().indexOf(filtro) === -1) {
                            visible = false;
                        }
                        if (categoria !== 'todos' && !txtValue.includes(categoria)) {
                            visible = false;
                        }
                        if (estado !== 'todos' && !txtValue.includes(estado)) {
                            visible = false;
                        }
                        li[i].style.display = visible ? "" : "none";
                    }
                }
            </script>
        </div>
        <div id="Titulo_Eventos ">
            <h1 style="text-align: center; margin-top:70px;margin-bottom:70px;">Descubre y Participa en Nuestros Vibrantes Eventos</h1>
            <p style="text-align: center; font-size: normal; margin-top: 50px; margin-bottom: 50px;padding: 20px;">
                Sumérgete en la acción con nuestros eventos deportivos. ¡Desde emocionantes partidos hasta desafiantes competiciones, tenemos algo para cada aficionado al deporte! ¡No te pierdas la diversión y únete a nosotros para vivir experiencias inolvidables!
            </p>
        </div>

        <div style="background-color: #FFB703 ; padding: 20px; border: 1px solid #ccc; border-radius: 5px;">
            <div class="row justify-content-auto align-items-auto">
                <div class="col-md-6 mb-2">
                    <input type="text" class="form-control" id="filtroInput" placeholder="Buscar...">
                </div>

                <div class="col-md-2 mb-2">
                    <select id="filtroEstado" class="form-select">
                        <option selected>Estado</option>
                        <option value="disponible">Disponible</option>
                        <option value="enCurso">En curso</option>
                        <option value="finalizado">Finalizado</option>
                    </select>
                </div>
                <div class="col-md-2 mb-2">
                    <button type="button" class="btn btn-primary w-100" onclick="filtrar()"><b>Filtrar</b></button>
                </div>
                <div class="col-md-2 mb-2">
                    <button type="button" class="btn btn-primary w-100" onclick="crearEvento()"><b>Crear evento</b></button>
                </div>
            </div>
        </div>
        <div style="background-color: #f8f9fa; padding: 20px; " >

            <div class="row my-4" style="margin-bottom: 10px;">
                <div class="col-md-3 mb-4">
                    <div class="card" style="max-width: 20rem; margin: auto;border-radius: 15px;">
                        <img src="img/Deporte/pexels-pixabay-248547.jpg" alt="Evento de deporte" style="max-height: 180px;"class="card-img-top rounded-top">
                        <div class="card-body" style="height: 15rem;">
                            <h5 class="card-title" style="text-align: left;">Nombre del evento</h5>
                            <p class="card-status"style="font-size: small; margin-bottom: 0;">Estado: Diponible</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">Fecha de incio: DD/MM/AAAA</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">Fecha de fin: DD/MM/AAAA</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">¡Te invitamos a un emocionante día de fútbol en el Estadio Municipal de X lugar!</p>
                            <div class="row" style="position: absolute; bottom: 0; right: 0; margin: 10px;">
                                <a class="link-opacity-50-hover" style="font-size: small;"href="eventoPropio.html">Más información aquí</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card" style="max-width: 20rem; margin: auto;border-radius: 15px;" >
                        <img src="img/Deporte/bruce-mars-gJtDg6WfMlQ-unsplash.jpg" alt="Evento de deporte" style="max-height: 180px;"class="card-img-top rounded-top">
                        <div class="card-body" style="height: 15rem;">
                            <h5 class="card-title" style="text-align: left;">Nombre del evento</h5>
                            <p class="card-status"style="font-size: small; margin-bottom: 0;">Estado: Diponible</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">Fecha de incio: DD/MM/AAAA</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">Fecha de fin: DD/MM/AAAA</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">¡Te invitamos a un emocionante día de fútbol en el Estadio Municipal de X lugar!</p>
                            <div class="row" style="position: absolute; bottom: 0; right: 0; margin: 10px;">
                                <a class="link-opacity-50-hover" style="font-size: small;"href="MasInformacion_C.html">Más información aquí</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card" style="max-width: 20rem; margin: auto;border-radius: 15px;">
                        <img src="img/Deporte/girl-posing-with-volley-ball.jpg" alt="Evento de deporte" style="max-height: 180px;"class="card-img-top rounded-top">
                        <div class="card-body" style="height: 15rem;">
                            <h5 class="card-title" style="text-align: left;">Nombre del evento</h5>
                            <p class="card-status"style="font-size: small; margin-bottom: 0;">Estado: Diponible</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">Fecha de incio: DD/MM/AAAA</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">Fecha de fin: DD/MM/AAAA</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">¡Te invitamos a un emocionante día de fútbol en el Estadio Municipal de X lugar!</p>
                            <div class="row" style="position: absolute; bottom: 0; right: 0; margin: 10px;">
                                <a class="link-opacity-50-hover" style="font-size: small;"href="eventoPropio.html">Más información aquí</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card" style="max-width: 20rem; margin: auto;border-radius: 15px;">
                        <img src="img/Deporte/markus-spiske-BfphcCvhl6E-unsplash.jpg" alt="Evento de deporte" style="max-height: 180px;"class="card-img-top rounded-top">
                        <div class="card-body" style="height: 15rem;">
                            <h5 class="card-title" style="text-align: left;">Nombre del evento</h5>
                            <p class="card-status"style="font-size: small; margin-bottom: 0;">Estado: Diponible</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">Fecha de incio: DD/MM/AAAA</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">Fecha de fin: DD/MM/AAAA</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">¡Te invitamos a un emocionante día de fútbol en el Estadio Municipal de X lugar!</p>
                            <div class="row" style="position: absolute; bottom: 0; right: 0; margin: 10px;">
                                <a class="link-opacity-50-hover" style="font-size: small;"href="MasInformacion_C.html">Más información aquí</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row my-4" style="margin-bottom: 10px;">
                <div class="col-md-3 mb-4">
                    <div class="card" style="max-width: 20rem; margin: auto;border-radius: 15px;">
                        <img src="img/Deporte/markus-spiske-WUehAgqO5hE-unsplash.jpg" alt="Evento de deporte" style="max-height: 180px;"class="card-img-top rounded-top">
                        <div class="card-body" style="height: 15rem;">
                            <h5 class="card-title" style="text-align: left;">Nombre del evento</h5>
                            <p class="card-status"style="font-size: small; margin-bottom: 0;">Estado: Diponible</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">Fecha de incio: DD/MM/AAAA</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">Fecha de fin: DD/MM/AAAA</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">¡Te invitamos a un emocionante día de fútbol en el Estadio Municipal de X lugar!</p>
                            <div class="row" style="position: absolute; bottom: 0; right: 0; margin: 10px;">
                                <a class="link-opacity-50-hover" style="font-size: small;"href="MasInformacion_C.html">Más información aquí</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card" style="max-width: 20rem; margin: auto;border-radius: 15px;" >
                        <img src="img/Deporte/pexels-tirachard-kumtanom-347134.jpg" alt="Evento de deporte" style="max-height: 180px;"class="card-img-top rounded-top">
                        <div class="card-body" style="height: 15rem;">
                            <h5 class="card-title" style="text-align: left;">Nombre del evento</h5>
                            <p class="card-status"style="font-size: small; margin-bottom: 0;">Estado: Diponible</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">Fecha de incio: DD/MM/AAAA</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">Fecha de fin: DD/MM/AAAA</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">¡Te invitamos a un emocionante día de fútbol en el Estadio Municipal de X lugar!</p>
                            <div class="row" style="position: absolute; bottom: 0; right: 0; margin: 10px;">
                                <a class="link-opacity-50-hover" style="font-size: small;"href="MasInformacion_C.html">Más información aquí</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card" style="max-width: 20rem; margin: auto;border-radius: 15px;">
                        <img src="img/Deporte/chino-rocha-2FKTyJqfWX8-unsplash.jpg" alt="Evento de deporte" style="max-height: 180px;"class="card-img-top rounded-top">
                        <div class="card-body" style="height: 15rem;">
                            <h5 class="card-title" style="text-align: left;">Nombre del evento</h5>
                            <p class="card-status"style="font-size: small; margin-bottom: 0;">Estado: Diponible</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">Fecha: DD/MM/AAAA</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">¡Te invitamos a un emocionante día de fútbol en el Estadio Municipal de X lugar!</p>
                            <div class="row" style="position: absolute; bottom: 0; right: 0; margin: 10px;">
                                <a class="link-opacity-50-hover" style="font-size: small;"href="eventoPropio.html">Más información aquí</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card" style="max-width: 20rem; margin: auto;border-radius: 15px;">
                        <img src="img/Deporte/wesley-tingey-dKCKiC0BQtU-unsplash.jpg" alt="Evento de deporte" style="max-height: 180px;"class="card-img-top rounded-top">
                        <div class="card-body" style="height: 15rem;">
                            <h5 class="card-title" style="text-align: left;">Nombre del evento</h5>
                            <p class="card-status"style="font-size: small; margin-bottom: 0;">Estado: Diponible</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">Fecha de incio: DD/MM/AAAA</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">Fecha de fin: DD/MM/AAAA</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">¡Te invitamos a un emocionante día de fútbol en el Estadio Municipal de X lugar!</p>
                            <div class="row" style="position: absolute; bottom: 0; right: 0; margin: 10px;">
                                <a class="link-opacity-50-hover" style="font-size: small;"href="MasInformacion_C.html">Más información aquí</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row my-4" style="margin-bottom: 10px;">
                <div class="col-md-3 mb-4">
                    <div class="card" style="max-width: 20rem; margin: auto;border-radius: 15px;">
                        <img src="img/Deporte/pexels-pixabay-248547.jpg" alt="Evento de deporte" style="max-height: 180px;"class="card-img-top rounded-top">
                        <div class="card-body" style="height: 15rem;">
                            <h5 class="card-title" style="text-align: left;">Nombre del evento</h5>
                            <p class="card-status"style="font-size: small; margin-bottom: 0;">Estado: Diponible</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">Fecha de incio: DD/MM/AAAA</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">Fecha de fin: DD/MM/AAAA</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">¡Te invitamos a un emocionante día de fútbol en el Estadio Municipal de X lugar!</p>
                            <div class="row" style="position: absolute; bottom: 0; right: 0; margin: 10px;">
                                <a class="link-opacity-50-hover" style="font-size: small;"href="MasInformacion_C.html">Más información aquí</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card" style="max-width: 20rem; margin: auto;border-radius: 15px;" >
                        <img src="img/Deporte/pexels-pixabay-248547.jpg" alt="Evento de deporte" style="max-height: 180px;"class="card-img-top rounded-top">
                        <div class="card-body" style="height: 15rem;">
                            <h5 class="card-title" style="text-align: left;">Nombre del evento</h5>
                            <p class="card-status"style="font-size: small; margin-bottom: 0;">Estado: Diponible</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">Fecha de incio: DD/MM/AAAA</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">Fecha de fin: DD/MM/AAAA</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">¡Te invitamos a un emocionante día de fútbol en el Estadio Municipal de X lugar!</p>
                            <div class="row" style="position: absolute; bottom: 0; right: 0; margin: 10px;">
                                <a class="link-opacity-50-hover" style="font-size: small;"href="MasInformacion_C.html">Más información aquí</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card" style="max-width: 20rem; margin: auto;border-radius: 15px;">
                        <img src="img/Deporte/pexels-pixabay-248547.jpg" alt="Evento de deporte" style="max-height: 180px;"class="card-img-top rounded-top">
                        <div class="card-body" style="height: 15rem;">
                            <h5 class="card-title" style="text-align: left;">Nombre del evento</h5>
                            <p class="card-status"style="font-size: small; margin-bottom: 0;">Estado: Diponible</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">Fecha de incio: DD/MM/AAAA</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">Fecha de fin: DD/MM/AAAA</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">¡Te invitamos a un emocionante día de fútbol en el Estadio Municipal de X lugar!</p>
                            <div class="row" style="position: absolute; bottom: 0; right: 0; margin: 10px;">
                                <a class="link-opacity-50-hover" style="font-size: small;"href="MasInformacion_C.html">Más información aquí</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card" style="max-width: 20rem; margin: auto;border-radius: 15px;">
                        <img src="img/Deporte/pexels-pixabay-248547.jpg" alt="Evento de deporte" style="max-height: 180px;"class="card-img-top rounded-top">
                        <div class="card-body" style="height: 15rem;">
                            <h5 class="card-title" style="text-align: left;">Nombre del evento</h5>
                            <p class="card-status"style="font-size: small; margin-bottom: 0;">Estado: Diponible</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">Fecha de incio: DD/MM/AAAA</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">Fecha de fin: DD/MM/AAAA</p>
                            <p class="text-wrap" style="font-size: small; margin-bottom: 0;" style="text-size-adjust:auto; overflow-y: auto;  width: auto;">¡Te invitamos a un emocionante día de fútbol en el Estadio Municipal de X lugar!</p>
                            <div class="row" style="position: absolute; bottom: 0; right: 0; margin: 10px;">
                                <a class="link-opacity-50-hover" style="font-size: small;"href="MasInformacion_C.html">Más información aquí</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div  style="display: flex; justify-content: center; align-items: center;">
                <!-- Paginación-->
                <section class="paginacion" >
                    <ul style="list-style: none;padding: 0;margin: 0;display: flex;">
                        <div style="background-color: white ; padding: 5px; margin:10px">
                            <li style="margin: 0 5px;"><a class="link-opacity-50-hover" class="link-opacity-50-hover" href="#" class="active">1</a></li>
                        </div>
                        <div style="background-color:white ; padding: 5px;margin:10px">
                            <li style="margin: 0 5px;"><a class="link-opacity-50-hover" class="link-opacity-50-hover" href="#" class="active">2</a></li>
                        </div>
                        <div style="background-color: white ; padding: 5px;margin:10px">
                            <li style="margin: 0 5px;"><a class="link-opacity-50-hover" class="link-opacity-50-hover" href="#" class="active">3</a></li>
                        </div>
                        <div style="background-color: white; padding: 5px;margin:10px">
                            <li style="margin: 0 5px;"><a class="link-opacity-50-hover" class="link-opacity-50-hover" href="#" class="active">4</a></li>
                        </div>
                        <div style="background-color: white; padding: 5px;margin:10px">
                            <li style="margin: 0 5px;"><a class="link-opacity-50-hover" class="link-opacity-50-hover" href="# class="active">5</a></li>
                        </div>

                    </ul>
                </section>
            </div>
        </div>


        <div id="Barra-Filtro" >


            <script>
                function filtrar() {
                    var input, filtro, ul, li, txtValue, categoria, estado;
                    input = document.getElementById('filtroInput');
                    filtro = input.value.toUpperCase();
                    ul = document.getElementById("lista");
                    li = ul.getElementsByTagName('li');
                    categoria = document.getElementById('filtroCategoria').value;
                    estado = document.getElementById('filtroEstado').value;
                    for (var i = 0; i < li.length; i++) {
                        txtValue = li[i].textContent || li[i].innerText;
                        var visible = true;
                        if (txtValue.toUpperCase().indexOf(filtro) === -1) {
                            visible = false;
                        }
                        if (categoria !== 'todos' && !txtValue.includes(categoria)) {
                            visible = false;
                        }
                        if (estado !== 'todos' && !txtValue.includes(estado)) {
                            visible = false;
                        }
                        li[i].style.display = visible ? "" : "none";
                    }
                }
            </script>
        </div>

        <!-- Eventos próximos-->






        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light rounded-top p-4">
                <div class="row">
                    <div class="col-12 col-sm-6 text-center text-sm-start">
                        &copy; <a href="#">TelevecinosUnidos</a>, All Right Reserved.
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
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick-theme.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>