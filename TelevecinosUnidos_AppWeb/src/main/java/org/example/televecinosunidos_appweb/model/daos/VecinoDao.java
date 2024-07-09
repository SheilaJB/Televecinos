package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.EventoB;
import org.example.televecinosunidos_appweb.model.beans.SerenazgoB;
import org.example.televecinosunidos_appweb.model.beans.UsuarioB;

import java.sql.*;
import java.util.ArrayList;

public class VecinoDao extends BaseDao{
    public ArrayList<UsuarioB> listarVecinos() {

        String sql = "SELECT idUsuario,nombre,apellido,dni,direccion,correo,cantidadIncidenciasFalsas\n" +
                "FROM televecinosdb.usuario \n" +
                "where Rol_idRol = 2 and isBan=0 \n" +
                "order by usuario.idUsuario desc;";

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
                usuarioB.setCantidadIncidenciasFalsas(rs.getInt(7));

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

    public void banearVecino (String idUsuario) throws SQLException {
        String sql = "UPDATE televecinosdb.usuario SET isBan = 1 WHERE idUsuario = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, idUsuario);
            pstmt.executeUpdate();

        }
    }

    public void promoverACoordinadorDeportes (String idUsuario) throws SQLException {
        String sql = "UPDATE televecinosdb.usuario SET TipoCoordinador_idTipoCoordinador = 2,Rol_idRol=3  WHERE idUsuario = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, idUsuario);
            pstmt.executeUpdate();

        }
    }



    public void promoverACoordinadorCultura (String idUsuario) throws SQLException {
        String sql = "UPDATE televecinosdb.usuario SET TipoCoordinador_idTipoCoordinador = 1, Rol_idRol=3  WHERE idUsuario = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, idUsuario);
            pstmt.executeUpdate();

        }
    }




    public ArrayList<UsuarioB> listarBaneados() {

        String sql = "SELECT idUsuario,nombre,apellido,dni,direccion,correo\n" +
                "FROM televecinosdb.usuario \n" +
                "where isBan=1" ;


        ArrayList<UsuarioB> listaBaneados = new ArrayList<>();

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


                listaBaneados.add(usuarioB);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return listaBaneados;
    }


    public ArrayList<UsuarioB> buscarVecinoPorNombre(String textoBuscar) {
        String sql = "SELECT idUsuario, nombre, apellido, dni, direccion, correo " +
                "FROM televecinosdb.usuario " +
                "WHERE Rol_idRol = 2 AND isBan = 0 AND (nombre LIKE ? OR apellido LIKE ? OR dni LIKE ?)\n" +
                "order by idUsuario desc;";


        ArrayList<UsuarioB> listaVecinos = new ArrayList<>();

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, textoBuscar+ "%");
            pstmt.setString(2, textoBuscar+ "%");
            pstmt.setString(3, textoBuscar);
            try(ResultSet rs = pstmt.executeQuery()){
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

            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return listaVecinos;


    }
}
