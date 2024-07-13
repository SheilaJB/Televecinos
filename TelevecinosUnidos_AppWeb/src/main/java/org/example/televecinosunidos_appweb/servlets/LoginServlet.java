package org.example.televecinosunidos_appweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.televecinosunidos_appweb.model.beans.*;
import org.example.televecinosunidos_appweb.model.daos.*;
import org.example.televecinosunidos_appweb.model.dto.SerenazgoDTO;
import org.example.televecinosunidos_appweb.util.EnviarEmail;
import org.example.televecinosunidos_appweb.util.GeneraContrasena;
import org.example.televecinosunidos_appweb.util.ValidacionesInicio;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

@WebServlet(name = "LoginServlet", urlPatterns ={"/LoginServlet",""} )
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Configuración de encabezados para controlar la caché


        String action = request.getParameter("action");
        HttpSession httpSession = request.getSession();

        if (action != null && action.equals("register")) {
            cargarUrbanizaciones(request);
            request.getRequestDispatcher("WEB-INF/login/register.jsp").forward(request, response);
        } else if (action != null && action.equals("forgotPassword")) {
            request.getRequestDispatcher("WEB-INF/login/olvidasteContrasena.jsp").forward(request, response);
        } else {
            UsuarioB usuarioLogged = (UsuarioB) httpSession.getAttribute("usuarioLogueado");
            SerenazgoDTO serenazgoLogeado = (SerenazgoDTO) httpSession.getAttribute("serenazgoLogeado");

            if (usuarioLogged != null && usuarioLogged.getIdUsuario() > 0) {
                if (request.getParameter("action") != null && request.getParameter("action").equals("logout")) {
                    httpSession.invalidate();
                    response.sendRedirect(request.getContextPath() + "/LoginServlet");

                } else {
                    switch (usuarioLogged.getIdRol()) {
                        case 2:
                            response.sendRedirect(request.getContextPath() + "/VecinoServlet");
                            break;
                        case 3:
                            response.sendRedirect(request.getContextPath() + "/CoordinadorServlet");
                            break;
                        case 5:
                            response.sendRedirect(request.getContextPath() + "/AdministradorServlet");
                            break;
                    }
                }
            } else if (serenazgoLogeado != null && serenazgoLogeado.getIdUsuario() > 0) {
                if (request.getParameter("action") != null && request.getParameter("action").equals("logout")) {

                    httpSession.invalidate();
                    response.sendRedirect(request.getContextPath() + "/LoginServlet");
                } else {
                    response.sendRedirect(request.getContextPath() + "/SerenazgoServlet");
                }
            } else {
                request.getRequestDispatcher("/WEB-INF/login/index.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Configuración de encabezados para controlar la caché
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0); // Proxies.

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");

        if (action != null && action.equals("register")) {
            // Lógica de registro de usuario
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String dni = request.getParameter("dni");
            String direccion = request.getParameter("direccion");
            int urbanizacion_idUrbanizacion = Integer.parseInt(request.getParameter("urbanizacion"));
            String correo = request.getParameter("correo");
            int primerIngreso = 1; // Valor predeterminado para primerIngreso
            int genero = Integer.parseInt(request.getParameter("genero"));

            // Validar los campos
            if (!ValidacionesInicio.validarNombre(nombre)) {
                response.sendRedirect(request.getContextPath() + "/LoginServlet?action=register&err=" + URLEncoder.encode("El nombre no es válido. La primera letra debe estar en mayúscula. Debe tener una longitud máxima de 100 caracteres y no contener caracteres especiales.", StandardCharsets.UTF_8.toString()));
                return;
            }

            if (!ValidacionesInicio.validarApellido(apellido)) {
                response.sendRedirect(request.getContextPath() + "/LoginServlet?action=register&err=" + URLEncoder.encode("El apellido no es válido. La primera letra debe estar en mayúscula. Debe tener una longitud máxima de 100 caracteres y no contener caracteres especiales.", StandardCharsets.UTF_8.toString()));
                return;
            }

            if (!ValidacionesInicio.validarDni(dni)) {
                response.sendRedirect(request.getContextPath() + "/LoginServlet?action=register&err=" + URLEncoder.encode("El DNI no es válido. Debe tener exactamente 8 dígitos numéricos.", StandardCharsets.UTF_8.toString()));
                return;
            }

            if (!ValidacionesInicio.validarDireccion(direccion)) {
                response.sendRedirect(request.getContextPath() + "/LoginServlet?action=register&err=" + URLEncoder.encode("La dirección no es válida. Debe tener una longitud máxima de 150 caracteres.", StandardCharsets.UTF_8.toString()));
                return;
            }

            if (!ValidacionesInicio.validarCorreo(correo)) {
                response.sendRedirect(request.getContextPath() + "/LoginServlet?action=register&err=" + URLEncoder.encode("El correo no es válido. Debe ser una dirección de Gmail.", StandardCharsets.UTF_8.toString()));
                return;
            }

            UsuarioDao usuarioDao = new UsuarioDao();

            if (!usuarioDao.esDniUnico(dni)) {
                response.sendRedirect(request.getContextPath() + "/LoginServlet?action=register&err=" + URLEncoder.encode("El DNI ya está registrado. Por favor, use un DNI diferente.", StandardCharsets.UTF_8.toString()));
                return;
            }

            System.out.println("Intentando registrar usuario: " + nombre + " " + apellido + " con correo: " + correo);
            boolean registrado = usuarioDao.registrarUsuario(nombre, apellido,dni, direccion, urbanizacion_idUrbanizacion, correo, primerIngreso,genero);

            if (registrado) {
                System.out.println("Registro exitoso para el usuario: " + correo);
                response.sendRedirect(request.getContextPath() + "/LoginServlet?action=register&success=" + URLEncoder.encode("Registro exitoso. Revisa tu correo para más indicaciones.", StandardCharsets.UTF_8.toString()));
            } else {
                System.out.println("Error al registrar el usuario: " + correo);
                response.sendRedirect(request.getContextPath() + "/LoginServlet?action=register&err=" + URLEncoder.encode("Error al registrar el usuario.", StandardCharsets.UTF_8.toString()));
            }
        } else if (action != null && action.equals("forgotPassword")) {

            String correo = request.getParameter("correo");

            UsuarioDao usuarioDao = new UsuarioDao();

            if (usuarioDao.existeCorreo(correo)) {
                // Generar contraseña temporal
                String tempPassword = GeneraContrasena.generateTemporaryPassword();

                try {
                    usuarioDao.actualizarContrasenaTemporal(correo, GeneraContrasena.hashPassword(tempPassword));
                } catch (NoSuchAlgorithmException e) {
                    throw new RuntimeException(e);
                }

                // Enviar correo con la contraseña temporal
                EnviarEmail enviarEmail = new EnviarEmail();
                enviarEmail.sendEmail(correo, tempPassword);

                // Redirigir con mensaje de éxito
                response.sendRedirect(request.getContextPath() + "/LoginServlet?action=forgotPassword&success=" + URLEncoder.encode("Revisa tu correo para mayor información.", StandardCharsets.UTF_8.toString()));
            } else {
                // Redirigir con mensaje de error si el correo no está registrado
                response.sendRedirect(request.getContextPath() + "/LoginServlet?action=forgotPassword&err=" + URLEncoder.encode("El correo electrónico no está registrado. Por favor, intenta de nuevo.", StandardCharsets.UTF_8.toString()));
            }
        }
        else {
            // Lógica de inicio de sesión de usuario
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contrasena");
            UsuarioDao usuarioDao = new UsuarioDao();

            if (usuarioDao.validarUsuarioPassword(correo, contrasena)) {
                int IdRol = usuarioDao.obtenerIdPorCorreo(correo);
                UsuarioB usuarioB = null;
                HttpSession httpSession = request.getSession();

                switch (IdRol) {
                    case 2:
                        usuarioB = usuarioDao.obtenerUsuario1(correo);
                        httpSession.setAttribute("usuarioLogueado", usuarioB);

                        if(usuarioB.getIsBan()==1){
                            request.setAttribute("errorBaneado", "El usuario está baneado");
                            request.getRequestDispatcher("WEB-INF/login/index.jsp").forward(request, response);
                        }else{
                            response.sendRedirect(request.getContextPath() + "/VecinoServlet");
                        }
                        break;
                    case 3:
                        usuarioB = usuarioDao.obtenerUsuario1(correo);
                        httpSession.setAttribute("usuarioLogueado", usuarioB);
                        if(usuarioB.getIsBan()==1){
                            request.setAttribute("errorBaneado", "El usuario está baneado");
                            request.getRequestDispatcher("WEB-INF/login/index.jsp").forward(request, response);
                        }else{
                            response.sendRedirect(request.getContextPath() + "/CoordinadorServlet");
                        }

                        break;
                    case 4:
                        SerenazgoDTO serenazgoDTO = usuarioDao.obtenerUsuarioSerenazgo(correo);
                        httpSession.setAttribute("serenazgoLogeado", serenazgoDTO);
                        if(serenazgoDTO.isBan()){
                            request.setAttribute("errorBaneado", "El usuario está baneado");
                            request.getRequestDispatcher("WEB-INF/login/index.jsp").forward(request, response);
                        }else{
                            response.sendRedirect(request.getContextPath() + "/SerenazgoServlet");
                        }
                        break;
                    case 5:
                        usuarioB = usuarioDao.obtenerUsuario1(correo);
                        httpSession.setAttribute("usuarioLogueado", usuarioB);
                        response.sendRedirect(request.getContextPath()+ "/AdministradorServlet");
                        break;
                }
            } else {
                System.out.println("Correo o contraseña inválidos");
                request.setAttribute("err", "Correo o contraseña incorrectos");
                request.getRequestDispatcher("WEB-INF/login/index.jsp").forward(request, response);
            }
        }
    }

    private void cargarUrbanizaciones(HttpServletRequest request) {
        UsuarioDao usuarioDao = new UsuarioDao();
        ArrayList<UsuarioB> urbanizaciones = usuarioDao.listarUrbanizaciones();
        request.setAttribute("urbanizaciones", urbanizaciones);
    }
}
