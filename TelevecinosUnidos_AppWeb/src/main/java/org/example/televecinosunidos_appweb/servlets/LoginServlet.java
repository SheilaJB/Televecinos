package org.example.televecinosunidos_appweb.servlets;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import org.example.televecinosunidos_appweb.model.beans.*;
import org.example.televecinosunidos_appweb.model.daos.*;
import org.example.televecinosunidos_appweb.model.dto.SerenazgoDTO;

import java.io.IOException;
import java.util.ArrayList;


@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UsuarioDao usuarioDao = new UsuarioDao();
        ArrayList<UsuarioB> urbanizaciones = usuarioDao.listarUrbanizaciones();
        request.setAttribute("urbanizaciones", urbanizaciones);

        // Luego, maneja el flujo de redirección e invalidación de sesión
        HttpSession httpSession = request.getSession();
        UsuarioB usuarioLogged = (UsuarioB) httpSession.getAttribute("usuarioLogueado");
        SerenazgoDTO serenazgoLogeado = (SerenazgoDTO) httpSession.getAttribute("serenazgoLogeado");

        if (usuarioLogged != null && usuarioLogged.getIdUsuario() > 0) {
            if (request.getParameter("action") != null) {
                httpSession.invalidate();
                response.sendRedirect(request.getContextPath() + "/LoginServlet");
            } else {
                switch (usuarioLogged.getIdRol()) {
                    case 2:
                        response.sendRedirect(request.getContextPath() + "/VecinoServlet");
                        break;
                    case 3:
                        response.sendRedirect(request.getContextPath() + "/CoordinadoraServlet");
                        break;
                    case 5:
                        response.sendRedirect(request.getContextPath() + "/AdministradorServlet");
                        break;
                }
            }
        } else if (serenazgoLogeado != null && serenazgoLogeado.getIdUsuario() > 0) {
            if (request.getParameter("action") != null) {
                httpSession.invalidate();
                response.sendRedirect(request.getContextPath() + "/LoginServlet");
            } else {
                response.sendRedirect(request.getContextPath() + "/SerenazgoServlet");
            }
        } else {
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null && action.equals("register")) {
            // Lógica de registro de usuario
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String dni = request.getParameter("dni");
            String direccion = request.getParameter("direccion");
            String distrito = request.getParameter("distrito");
            int urbanizacion_idUrbanizacion = Integer.parseInt(request.getParameter("urbanizacion"));
            String correo = request.getParameter("correo");

            UsuarioDao usuarioDao = new UsuarioDao();
            boolean registrado = usuarioDao.registrarUsuario(nombre, apellido, dni, direccion, distrito, urbanizacion_idUrbanizacion, correo);

            if (registrado) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            } else {
                request.setAttribute("err", "Error al registrar el usuario");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
            }
        } else {
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
                        response.sendRedirect(request.getContextPath() + "/VecinoServlet");
                        break;
                    case 3:
                        usuarioB = usuarioDao.obtenerUsuario1(correo);
                        httpSession.setAttribute("usuarioLogueado", usuarioB);
                        response.sendRedirect(request.getContextPath() + "/CoordinadorServlet");
                        break;
                    case 4:
                        SerenazgoDTO serenazgoDTO = usuarioDao.obtenerUsuarioSerenazgo(correo);
                        httpSession.setAttribute("serenazgoLogeado", serenazgoDTO);
                        response.sendRedirect(request.getContextPath() + "/SerenazgoServlet");
                        break;
                    case 5:
                        usuarioB = usuarioDao.obtenerUsuario1(correo);
                        httpSession.setAttribute("usuarioLogueado", usuarioB);
                        response.sendRedirect(request.getContextPath());
                        break;
                }
            } else {
                System.out.println("Correo o contraseña inválidos");
                request.setAttribute("err", "Correo o contraseña incorrectos");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        }
    }
}
