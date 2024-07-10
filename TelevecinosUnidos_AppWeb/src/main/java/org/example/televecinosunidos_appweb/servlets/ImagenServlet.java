package org.example.televecinosunidos_appweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.televecinosunidos_appweb.model.daos.ImagenDao;

import java.io.IOException;

@WebServlet(name = "ImagenServlet", value = "/ImagenServlet")
public class ImagenServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ImagenDao imagenDao = new ImagenDao();

        String idImagenEvento = request.getParameter("idImagenEvento");
        String idImagenIncidencia = request.getParameter("idImagenIncidencia");

        if (idImagenEvento != null) {
            int id = Integer.parseInt(idImagenEvento);
            String sql = "SELECT foto FROM eventos WHERE idEventos = ?";
            imagenDao.listarImagen(sql, id, response);
        } else if (idImagenIncidencia != null) {
            int id = Integer.parseInt(idImagenIncidencia);
            String sql = "SELECT foto FROM incidencias WHERE idIncidencias = ?";
            imagenDao.listarImagen(sql, id, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
