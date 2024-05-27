<%--
  Created by IntelliJ IDEA.
  User: Pc
  Date: 27/05/2024
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Inicio Serenazgo</title>
  <meta content="width=device-width, initial-scale=1.0"  name="viewport">
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
  <link href="css/style_serenazgo.css" rel="stylesheet">

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
  <!-- Sidebar Start -->
  <div class="sidebar pe-4 pb-3" style="background-color: #8ecae6;">
    <nav class="navbar" style="background-color: #8ecae6;" >
      <a class="navbar-brand mx-3 mt-3">
        <h4 style="color:#023047"><b>Televecinos Unidos</b></h4>
      </a>
      <div class="d-flex align-items-center ms-4 mb-4"  >
        <img class="rounded-circle" src="img/serenazgo.jpg" alt="" style="width: 50px; height: 50px;">
        <div class="ms-3 m-3" >
          <h6 class="mb-0" style="color:#023047;"><b>Nombre Apellido</b></h6>
          <span class="text-muted"><b>Serenazgo</b></span>
        </div>



      </div>
      <div class="navbar-nav w-100">
        <a href="inicioSerenazgo.html" class="nav-item nav-link active"><i class="fa fa-home me-2"></i><span style="font-size: 13.5px;"><b>Inicio</b></a>
        <a href="Dashboard.html"class="nav-item nav-link "><i class="fa fa-chart-bar me-2"></i><span style="font-size: 13.5px;"><b>Dashboard</b></a>
        <a href="listaIncidencias_S.html" class="nav-item nav-link "><i class="fa fa-th-list me-2"></i><span style="font-size: 13.5px;"><b>Incidencias</b></a>
        <a href="BanVecino.html"class="nav-item nav-link"><i class="fa fa-ban me-2"></i><span style="font-size: 13.5px;"><b>Banear vecino</b></a>
        <a href="preguntasFrecuentes_S.html"class="nav-item nav-link "><i class="fa fa-question-circle me-2"></i><span style="font-size: 13.5px;"><b>Preguntas frecuentes</b></a>
      </div>
    </nav>
  </div>
  <!-- Sidebar End -->
  <!-- BARRA AZUL DE LA IZQUIERDA FINAL -->


  <!-- Content Start -->
  <div class="content">
    <!-- PARTE SUPERIOR INICIO -->
    <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">

      <a href="#" class="sidebar-toggler flex-shrink-0">
        <i class="fa fa-bars"></i>
      </a>
      <a class="navbar-brand mx-4 mb-3 d-flex align-items-center" style="padding-top: 2%;">
        <img class="rounded-circle" src="img/logo.jpg" alt="" style="width: 40px; height: 40px;">
        <h3 class="m-0 me-2 px-2" style="color:#023047;">¡Bienvenido, serenazgo!</h3>
      </a>

      <div class="navbar-nav align-items-center ms-auto">

        <div class="nav-item dropdown">
          <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
            <img class="rounded-circle me-lg-2" src="img/serenazgo.jpg" alt="" style="width: 40px; height: 40px;">
            <span class="d-none d-lg-inline-flex" style="color:#023047;"><b>Nombre Apellido</b></span>
          </a>
          <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
            <a href="perfil_S.html" class="dropdown-item">Mi perfil</a>
            <a href="index.html" class="dropdown-item">Cerrar sesión</a>
          </div>
        </div>
      </div>
    </nav>
    <!-- PARTE SUPERIOR FINAL -->



    <!-- LLENAR-->
    <!-- Imagen estática del inicio del admin -->
    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="img/serenazgo2.jpg" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
            <h5 class="titleCarousel">MUNICIPALIDAD DE SAN MIGUEL - Serenazgo</h5>
            <p>Te damos la bienvenida al panel del Serenazgo, una herramienta fundamental para garantizar la seguridad y el bienestar en nuestra comunidad.</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap JS dependencies -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



    <!-- Fin de iamgen estatica -->
    <div style="background-color: #f8f9fa; padding: 20px; align-items: center;">
      <h3> Opciones: </h3>



      <div class="row row-cols-1 row-cols-md-3 g-4">
        <div class="col">
          <div class="card h-100 shadow" style="background-color: #023047;">
            <div class="card-body">
              <p class="card-title colorLetra">Dashboard: Podrás visualizar gráficos con  información general de las incidencias</p>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card h-100 shadow" style="background-color: #023047;">
            <div class="card-body">
              <p class="card-title colorLetra">Incidencias: Podrás gestionar las incidencias y evaluarlas</p>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card h-100 shadow" style="background-color: #023047;">
            <div class="card-body">
              <p class="card-title colorLetra">Banear vecino: Cuando se cumpla el número máximo de alertas falsas (5) podrás banear a un vecino</p>

            </div>
          </div>
        </div>


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

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>
