package org.example.televecinosunidos_appweb.model.daos;

import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ImagenDao extends BaseDao{
    public void listarImgEvento(int id, HttpServletResponse response){
        String sql = "SELECT * FROM televecinosdb.eventos where idEventos=" + id;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/*");
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);){
            outputStream=response.getOutputStream();
            ResultSet rs=ps.executeQuery();
            if (rs.next()){
                inputStream=rs.getBinaryStream("foto");
            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i =0;
            while((i=bufferedInputStream.read())!=-1){
                bufferedOutputStream.write(i);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
