package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.SerenazgoB;
import org.example.televecinosunidos_appweb.model.beans.UsuarioB;

import java.sql.*;
import java.util.ArrayList;

public class VecinoDao extends BaseDao{
    public ArrayList<UsuarioB> listarVecinos() {

        String sql = "SELECT idUsuario,nombre,apellido,dni,direccion,correo\n" +
                "FROM televecinosdb.usuario \n" +
                "where Rol_idRol = 2 and isBan=0" ;


        ArrayList<UsuarioB> listaVecinos = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                UsuarioB usuarioB = new UsuarioB();
                usuarioB.setIdUsuario(rs.getInt(1));
                usuarioB.setNombre(rs.getString(2));
                usuarioB.setApellido(rs.getString(3));
                usuarioB.setDni(rs.getString(4));
                usuarioB.setDireccion(rs.getString(5));
                usuarioB.setCorreo(rs.getString(6));


                listaVecinos.add(usuarioB);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return listaVecinos;
    }

    public UsuarioB buscarVecinoPorId(String idVecino) {
        UsuarioB usuarioB = new UsuarioB();
        String sql = "SELECT * \n" +
                "FROM televecinosdb.usuario \n" +
                "WHERE idUsuario=?;";


        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,idVecino);

            try(ResultSet rs = pstmt.executeQuery()){

                if(rs.next()) {
                    usuarioB.setIdUsuario(rs.getInt(1));
                    usuarioB.setNombre(rs.getString(2));
                    usuarioB.setApellido(rs.getString(3));
                    usuarioB.setDni(rs.getString(4));
                    usuarioB.setDireccion(rs.getString(5));
                    usuarioB.setCorreo(rs.getString(6));

                }

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return usuarioB;
    }
}
