package org.example.televecinosunidos_appweb.model.daos;

import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ImagenDao extends BaseDao{
    public void listarImagen( String sql, int id, HttpServletResponse response) {

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String nombreArchivo = rs.getString("nombreFoto");
                String tipoArchivo = getContentTypeByFileName(nombreArchivo);
                response.setContentType(tipoArchivo);
                response.setHeader("Content-Disposition", "inline; filename=\"" + nombreArchivo + "\"");

                // Leer y escribir la imagen en la respuesta
                try (InputStream inputStream = rs.getBinaryStream("foto");
                     BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream);
                     OutputStream outputStream = response.getOutputStream();
                     BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(outputStream)) {

                    byte[] buffer = new byte[4096];
                    int bytesRead;
                    while ((bytesRead = bufferedInputStream.read(buffer)) != -1) {
                        bufferedOutputStream.write(buffer, 0, bytesRead);
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error SQL al obtener la imagen: " + e.getMessage(), e);
        } catch (IOException e) {
            throw new RuntimeException("Error de E/S al escribir la imagen: " + e.getMessage(), e);
        }
    }

    private String getContentTypeByFileName(String fileName) {
        if (fileName.endsWith(".png")) {
            return "image/png";
        } else if (fileName.endsWith(".jpg") || fileName.endsWith(".jpeg")) {
            return "image/jpeg";
        } else if (fileName.endsWith(".gif")) {
            return "image/gif";
        } else {
            return "application/octet-stream";
        }
    }

}