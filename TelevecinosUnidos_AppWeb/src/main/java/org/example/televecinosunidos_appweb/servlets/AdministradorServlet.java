package org.example.televecinosunidos_appweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.televecinosunidos_appweb.model.beans.EventoB;
import org.example.televecinosunidos_appweb.model.beans.ProfesoresEvento;
import org.example.televecinosunidos_appweb.model.beans.SerenazgoB;
import org.example.televecinosunidos_appweb.model.beans.UsuarioB;
import org.example.televecinosunidos_appweb.model.daos.SerenazgoDao;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "AdministradorServlet", urlPatterns = {"/AdministradorServlet", ""})
public class AdministradorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        SerenazgoDao serenazgoDao = new SerenazgoDao();
        ArrayList<SerenazgoB> listarSerenazgos = serenazgoDao.listarSerenazgos();
        String action = request.getParameter("action")==null?"inicioAdmin":request.getParameter("action");
        String vista ;
        switch (action) {
            case "listaSerenazgo_A":
                vista = "WEB-INF/Administrador/listaSerenazgo_A.jsp";
                request.setAttribute("lista",listarSerenazgos);
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "verSerenazgo":
                String idSerenazgo = request.getParameter("idSerenazgo");
                request.setAttribute("serenazgo",serenazgoDao.buscarSerenazgoPorId(idSerenazgo));
                vista = "WEB-INF/Administrador/DetalleSerenazgo_A.jsp";
                request.getRequestDispatcher(vista).forward(request, response);
                break;
            case "registroSerenazgo":
                request.getRequestDispatcher("WEB-INF/Administrador/registroSerenazgo.jsp").forward(request,response);
                break;
            case "banearSerenazgo":
                break;
            default:
                request.getRequestDispatcher("WEB-INF/Administrador/" + action + ".jsp").forward(request,response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String action = request.getParameter("action") == null ? "registrarSerenazgo" : request.getParameter("action");
        switch (action){
            case "registrarSerenazgo":
                SerenazgoDao serenazgoDao = new SerenazgoDao();
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String dni = request.getParameter("dni");
                String direccion = request.getParameter("direccion");
                String numTelefono = request.getParameter("numTelefono");
                String fechaNacimiento = request.getParameter("fechaNacimiento");
                int turno = Integer.parseInt(request.getParameter("turno"));
                int tipo = Integer.parseInt(request.getParameter("tipo"));
                String correo = request.getParameter("correo");
                String contrasenia = request.getParameter("contrasenia");
                int pregFrecuentes = 1;
                int idRol = 4;
                int isBan = 0;


                UsuarioB us = new UsuarioB();
                us.setNombre(nombre);
                us.setApellido(apellido);
                us.setDni(dni);
                us.setDireccion(direccion);
                us.setCorreo(correo);
                us.setContrasenia(contrasenia);
                us.setPreguntasFrecuentes_idTable2(pregFrecuentes);
                us.setIdRol(idRol);
                us.setIsBan(isBan);

                SerenazgoB serenazgoB = new SerenazgoB();
                serenazgoB.setNumTelefono(numTelefono);
                serenazgoB.setFechaNacimiento(fechaNacimiento);
                serenazgoB.setIdTurnoSerenazgo(turno);
                serenazgoB.setIdTipoSerenazgo(tipo);

                serenazgoB.setUsuario(us);
                serenazgoDao.registrarSerenazgo(serenazgoB);

                response.sendRedirect(request.getContextPath() + "/AdministradorServlet");
                break;
            case "":
                break;
        }












    }
}
