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
        String action = request.getParameter("action"); // Obtener la acción de la solicitud

        System.out.println("idImagenIncidencia: " + idImagenIncidencia);

        switch (action) {
            case "evento":
                int id = Integer.parseInt(idImagenEvento);
                String sqlEvento = "SELECT foto, nombreFoto FROM televecinosdb.eventos WHERE idEventos =";
                imagenDao.listarImagen(sqlEvento, id, response);
                break;
            case "incidencia":
                int id2 = Integer.parseInt(idImagenIncidencia);
                String sqlIncidencia = "SELECT foto, nombreFoto FROM televecinosdb.incidencias WHERE idIncidencias =";
                imagenDao.listarImagen(sqlIncidencia, id2, response);
                break;
            case "galeria":
                int idEvento = Integer.parseInt(request.getParameter("idEvento"));
                String nombreFoto = request.getParameter("nombreFoto");
                int indiceFoto = Integer.parseInt(nombreFoto.substring("foto".length()));
                String sqlGaleria = "SELECT foto" + indiceFoto + " AS foto, nombreFoto" + indiceFoto + " AS nombreFoto FROM galeria WHERE eventos_idEventos = ";
                imagenDao.listarImagen(sqlGaleria, idEvento, response);
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
