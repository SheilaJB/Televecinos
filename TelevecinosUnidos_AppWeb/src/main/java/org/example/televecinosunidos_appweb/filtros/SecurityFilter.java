package org.example.televecinosunidos_appweb.filtros;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.televecinosunidos_appweb.model.beans.UsuarioB;
import org.example.televecinosunidos_appweb.model.dto.SerenazgoDTO;

import java.io.IOException;

@WebFilter("/*")
public class SecurityFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        String path = httpRequest.getRequestURI();


        if (path.contains("/SerenazgoServlet")) {
            SerenazgoDTO serenazgoLogeado = (SerenazgoDTO) (session != null ? session.getAttribute("serenazgoLogeado") : null);
            UsuarioB usuarioLogeado = (UsuarioB) (session != null ? session.getAttribute("usuarioLogueado") : null);
            if (usuarioLogeado != null && usuarioLogeado.getIdUsuario() >0) {
                String urlRol = null;
                switch (usuarioLogeado.getIdRol()) {
                    case 2:
                        urlRol = "/VecinoServlet";
                        httpResponse.sendRedirect(httpRequest.getContextPath() + urlRol);
                        return;
                    case 3:
                        urlRol = "/CoordinadorServlet";
                        httpResponse.sendRedirect(httpRequest.getContextPath() + urlRol);
                        return;
                    case 5:
                        urlRol = "/AdministradorServlet";
                        httpResponse.sendRedirect(httpRequest.getContextPath() + urlRol);
                        return;
                }



            } else if (serenazgoLogeado == null) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/loginServlet");
            }
        } else if (path.contains("/CoordinadorServlet")) {
            SerenazgoDTO serenazgoLogeado = (SerenazgoDTO) (session != null ? session.getAttribute("serenazgoLogeado") : null);
            UsuarioB usuarioLogeado = (UsuarioB) (session != null ? session.getAttribute("usuarioLogueado") : null);
            if (serenazgoLogeado != null && serenazgoLogeado.getIdUsuario() > 0) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/SerenazgoServlet");
                return;
            }else if (usuarioLogeado != null && usuarioLogeado.getIdUsuario() >0) {
                String urlRol = null;
                switch (usuarioLogeado.getIdRol()) {
                    case 2:
                        urlRol = "/VecinoServlet";
                        httpResponse.sendRedirect(httpRequest.getContextPath() + urlRol);
                        return;
                    case 5:
                        urlRol = "/AdministradorServlet";
                        httpResponse.sendRedirect(httpRequest.getContextPath() + urlRol);
                        return;
                }

            }
        }else if (path.contains("/AdministradorServlet")) {
            SerenazgoDTO serenazgoLogeado = (SerenazgoDTO) (session != null ? session.getAttribute("serenazgoLogeado") : null);
            UsuarioB usuarioLogeado = (UsuarioB) (session != null ? session.getAttribute("usuarioLogueado") : null);
            if (serenazgoLogeado != null && serenazgoLogeado.getIdUsuario() > 0) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/SerenazgoServlet");
                return;
            }else if (usuarioLogeado != null && usuarioLogeado.getIdUsuario() >0) {
                String urlRol = null;
                switch (usuarioLogeado.getIdRol()) {
                    case 2:
                        urlRol = "/VecinoServlet";
                        httpResponse.sendRedirect(httpRequest.getContextPath() + urlRol);
                        return;
                    case 3:
                        urlRol = "/CoordinadorServlet";
                        httpResponse.sendRedirect(httpRequest.getContextPath() + urlRol);
                        return;

                }

            }
        }else if (path.contains("/VecinoServlet")) {
            int x = 1;
            SerenazgoDTO serenazgoLogeado = (SerenazgoDTO) (session != null ? session.getAttribute("serenazgoLogeado") : null);
            UsuarioB usuarioLogeado = (UsuarioB) (session != null ? session.getAttribute("usuarioLogueado") : null);
            if (serenazgoLogeado != null && serenazgoLogeado.getIdUsuario() > 0) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/SerenazgoServlet");
                return;
            }else if (usuarioLogeado != null && usuarioLogeado.getIdUsuario() >0) {
                String urlRol = null;
                switch (usuarioLogeado.getIdRol()) {

                    case 3:
                        urlRol = "/CoordinadorServlet";
                        httpResponse.sendRedirect(httpRequest.getContextPath() + urlRol);
                        return;
                    case 5:
                        urlRol = "/AdministradorServlet";
                        httpResponse.sendRedirect(httpRequest.getContextPath() + urlRol);
                        return;
                }

            }
        }

        /*if (path.contains("/SerenazgoServlet")) {
            SerenazgoDTO serenazgoLogeado = (SerenazgoDTO) (session != null ? session.getAttribute("serenazgoLogeado") : null);
            if (serenazgoLogeado == null || serenazgoLogeado.getIdUsuario() <= 0) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/LoginServlet");
                return;
            }
        } else if (path.contains("/CoordinadorServlet") || path.contains("/AdministradorServlet") || path.contains("/VecinoServlet")) {
            SerenazgoDTO serenazgoLogeado = (SerenazgoDTO) (session != null ? session.getAttribute("serenazgoLogeado") : null);
            if (serenazgoLogeado != null && serenazgoLogeado.getIdUsuario() > 0) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/SerenazgoServlet");
                return;
            }
        }*/

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
