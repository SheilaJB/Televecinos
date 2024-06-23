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
        if(usuarioLogged != null &&  usuarioLogged.getIdUsuario()>0) {
            if(request.getParameter("logout") != null){
                httpSession.invalidate();
            }
            response.sendRedirect(request.getContextPath());
        }else {
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
            UsuarioB usuarioB =usuarioDao.obtenerUsuario1(correo);
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("usuarioLogueado", usuarioB);
            switch (IdRol){
                case 2:
                    response.sendRedirect(request.getContextPath() + "/VecinoServlet");
                    break;
                case 3:
                    response.sendRedirect(request.getContextPath() + "/CoordinadorServlet");
                    break;
                case 4:
                    SerenazgoDTO serenazgoDTO = usuarioDao.obtenerUsuarioSerenazgo(correo);

                    httpSession.setAttribute("serenazgoLogeado", serenazgoDTO);
                    response.sendRedirect(request.getContextPath() + "/SerenazgoServlet");
                    break;
                case 5:
                    response.sendRedirect(request.getContextPath());
            }

        }else{
            System.out.println("Correo o contraseña inválidos");
            request.setAttribute("err","Correo o contraseña incorrectos");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }

    }

}
