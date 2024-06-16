<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Solicitudes de registro</title>
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
            <div class="filtro" style="border: 1px solid #ccc; border-radius: 5px; padding: 10px; display: flex; align-items: center; background-color:#FFB703 ;">
                <input type="text" style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; width: 20%; margin-right: 2%;" id="filtroInput" placeholder="Buscar...">

                <input type="date" id="filtroFecha" style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; width: 20%; margin-right: 2%;">


                <button type="button" class="btn btn-primary" onclick="filtrar()" style="padding: 10px;"><b>Filtrar</b></button>
            </div>
            <div class="table-responsive">
                <table class="table text-start align-middle table-bordered table-hover mb-0">
                    <thead>
                    <tr class="text-dark">
                        <th scope="col">#</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Apellido</th>
                        <th scope="col">Correo</th>
                        <th scope="col">Fecha de registro</th>
                        <th scope="col">Evaluar Ingreso</th>

                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>Juan Fernando</td>
                        <td>Pérez López</td>
                        <td>Jjjffppll@gmail.com</td>
                        <td style="width: 150px;">03 Mayo 2079</td>
                        <td style="width: 300px;">

                            <button type="button" class="btn btn-success btn-sm m-2 btn-banear" >Aceptar</button>
                            <div id="popup1" class="popup1" >
                                <div class="popup_contenido1">
                                    <span class="close-btn" id="closePopupBtn1">&times;</span>
                                    <img src="img/check.png" alt="check" width="48" height="48" style="margin-top: -10px;">

                                    <p>¡Nuevo Vecino añadido!</p>

                                    <a href="NuevasSolicitudes_A.html"><button type="button" class="btn btn-primary rounded-pill m-2">Regresar</button></a>

                                </div>
                            </div>
                            <button type="button" class="btn btn-danger btn-sm m-2 btn-banear">Rechazar</button>
                            <div id="popup2" class="popup1" >
                                <div class="popup_contenido1">
                                    <span class="close-btn" id="closePopupBtn2">&times;</span>
                                    <img src="img/advertencia.png" alt="check" width="48" height="48" style="margin-top: -10px;">

                                    <p>¡Advertencia!</p>

                                    <p>La acción tomada será permanente, ¿Está seguro de rechazar la solicitud de registro del vecino?</p>

                                    <a href="NuevasSolicitudes_A.html"><button type="button" class="btn btn-success rounded-pill m-2">Cancelar</button></a>
                                    <button type="button" class="btn btn-danger rounded-pill m-2">Sí, rechazar</button>

                                </div>
                            </div>
                            <a href="DetalleNewVecinos_A.html"><button type="button" class="btn btn-primary btn-sm m-2">Ver detalle</button></a>

                        </td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>Juan Fernando</td>
                        <td>Pérez López</td>
                        <td>Jjjffppll@gmail.com</td>
                        <td style="width: 150px;">03 Mayo 2079</td>
                        <td style="width: 300px;">

                            <button type="button" class="btn btn-success btn-sm m-2 btn-banear" >Aceptar</button>
                            <div id="popup1" class="popup1" >
                                <div class="popup_contenido1">
                                    <span class="close-btn" id="closePopupBtn1">&times;</span>
                                    <img src="img/check.png" alt="check" width="48" height="48" style="margin-top: -10px;">

                                    <p>¡Nuevo Vecino añadido!</p>

                                    <a href="NuevasSolicitudes_A.html"><button type="button" class="btn btn-primary rounded-pill m-2">Regresar</button></a>

                                </div>
                            </div>
                            <button type="button" class="btn btn-danger btn-sm m-2 btn-banear">Rechazar</button>
                            <div id="popup2" class="popup1" >
                                <div class="popup_contenido1">
                                    <span class="close-btn" id="closePopupBtn2">&times;</span>
                                    <img src="img/advertencia.png" alt="check" width="48" height="48" style="margin-top: -10px;">

                                    <p>¡Advertencia!</p>

                                    <p>La acción tomada será permanente, ¿Está seguro de rechazar la solicitud de registro del vecino?</p>

                                    <a href="NuevasSolicitudes_A.html"><button type="button" class="btn btn-success rounded-pill m-2">Cancelar</button></a>
                                    <button type="button" class="btn btn-danger rounded-pill m-2">Sí, rechazar</button>

                                </div>
                            </div>
                            <a href="DetalleNewVecinos_A.html"><button type="button" class="btn btn-primary btn-sm m-2">Ver detalle</button></a>

                        </td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>Juan Fernando</td>
                        <td>Pérez López</td>
                        <td>Jjjffppll@gmail.com</td>
                        <td style="width: 150px;">03 Mayo 2079</td>
                        <td style="width: 300px;">

                            <button type="button" class="btn btn-success btn-sm m-2 btn-banear" >Aceptar</button>
                            <div id="popup1" class="popup1" >
                                <div class="popup_contenido1">
                                    <span class="close-btn" id="closePopupBtn1">&times;</span>
                                    <img src="img/check.png" alt="check" width="48" height="48" style="margin-top: -10px;">

                                    <p>¡Nuevo Vecino añadido!</p>

                                    <a href="NuevasSolicitudes_A.html"><button type="button" class="btn btn-primary rounded-pill m-2">Regresar</button></a>

                                </div>
                            </div>
                            <button type="button" class="btn btn-danger btn-sm m-2 btn-banear">Rechazar</button>
                            <div id="popup2" class="popup1" >
                                <div class="popup_contenido1">
                                    <span class="close-btn" id="closePopupBtn2">&times;</span>
                                    <img src="img/advertencia.png" alt="check" width="48" height="48" style="margin-top: -10px;">

                                    <p>¡Advertencia!</p>

                                    <p>La acción tomada será permanente, ¿Está seguro de rechazar la solicitud de registro del vecino?</p>

                                    <a href="NuevasSolicitudes_A.html"><button type="button" class="btn btn-success rounded-pill m-2">Cancelar</button></a>
                                    <button type="button" class="btn btn-danger rounded-pill m-2">Sí, rechazar</button>

                                </div>
                            </div>
                            <a href="DetalleNewVecinos_A.html"><button type="button" class="btn btn-primary btn-sm m-2">Ver detalle</button></a>

                        </td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>Juan Fernando</td>
                        <td>Pérez López</td>
                        <td>Jjjffppll@gmail.com</td>
                        <td style="width: 150px;">03 Mayo 2079</td>
                        <td style="width: 300px;">

                            <button type="button" class="btn btn-success btn-sm m-2 btn-banear" >Aceptar</button>
                            <div id="popup1" class="popup1" >
                                <div class="popup_contenido1">
                                    <span class="close-btn" id="closePopupBtn1">&times;</span>
                                    <img src="img/check.png" alt="check" width="48" height="48" style="margin-top: -10px;">

                                    <p>¡Nuevo Vecino añadido!</p>

                                    <a href="NuevasSolicitudes_A.html"><button type="button" class="btn btn-primary rounded-pill m-2">Regresar</button></a>

                                </div>
                            </div>
                            <button type="button" class="btn btn-danger btn-sm m-2 btn-banear">Rechazar</button>
                            <div id="popup2" class="popup1" >
                                <div class="popup_contenido1">
                                    <span class="close-btn" id="closePopupBtn2">&times;</span>
                                    <img src="img/advertencia.png" alt="check" width="48" height="48" style="margin-top: -10px;">

                                    <p>¡Advertencia!</p>

                                    <p>La acción tomada será permanente, ¿Está seguro de rechazar la solicitud de registro del vecino?</p>

                                    <a href="NuevasSolicitudes_A.html"><button type="button" class="btn btn-success rounded-pill m-2">Cancelar</button></a>
                                    <button type="button" class="btn btn-danger rounded-pill m-2">Sí, rechazar</button>

                                </div>
                            </div>
                            <a href="DetalleNewVecinos_A.html"><button type="button" class="btn btn-primary btn-sm m-2">Ver detalle</button></a>

                        </td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>Juan Fernando</td>
                        <td>Pérez López</td>
                        <td>Jjjffppll@gmail.com</td>
                        <td style="width: 150px;">03 Mayo 2079</td>
                        <td style="width: 300px;">

                            <button type="button" class="btn btn-success btn-sm m-2 btn-banear" >Aceptar</button>
                            <div id="popup1" class="popup1" >
                                <div class="popup_contenido1">
                                    <span class="close-btn" id="closePopupBtn1">&times;</span>
                                    <img src="img/check.png" alt="check" width="48" height="48" style="margin-top: -10px;">

                                    <p>¡Nuevo Vecino añadido!</p>

                                    <a href="NuevasSolicitudes_A.html"><button type="button" class="btn btn-primary rounded-pill m-2">Regresar</button></a>

                                </div>
                            </div>
                            <button type="button" class="btn btn-danger btn-sm m-2 btn-banear">Rechazar</button>
                            <div id="popup2" class="popup1" >
                                <div class="popup_contenido1">
                                    <span class="close-btn" id="closePopupBtn2">&times;</span>
                                    <img src="img/advertencia.png" alt="check" width="48" height="48" style="margin-top: -10px;">

                                    <p>¡Advertencia!</p>

                                    <p>La acción tomada será permanente, ¿Está seguro de rechazar la solicitud de registro del vecino?</p>

                                    <a href="NuevasSolicitudes_A.html"><button type="button" class="btn btn-success rounded-pill m-2">Cancelar</button></a>
                                    <button type="button" class="btn btn-danger rounded-pill m-2">Sí, rechazar</button>

                                </div>
                            </div>
                            <a href="DetalleNewVecinos_A.html"><button type="button" class="btn btn-primary btn-sm m-2">Ver detalle</button></a>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>
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
                        &copy; <a href="#">Televecinos Unidos</a>, All Right Reserved.
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