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

        String action = request.getParameter("action"); // Obtener la acción de la solicitud

        switch (action) {
            case "evento":
                int idEvento = Integer.parseInt(request.getParameter("idImagenEvento"));
                String sqlEvento = "SELECT foto, nombreFoto FROM televecinosdb.eventos WHERE idEventos =";
                imagenDao.listarImagen(sqlEvento, idEvento, response);
                break;
            case "incidencia":
                int idIncidencia = Integer.parseInt(request.getParameter("idImagenIncidencia"));
                String sqlIncidencia = "SELECT foto, nombreFoto FROM televecinosdb.incidencias WHERE idIncidencias =";
                imagenDao.listarImagen(sqlIncidencia, idIncidencia, response);
                break;
            case "galeria":
                int idGaleria = Integer.parseInt(request.getParameter("idEvento"));
                String nombreFoto = request.getParameter("nombreFoto");
                int indiceFoto = Integer.parseInt(nombreFoto.substring(4)); // Asumiendo que 'foto' es la base del nombre
                String sqlGaleria = "SELECT foto" + indiceFoto + " AS foto, nombreFoto" + indiceFoto + " AS nombreFoto FROM galeria WHERE eventos_idEventos = ";
                imagenDao.listarImagen(sqlGaleria, idGaleria, response);
                break;
            default:
                // Manejo de acción no reconocida
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
