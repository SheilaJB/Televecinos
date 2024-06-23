package org.example.televecinosunidos_appweb.servlets;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import org.example.televecinosunidos_appweb.model.beans.*;
import org.example.televecinosunidos_appweb.model.daos.*;
import org.example.televecinosunidos_appweb.model.dto.SerenazgoDTO;

import java.io.IOException;


@WebServlet (name = "LoginServlet", value= "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession httpSession = request.getSession();
        UsuarioB usuarioLogged = (UsuarioB) httpSession.getAttribute("usuarioLogueado");
        SerenazgoDTO serenazgoLogeado = (SerenazgoDTO) httpSession.getAttribute("serenazgoLogeado");
        if(usuarioLogged != null &&  usuarioLogged.getIdUsuario()>0) {
            if(request.getParameter("action") != null){
                httpSession.invalidate();
                response.sendRedirect(request.getContextPath()+"/LoginServlet");
            }else{

                switch (usuarioLogged.getIdRol()){
                    case 2:
                        response.sendRedirect(request.getContextPath()+"/VecinoServlet");
                        break;
                    case 3:
                        response.sendRedirect(request.getContextPath()+"/CoordinadoraServlet");
                        break;
                    case 5:
                        response.sendRedirect(request.getContextPath()+"/AdministradorServlet");
                        break;
                }
            }

        } else if (serenazgoLogeado != null &&  serenazgoLogeado.getIdUsuario()>0) {
            if(request.getParameter("action") != null){
                httpSession.invalidate();
                response.sendRedirect(request.getContextPath()+"/LoginServlet");
                return;
            }
            response.sendRedirect(request.getContextPath()+"/SerenazgoServlet");
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String correo = request.getParameter("correo");
        String contrasena= request.getParameter("contrasena");
        UsuarioDao usuarioDao= new UsuarioDao();

        if(usuarioDao.validarUsuarioPassword(correo, contrasena)){
            //aca se da el ingreso
            int IdRol = usuarioDao.obtenerIdPorCorreo(correo);
            UsuarioB usuarioB = null;
            HttpSession httpSession = request.getSession();

            switch (IdRol){
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
            }

        }else{
            System.out.println("Correo o contraseña inválidos");
            request.setAttribute("err","Correo o contraseña incorrectos");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }

    }

}
