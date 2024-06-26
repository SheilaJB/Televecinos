<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Lista de eventos</title>
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


    <!-- BARRA AZUL DE LA IZQUIERDA INICIO-->
    <jsp:include page="../includes/barraLateralVecino.jsp"></jsp:include>
    <!-- BARRA AZUL DE LA IZQUIERDA FINAL -->


    <!-- Content Start -->
    <div class="content">
        <!-- PARTE SUPERIOR INICIO -->
        <jsp:include page="../includes/navbarVecino.jsp"></jsp:include>
        <!-- PARTE SUPERIOR FINAL -->


        <!-- Lista de eventos-->

        <!-- Titulo -->
        <div id="Nombre del evento">
            <h3 style="text-align: left; margin-top:20px;margin-bottom:20px;padding: 20px">Lista de eventos</h3>
        </div>
        <div style="background-color: #f8f9fa; padding: 20px; align-items: center;">
            <div class="bg-light rounded h-100 p-4" style="font-weight: bold;">

                <!--Filtro-->
                <div class="filtro" style="border: 1px solid #ccc; border-radius: 5px; padding: 10px; display: flex; align-items: center; background-color:#FFB703 ;">
                    <input type="text" style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; width: 20%; margin-right: 2%;" id="filtroInput" placeholder="Buscar...">
                    <select id="filtroCategoria" style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; width: 20%; margin-right: 2%;">
                        <option selected>Frecuencia</option>
                        <option value="diaria">Diaria</option>
                        <option value="interdiaria">Interdiaria</option>
                        <option value="semanal">Semanal</option>

                    </select>
                    <select id="filtroEstado" style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; width: 30%; margin-right: 2%;">
                        <option selected>Estado</option>
                        <option value="disponible">Disponible</option>
                        <option value="enCurso">En curso</option>
                        <option value="finalizado">Finalizado</option>
                    </select>
                    <select id="filtroEstado" style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; width: 30%; margin-right: 2%;">
                        <option selected>Tipo</option>
                        <option value="disponible">Deporte</option>
                        <option value="finalizado">Cultura</option>
                    </select>
                    <!-- Alineación del botón con los selects -->
                    <button type="button" class="btn btn-primary" onclick="filtrar()" style="padding: 10px;"><b>Filtrar</b></button>
                </div>

                <div class="table-responsive">
                    <table class="table" style="background-color: transparent;">
                        <thead>
                        <tr>
                            <th scope="col">N°</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Fecha de inicio</th>
                            <th scope="col">Frecuencia</th>
                            <th scope="col">Tipo de evento</th>
                            <th scope="col">Estado</th>
                            <th scope="col">Visualizar</th>

                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Voley</td>
                            <td>21-Enero</td>
                            <td>Lunes-Miercoles</td>
                            <td>Deporte</td>
                            <td>En curso</td>
                            <td>
                                <button type="button" class="btn btn-info m-2" style="background-color: transparent; border: none;" onclick="viewEvent()">
                                    <i class="fas fa-eye"><a href="EventoActual-Vecino.html"></a></i> <!-- Ícono de ojo de FontAwesome -->
                                </button>
                            </td>


                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Canto</td>
                            <td>21-Enero</td>
                            <td>Martes-Jueves</td>
                            <td>Cultura</td>
                            <td>En curso</td>
                            <td>
                                <button type="button" class="btn btn-info m-2" style="background-color: transparent; border: none;" onclick="viewEvent()">
                                    <i class="fas fa-eye"><a href="EventoActual-Vecino"></a></i> <!-- Ícono de ojo de FontAwesome -->
                                </button>
                            </td>



                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>Voley</td>
                            <td>21-Enero</td>
                            <td>Martes-Jueves</td>
                            <td>Cultura</td>
                            <td>En curso</td>
                            <td>
                                <button type="button" class="btn btn-info m-2" style="background-color: transparent; border: none;" onclick="viewEvent()">
                                    <i class="fas fa-eye"><a href="EventoActual-Vecino"></a></i> <!-- Ícono de ojo de FontAwesome -->
                                </button>

                            </td>

                        </tr>
                        <tr>
                            <th scope="row">4</th>
                            <td>Voley</td>
                            <td>21-Enero</td>
                            <td>Lunes-Miercoles</td>
                            <td>Deporte</td>
                            <td>En curso</td>
                            <td>
                                <button type="button" class="btn btn-info m-2" style="background-color: transparent; border: none;" onclick="viewEvent()">
                                    <i class="fas fa-eye"><a href="EventoActual-Vecino.html"></a></i> <!-- Ícono de ojo de FontAwesome -->
                                </button>
                            </td>


                        </tr>
                        <tr>
                            <th scope="row">5</th>
                            <td>Canto</td>
                            <td>21-Enero</td>
                            <td>Martes-Jueves</td>
                            <td>Cultura</td>
                            <td>Finalizado</td>
                            <td>
                                <button type="button" class="btn btn-info m-2" style="background-color: transparent; border: none;" onclick="viewEvent()">
                                    <i class="fas fa-eye"><a href="EventoActual-Vecino"></a></i> <!-- Ícono de ojo de FontAwesome -->
                                </button>
                            </td>



                        </tr>
                        <tr>
                            <th scope="row">6</th>
                            <td>Voley</td>
                            <td>21-Enero</td>
                            <td>Martes-Jueves</td>
                            <td>Cultura</td>
                            <td>Finalizado</td>
                            <td>
                                <button type="button" class="btn btn-info m-2" style="background-color: transparent; border: none;" onclick="viewEvent()">
                                    <i class="fas fa-eye"><a href="EventoActual-Vecino"></a></i> <!-- Ícono de ojo de FontAwesome -->
                                </button>

                            </td>

                        </tr>
                        </tbody>
                    </table>


                    <!--Paginación de la lista-->
                    <div  style="display: flex; justify-content: center; align-items: center;">
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
                            </ul>
                        </section>
                    </div>
                </div>


                <!---Falta funcionalidad---->
                <script src="js/listaEvento_V.js"></script>

            </div>

        </div>

        <!-- Filtro-->
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