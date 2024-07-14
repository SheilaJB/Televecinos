<%@ page import="org.example.televecinosunidos_appweb.model.beans.ProfesoresEvento" %>
<%@ page import="org.example.televecinosunidos_appweb.model.beans.EventoB" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.televecinosunidos_appweb.model.beans.UsuarioB" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuarioLogueado" scope="session" type="UsuarioB" class="org.example.televecinosunidos_appweb.model.beans.UsuarioB" />
<%@ page pageEncoding="UTF-8" %>
<%
    EventoB evento = (EventoB) request.getAttribute("eventoB");
    ArrayList<ProfesoresEvento> listaProfesoresEdit = (ArrayList<ProfesoresEvento>) request.getAttribute("lista");
    Map<String, String> erroresEvento = new HashMap<String, String>();
    if (request.getAttribute("erroresEvento")!= null) {
        erroresEvento = (Map<String, String>) request.getAttribute("erroresEvento");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Editar Evento</title>
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
    <style>
        .popup {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }
        .popup-content {
            background-color: white;
            width: 50%;
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            text-align: center;
            position: relative;
        }
        .close-btn {
            position: absolute;
            top: 5px;
            right: 10px;
            font-size: 24px;
            cursor: pointer;
            color: rgb(0, 0, 0);
        }
    </style>
</head>
<body onload="mostrarOpciones()">
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
        <script>
            <% if (session.getAttribute("err") != null) { %>
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: '<%= session.getAttribute("err") %>',
            });
            <% session.removeAttribute("err"); %> // Remueve el atributo de error después de mostrarlo
            <% } %>
        </script>

        <h2 class="mb-2 text-center" style="padding-top: 3%; color:#023047;">Editar Evento</h2>
        <!-- Form Start -->
        <form method="post" action="<%=request.getContextPath()%>/CoordinadorServlet?action=editar" enctype="multipart/form-data">
            <input type="hidden" name="idEvento" value="<%=evento.getIdEvento()%>">
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-12">
                        <div class="rounded h-100 p-4" style="background-color: #ffb703;">
                            <!---Nombre del evento-->
                            <div class="mb-3">
                                <label for="nombre" class="form-label" style="color:#023047;"><b>Ingrese un nombre del evento:</b></label>
                                <% String Value1 = null; if(erroresEvento.isEmpty()){Value1 =evento.getNombre();}else{Value1 = (String) request.getAttribute("nombreEvento");}%>
                                <input type="text" class="form-control" id="nombre" placeholder="Escribir" name="nombre" value="<%=Value1%>" required>
                            </div>
                            <!---Descripción del evento-->
                            <div class="mb-3">
                                <label for="descripcion" class="form-label" style="color:#023047;"><b>Ingrese una descripción del evento:</b></label>
                                <% String Value2 = null; if(erroresEvento.isEmpty()){Value2 =evento.getDescripcion();}else{Value2 = (String) request.getAttribute("descripcionEvento");}%>
                                <textarea class="form-control" id="descripcion" rows="2" placeholder="Escribir una breve descripción" name="descripcion" required><%=Value2%></textarea>
                            </div>
                            <!---Nombre del coordinador-->
                            <div class="mb-3">
                                <label for="Coordinador_idUsuario" class="form-label" style="color:#023047;"><b>Ingrese nombre del coordinador:</b></label>
                                <input type="text" class="form-control" id="Coordinador_idUsuario" placeholder="Escribir" name="Coordinador_idUsuario" value="<%= usuarioLogueado.getNombre() + " "+usuarioLogueado.getApellido() %>" disabled>
                                <input type="hidden" name="Coordinador_idUsuario" value="<%= evento.getCoordinador_idUsuario() %>">
                                <input type="hidden" name="tipoCoordinador" value="<%= usuarioLogueado.getTipoCoordinador_idTipoCoordinador() %>">
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12 col-xl-6">
                        <div class="rounded h-100 p-4" style="background-color:#219ebc;">
                            <!---Nombre del profesor-->
                            <div class="mb-3">
                                <label for="ProfesoresEvento_idProfesoresEvento" class="form-label" style="color:#023047;"><b>Ingrese nombre del profesor:</b></label>
                                <%if(erroresEvento.isEmpty()){%>
                                <select id="ProfesoresEvento_idProfesoresEvento" class="form-select mb-3" aria-label="Default select example" name="ProfesoresEvento_idProfesoresEvento" required>
                                    <% for (ProfesoresEvento pEvento : listaProfesoresEdit) { %>
                                    <option value="<%= pEvento.getIdProfesoresEvento() %>" <%= pEvento.getIdProfesoresEvento() == evento.getProfesoresEvento_idProfesoresEvento() ? "selected" : "" %>><%= pEvento.getNombre() %> <%= pEvento.getApellido() %></option>
                                    <% } %>

                                </select>
                                <% } else{%>
                                <%String idProf = (String) request.getAttribute("nombreProfesor");%>
                                <select id="ProfesoresEvento_idProfesoresEvento" class="form-select mb-3" aria-label="Default select example" name="ProfesoresEvento_idProfesoresEvento" required>
                                    <% for (ProfesoresEvento pEvento : listaProfesoresEdit) { %>
                                    <option value="<%= pEvento.getIdProfesoresEvento() %>" <%= pEvento.getIdProfesoresEvento() == Integer.parseInt(idProf) ? "selected" : "" %>><%= pEvento.getNombre() %> <%= pEvento.getApellido() %></option>
                                    <% } %>

                                </select>
                                <% } %>
                            </div>
                            <!---Lugar del evento-->
                            <div class="mb-3">
                                <% String Value3 = null; if(erroresEvento.isEmpty()){Value3 =evento.getLugar();}else{Value3 = (String) request.getAttribute("lugar");}%>
                                <label for="lugar" class="form-label" style="color:#023047;"><b>Lugar del evento:</b></label>
                                <input type="text" class="form-control" id="lugar" placeholder="Escribir" name="lugar" value="<%=Value3%>" required>
                            </div>
                            <!----Frecuencia del evento----->
                            <%if(erroresEvento.isEmpty()){%>
                            <!----Inicio de la selectiva----->
                            <label for="frecuenciaEvento" class="form-label" style="color:#023047;"><b>Frecuencia del evento:</b></label>
                            <select id="frecuenciaEvento" class="form-select mb-3" aria-label="Default select example" onchange="mostrarOpciones()" name="frecuencia" required>
                                <option value="0" selected>Seleccione la frecuencia del evento</option>
                                <option value="2" <%=evento.getFrecuenciaString().equals("Dos veces por semana") ? "selected" : ""%>>Dos veces por semana</option>
                                <option value="1" <%=evento.getFrecuenciaString().equals("Semanal") ? "selected" : ""%>>Semanal</option>
                            </select>



                            <div id="opcionesInterdiarias" style="display:none;">
                                <label for="diaSemana" class="form-label" style="color:#023047;"><b>Elegir días:</b></label>
                                <select id="diasInterdiarios" class="form-select mb-3" aria-label="Default select example" name="opcionesDias" required>
                                    <option selected>Seleccione la opción: </option>
                                    <option value="Lunes-Miércoles" <%=evento.getDiaEvento().equals("Lunes-Miércoles") ? "selected" : ""%>>Lunes-Miércoles</option>
                                    <option value="Martes-Jueves" <%=evento.getDiaEvento().equals("Martes-Jueves") ? "selected" : ""%>>Martes-Jueves</option>
                                </select>
                            </div>

                            <div id="opcionesSemanal" style="display:none;">
                                <label for="diaSemana" class="form-label" style="color:#023047;"><b>Elegir día:</b></label>
                                <select id="diaSemana" class="form-select mb-3" aria-label="Default select example" name="opcionesDias1" required>
                                    <option selected>Seleccione el día a la semana:</option>
                                    <option value="Lunes" <%=evento.getDiaEvento().equals("Lunes") ? "selected" : ""%>>Lunes</option>
                                    <option value="Martes" <%=evento.getDiaEvento().equals("Martes") ? "selected" : ""%>>Martes</option>
                                    <option value="Miércoles" <%=evento.getDiaEvento().equals("Miércoles") ? "selected" : ""%>>Miércoles</option>
                                    <option value="Jueves" <%=evento.getDiaEvento().equals("Jueves") ? "selected" : ""%>>Jueves</option>
                                    <option value="Viernes" <%=evento.getDiaEvento().equals("Viernes") ? "selected" : ""%>>Viernes</option>
                                </select>
                            </div>
                            <!----Fin de la selectiva----->

                            <%}else{String frec = (String) request.getAttribute("frecuencia");%>
                            <%
                                String opcionesDias = (String) request.getAttribute("opcionesDias");
                                String opcionesDias1 = (String) request.getAttribute("opcionesDias1");
                                if (opcionesDias1 == null){
                                    opcionesDias1 = "X";
                                }
                                if (opcionesDias == null){
                                    opcionesDias1 = "X";
                                }
                            %>
                            <!----Inicio de la selectiva----->
                            <label for="frecuenciaEvento" class="form-label" style="color:#023047;"><b>Frecuencia del evento:</b></label>
                            <select id="frecuenciaEvento" class="form-select mb-3" aria-label="Default select example" onchange="mostrarOpciones()" name="frecuencia" required>
                                <option value="0" selected>Seleccione la frecuencia del evento</option>
                                <option value="2" <%=Integer.parseInt(frec)==2 ? "selected" : ""%>>Dos veces por semana</option>
                                <option value="1" <%=Integer.parseInt(frec)==1 ? "selected" : ""%>>Semanal</option>
                            </select>
                            <div>
                                <c:if test="${not empty erroresEvento['errorFrecuencia']}">
                                    <span class="error-message" style="color: red;">${erroresEvento['errorFrecuencia']}</span>
                                </c:if>
                            </div>

                            <div id="opcionesInterdiarias" style="display:none;">
                                <label for="diaSemana" class="form-label" style="color:#023047;"><b>Elegir días:</b></label>
                                <select id="diasInterdiarios" class="form-select mb-3" aria-label="Default select example" name="opcionesDias" required>
                                    <option selected>Seleccione la opción: </option>
                                    <option value="Lunes-Miércoles" <%=opcionesDias.equals("Lunes-Miércoles") ? "selected" : ""%>>Lunes-Miércoles</option>
                                    <option value="Martes-Jueves" <%=opcionesDias.equals("Martes-Jueves") ? "selected" : ""%>>Martes-Jueves</option>
                                </select>
                            </div>

                            <div id="opcionesSemanal" style="display:none;">
                                <label for="diaSemana" class="form-label" style="color:#023047;"><b>Elegir día:</b></label>
                                <select id="diaSemana" class="form-select mb-3" aria-label="Default select example" name="opcionesDias1" required>
                                    <option selected>Seleccione el día a la semana:</option>
                                    <option value="Lunes" <%=opcionesDias1.equals("Lunes") ? "selected" : ""%>>Lunes</option>
                                    <option value="Martes" <%=opcionesDias1.equals("Martes") ? "selected" : ""%>>Martes</option>
                                    <option value="Miércoles" <%=opcionesDias1.equals("Miércoles") ? "selected" : ""%>>Miércoles</option>
                                    <option value="Jueves" <%=opcionesDias1.equals("Jueves") ? "selected" : ""%>>Jueves</option>
                                    <option value="Viernes" <%=opcionesDias1.equals("Viernes") ? "selected" : ""%>>Viernes</option>
                                </select>
                            </div>
                            <!----Fin de la selectiva----->
                            <%}%>
                            <script>
                                function mostrarOpciones() {
                                    var frecuenciaSeleccionada = document.getElementById("frecuenciaEvento").value;
                                    var opcionesInterdiarias = document.getElementById("opcionesInterdiarias");
                                    var opcionesSemanal = document.getElementById("opcionesSemanal");

                                    if (frecuenciaSeleccionada === "2") {
                                        opcionesInterdiarias.style.display = "block";
                                        opcionesSemanal.style.display = "none";
                                    } else if (frecuenciaSeleccionada === "1") {
                                        opcionesInterdiarias.style.display = "none";
                                        opcionesSemanal.style.display = "block";
                                    } else {
                                        opcionesInterdiarias.style.display = "none";
                                        opcionesSemanal.style.display = "none";
                                    }
                                }

                                window.onload = function() {
                                    mostrarOpciones();
                                };
                            </script>

                            <!---Cantidad de vacantes disponibles-->
                            <% String ValueY = null;%>
                            <%if (!erroresEvento.isEmpty()){
                                ValueY=(String) request.getAttribute("cantVacantes");
                            }else{ValueY= String.valueOf(evento.getCantidadVacantes());}%>
                            <label for="cantidadVacantes" class="form-label" style="color:#023047;"><b>Cantidad de vacantes:</b></label>
                            <input type="number" class="form-control" id="cantidadVacantes" placeholder="Escribir" name="cantidadVacantes" value="<%=ValueY%>" required>
                            <div>
                                <c:if test="${not empty erroresEvento['errorVacantes']}">
                                    <span class="error-message" style="color: red;">${erroresEvento['errorVacantes']}</span>
                                </c:if>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-light rounded h-100 p-4">
                            <!-- Fecha del evento -->
                            <div class="mb-3">
                                <% String Value5 = null; if(erroresEvento.isEmpty()){Value5 = evento.getFecha_inicio();}else{Value5 = (String) request.getAttribute("fecha_inicio");}%>
                                <label for="fecha_inicio" class="form-label" style="color:#023047;"><b>Fecha de inicio:</b></label>
                                <input type="date" class="form-control" id="fecha_inicio" name="fecha_inicio" value="<%=Value5%>" required>
                                <div>
                                    <c:if test="${not empty erroresEvento['fechaInicio']}">
                                        <span class="error-messege" style="color: red;">${erroresEvento['fechaInicio']}</span>
                                    </c:if>
                                </div>
                                <div>
                                    <c:if test="${not empty erroresEvento['errorFechaInicio']}">
                                        <span class="error-message" style="color: red;">${erroresEvento['errorFechaInicio']}</span>
                                    </c:if>
                                </div>
                            </div>
                            <div class="mb-3">
                                <% String Value6 = null; if(erroresEvento.isEmpty()){Value6 = evento.getFecha_fin();}else{Value6 = (String) request.getAttribute("fecha_fin");}%>
                                <label for="fecha_fin" class="form-label" style="color:#023047;"><b>Fecha de finalización:</b></label>
                                <input type="date" class="form-control" id="fecha_fin" name="fecha_fin" value="<%=Value6%>" required>
                                <div>
                                    <c:if test="${not empty erroresEvento['fechaFin']}">
                                        <span class="error-message" style="color: red;">${erroresEvento['fechaFin']}</span>
                                    </c:if>
                                </div>
                                <div>
                                    <c:if test="${not empty erroresEvento['errorFechaFin']}">
                                        <span class="error-message" style="color: red;">${erroresEvento['errorFechaFin']}</span>
                                    </c:if>
                                </div>
                            </div>
                            <!-- Hora de inicio del evento -->
                            <div class="mb-3">
                                <% String Value7 = null; if(erroresEvento.isEmpty()){Value7 = evento.getHora_inicio();}else{Value7 = (String) request.getAttribute("hora_inicio");}%>
                                <label for="hora_inicio" class="form-label" style="color:#023047;"><b>Hora de inicio:</b></label>
                                <input type="time" class="form-control" id="hora_inicio" name="hora_inicio" value="<%=Value7%>" required>
                                <div>
                                    <c:if test="${not empty erroresEvento['errorHoraFin']}">
                                        <span class="error-message" style="color: red;">${erroresEvento['errorHoraFin']}</span>
                                    </c:if>
                                </div>
                            </div>
                            <!-- Hora de finalización del evento -->
                            <div class="mb-3">
                                <% String Value8 = null; if(erroresEvento.isEmpty()){Value8 = evento.getHora_fin();}else{Value8 = (String) request.getAttribute("hora_fin");}%>
                                <label for="hora_fin" class="form-label" style="color:#023047;"><b>Hora de finalización:</b></label>
                                <input type="time" class="form-control" id="hora_fin" name="hora_fin" value="<%=Value8%>" required>
                                <div>
                                    <c:if test="${not empty erroresEvento['horaFin30Min']}">
                                        <span class="error-message" style="color: red;">${erroresEvento['horaFin30Min']}</span>
                                    </c:if>
                                </div>
                            </div>
                            <!-- Lista de materiales  -->
                            <div class="mb-3">
                                <label for="listaMateriales" class="form-label"  style="color:#023047;"><b>Materiales:</b></label>
                                <% String ValueX = null; if(erroresEvento.isEmpty()){ValueX =evento.getListaMateriales();}else{ValueX = (String) request.getAttribute("materiales");}%>
                                <input type="text" class="form-control" id="listaMateriales" name="listaMateriales" value="<%=ValueX%>" required>
                            </div>
                        </div>
                    </div>

                    <!-- Subir foto -->
                    <div class="col-sm-12 col-xl-6">
                        <div class="rounded h-100 p-4" style="background-color:#fb8500">
                            <h5 class="mb-4" style="color:#023047;"><b>Subir una foto para la portada</b></h5>
                            <div class="mb-3">
                                <label for="foto" class="form-label" style="color:#023047;"><b>Formatos permitidos: .jpg .jpeg o .png</b></label>
                                <input class="form-control" type="file" id="foto" accept=".jpg, .jpeg, .png" name="foto">
                            </div>
                            <!-- Contenedor para la previsualización de la imagen -->
                            <div class="mb-3">
                                <img id="preview" src="ImagenServlet?action=evento&idImagenEvento=<%=evento.getIdEvento()%>" alt="Vista previa de la imagen" class="img-thumbnail" style="display: <%=evento.getFoto() != null ? "block" : "none"%>;">

                            </div>
                        </div>
                    </div>
                    <script>
                        document.getElementById('foto').addEventListener('change', function(event) {
                            var file = event.target.files[0];
                            if (file) {
                                var reader = new FileReader();
                                reader.onload = function(e) {
                                    var imgElement = document.getElementById('preview');
                                    imgElement.src = e.target.result;
                                    imgElement.style.display = 'block'; // Muestra la imagen
                                };
                                reader.readAsDataURL(file);
                            }
                        });
                    </script>


                    <script>
                        document.getElementById('fotoGaleria').addEventListener('change', function(event) {
                            var file = event.target.files[0];
                            if (file) {
                                var reader = new FileReader();
                                reader.onload = function(e) {
                                    var imgElement = document.getElementById('previewGaleria');
                                    imgElement.src = e.target.result;
                                    imgElement.style.display = 'block'; // Muestra la imagen
                                };
                                reader.readAsDataURL(file);
                            }
                        });
                    </script>
                </div>
            </div>
            <!-- Form End -->
            <!-- Botón para actualizar evento -->
            <div class="d-flex justify-content-between" style="margin: 30px; padding-top: 2%;">
                <a href="<%=request.getContextPath()%>/CoordinadorServlet?action=lista"  class="btn btn-primary" style="background-color: #023047; border-color: #023047; color: #ffffff;"><b>Cancelar</b></a>
                <button type="submit" class="btn btn-primary" style="background-color: #023047; border-color: #023047; color: #ffffff;"><b>Guardar Cambios</b></button>
                <!--<a href="<%=request.getContextPath()%>/CoordinadorServlet?action=lista"  class="btn btn-primary" style="background-color: #023047; border-color: #023047; color: #ffffff;"><b>Siguiente</b></a>-->
            </div>
            <script>
                function validarFormulario() {
                    var camposObligatorios = document.querySelectorAll('input[required], select[required], textarea[required]');
                    var formularioValido = true;

                    camposObligatorios.forEach(function(campo) {
                        if (!campo.value.trim()) {
                            campo.classList.add('highlight');
                            formularioValido = false;
                        } else {
                            campo.classList.remove('highlight');
                        }
                    });

                    if (!formularioValido) {
                        document.getElementById('error-message').style.display = 'block';
                    } else {
                        document.getElementById('error-message').style.display = 'none';
                    }

                    return formularioValido;
                }
            </script>
        </form>
        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light rounded-top p-4">
                <div class="row">
                    <div class="col-12 col-sm-6 text-center text-sm-start">
                        &copy; <a >TelevecinosUnidos</a>, All Right Reserved.
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
