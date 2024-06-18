package org.example.televecinosunidos_appweb.servlets;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import org.example.televecinosunidos_appweb.model.beans.*;
import org.example.televecinosunidos_appweb.model.daos.*;

import java.io.IOException;


@WebServlet (name = "LoginServlet", value= "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/index.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String correo = request.getParameter("correo");
        String contrasena= request.getParameter("contrasena");
        UsuarioDao usuarioDao= new UsuarioDao();

        if(usuarioDao.validarUsuarioPassword(correo, contrasena)){
            //aca se da el ingreso
            UsuarioB usuarioB =usuarioDao.obtenerUsuario1(correo);
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("usuarioLogueado", usuarioB);
            System.out.println("Correo y contraseña válidos");
            response.sendRedirect(request.getContextPath());
        }else{
            System.out.println("Correo o contraseña inválidos");
            request.setAttribute("err","Correo o contraseña incorrectos");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }

    }

}
