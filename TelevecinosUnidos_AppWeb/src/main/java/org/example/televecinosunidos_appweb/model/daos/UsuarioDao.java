package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.*;
import org.example.televecinosunidos_appweb.model.beans.UsuarioB;

import java.sql.*;
import java.util.ArrayList;


//se usará para listar todos los usuarios de la pagina y sus acciones de banear
public class UsuarioDao extends BaseDao{
    public ArrayList<UsuarioB> listarUsuarios() {

        String sql = "SELECT idUsuario,nombre,apellido,dni,direccion,correo\n" +
                "FROM televecinosdb.usuario \n" +
                "where isBan=0" ;


        ArrayList<UsuarioB> listaUsuarios = new ArrayList<>();

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


                listaUsuarios.add(usuarioB);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return listaUsuarios;
    }
    public ArrayList<UsuarioB> listarBaneados() {

        String sql = "SELECT idUsuario,nombre,apellido,dni,direccion,correo,Rol_idRol\n" +
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
                int rolID = rs.getInt(7);
                switch (rolID){
                    case 1:
                        usuarioB.setRolStr("Solicitante");
                        break;
                    case 2:
                        usuarioB.setRolStr("Vecino");
                        break;
                    case 3:
                        usuarioB.setRolStr("Coordinadora");
                        break;
                    case 4:
                        usuarioB.setRolStr("Serenazgo");
                        break;

                }


                listaBaneados.add(usuarioB);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return listaBaneados;
    }

    public UsuarioB buscarUsuarioPorId(String idRol) {
        UsuarioB usuarioB = new UsuarioB();
        String sql = "SELECT * \n" +
                "FROM televecinosdb.usuario \n" +
                "WHERE idUsuario=?;";


        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,idRol);

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
    public UsuarioB obtenerUsuario(String usuarioId) {
        UsuarioB usuarioB = new UsuarioB();
        String sql = "SELECT * \n" +
                "FROM televecinosdb.usuario \n" +
                "WHERE idUsuario=?;";


        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,usuarioId);

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

    public void banearUsuario (String idUsuario) throws SQLException {
        String sql = "UPDATE televecinosdb.usuario SET isBan = 1 WHERE idUsuario = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, idUsuario);
            pstmt.executeUpdate();

        }
    }

    public void desbanearUsuario (String idUsuario) throws SQLException {
        String sql = "UPDATE televecinosdb.usuario SET isBan = 0 WHERE idUsuario = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, idUsuario);
            pstmt.executeUpdate();

        }
    }

    public ArrayList<UsuarioB> listarBaneadosPorNombre(String textoBuscar) {

        String sql = "SELECT idUsuario,nombre,apellido,dni,direccion,correo,Rol_idRol\n" +
                "FROM televecinosdb.usuario \n" +
                "where isBan=1 and (usuario.nombre like ? or usuario.apellido like ?)" ;


        ArrayList<UsuarioB> listaBaneados = new ArrayList<>();

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, textoBuscar+ "%");
            pstmt.setString(2, textoBuscar+ "%");

            try(ResultSet rs = pstmt.executeQuery()){
                while (rs.next()) {
                    UsuarioB usuarioB = new UsuarioB();
                    usuarioB.setIdUsuario(rs.getInt(1));
                    usuarioB.setNombre(rs.getString(2));
                    usuarioB.setApellido(rs.getString(3));
                    usuarioB.setDni(rs.getString(4));
                    usuarioB.setDireccion(rs.getString(5));
                    usuarioB.setCorreo(rs.getString(6));
                    int rolID = rs.getInt(7);
                    switch (rolID){
                        case 1:
                            usuarioB.setRolStr("Solicitante");
                            break;
                        case 2:
                            usuarioB.setRolStr("Vecino");
                            break;
                        case 3:
                            usuarioB.setRolStr("Coordinadora");
                            break;
                        case 4:
                            usuarioB.setRolStr("Serenazgo");
                            break;

                    }


                    listaBaneados.add(usuarioB);
            }


            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return listaBaneados;
    }
}
