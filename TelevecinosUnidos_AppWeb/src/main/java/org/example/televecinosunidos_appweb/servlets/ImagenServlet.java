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
        if (request.getParameter("idImagenEvento") != null){
            int id = Integer.parseInt(request.getParameter("idImagenEvento"));
            imagenDao.listarImgEvento(id,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
