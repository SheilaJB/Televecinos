package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.SerenazgoB;
import org.example.televecinosunidos_appweb.model.beans.UsuarioB;

import java.sql.*;
import java.util.ArrayList;

public class CoordinadoraDao extends BaseDao{
    public ArrayList<UsuarioB> listarCoordinadorasCultura() {
        String sql = "SELECT idUsuario,nombre,apellido,dni,direccion,correo,genero \n" +
                "FROM televecinosdb.usuario \n" +
                "WHERE Rol_idRol = 3 AND TipoCoordinador_idTipoCoordinador = 1 and isBan = 0 \n" +
                "order by idUsuario desc;";
        ArrayList<UsuarioB> listaCoordinadoras = new ArrayList<>();

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
                usuarioB.setDireccion(rs.getString(6));


                listaCoordinadoras.add(usuarioB);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaCoordinadoras;
    }

    public ArrayList<UsuarioB> listarCoordinadorasDeportes() {
        String sql = "SELECT idUsuario,nombre,apellido,dni,direccion,correo,genero \n" +
                "FROM televecinosdb.usuario \n" +
                "WHERE Rol_idRol = 3 AND TipoCoordinador_idTipoCoordinador = 2 and isBan = 0 \n" +
                "order by idUsuario desc;";
        ArrayList<UsuarioB> listaCoordinadoras = new ArrayList<>();

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
                usuarioB.setDireccion(rs.getString(6));
                usuarioB.setGenero(rs.getInt("genero"));
                listaCoordinadoras.add(usuarioB);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaCoordinadoras;
    }

    public UsuarioB buscarCoordinadoraPorId(String idCoordinadora) {
        UsuarioB usuarioB = new UsuarioB();
        String sql = "SELECT u.*,ur.nombre AS 'urb'\n" +
                "FROM televecinosdb.usuario u\n" +
                "INNER JOIN televecinosdb.urbanizacion ur ON u.urbanizacion_idUrbanizacion = ur.idUrbanizacion\n" +
                "WHERE u.idUsuario = ?;";


        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,idCoordinadora);

            try(ResultSet rs = pstmt.executeQuery()){

                if(rs.next()) {
                    usuarioB.setIdUsuario(rs.getInt(1));
                    usuarioB.setNombre(rs.getString(2));
                    usuarioB.setApellido(rs.getString(3));
                    usuarioB.setDni(rs.getString(4));
                    usuarioB.setDireccion(rs.getString(5));
                    usuarioB.setCorreo(rs.getString(6));
                    usuarioB.setTipoCoordinador_idTipoCoordinador(rs.getInt(8));
                    usuarioB.setGenero(rs.getInt("genero"));
                    usuarioB.setUrbanizacionString(rs.getString("urb"));
                }

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return usuarioB;
    }

    public ArrayList<UsuarioB> listarCoordinadorasCulturaPorNombre(String textoBuscar) {
        String sql = "SELECT idUsuario,nombre,apellido,dni,direccion,correo,genero \n" +
                "FROM televecinosdb.usuario \n" +
                "WHERE Rol_idRol = 3 AND TipoCoordinador_idTipoCoordinador = 1 and isBan = 0 and (usuario.nombre like ? or usuario.apellido like ? or usuario.dni like ?) \n" +
                "order by usuario.idUsuario desc;";
        ArrayList<UsuarioB> listaCoordinadoras = new ArrayList<>();

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
                    usuarioB.setDireccion(rs.getString(6));
                    usuarioB.setGenero(rs.getInt("genero"));
                    listaCoordinadoras.add(usuarioB);
                }
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaCoordinadoras;
    }

    public ArrayList<UsuarioB> listarCoordinadorasDeportesPorNombre(String textoBuscar) {
        String sql = "SELECT idUsuario,nombre,apellido,dni,direccion,correo,genero \n" +
                "FROM televecinosdb.usuario \n" +
                "WHERE Rol_idRol = 3 AND TipoCoordinador_idTipoCoordinador = 2 and isBan = 0 and (usuario.nombre like ? or usuario.apellido like ? or usuario.dni like ?) \n" +
                "order by usuario.idUsuario desc;";
        ArrayList<UsuarioB> listaCoordinadoras = new ArrayList<>();

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
                    usuarioB.setDireccion(rs.getString(6));
                    usuarioB.setGenero(rs.getInt("genero"));
                    listaCoordinadoras.add(usuarioB);
                }
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaCoordinadoras;
    }
}
