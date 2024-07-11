package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.UsuarioB;
import org.example.televecinosunidos_appweb.util.EnviarEmail;
import org.example.televecinosunidos_appweb.util.GeneraContrasena;

import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;


public class SolicitanteDao extends BaseDao {
    public ArrayList<UsuarioB> listarSolicitantes() {

        String sql = "SELECT idUsuario,nombre,apellido,dni,direccion,correo\n" +
                "FROM televecinosdb.usuario \n" +
                "where Rol_idRol = 1 and isBan=0 \n" +
                "ORDER BY idUsuario desc";


        ArrayList<UsuarioB> listaSolicitantes = new ArrayList<>();

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


                listaSolicitantes.add(usuarioB);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return listaSolicitantes;
    }


    public void aceptarSolicitud(String solicitanteId) throws SQLException, NoSuchAlgorithmException {
        String sqlUpdateRole = "UPDATE usuario SET Rol_idRol = 2, contrasena = ? WHERE idUsuario = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = getConnection();
            conn.setAutoCommit(false); // Iniciar transacción

            String tempPassword = GeneraContrasena.generateTemporaryPassword();
            String hashedPassword = GeneraContrasena.hashPassword(tempPassword);

            pstmt = conn.prepareStatement(sqlUpdateRole);
            pstmt.setString(1, hashedPassword);
            pstmt.setString(2, solicitanteId);
            pstmt.executeUpdate();

            UsuarioB usuario = obtenerSolicitante(solicitanteId); // Método para obtener el usuario por ID
            EnviarEmail enviarEmail = new EnviarEmail();
            enviarEmail.sendEmail(usuario.getCorreo(), tempPassword); // Método para enviar el correo

            conn.commit(); // Confirmar transacción

        } catch (SQLException | NoSuchAlgorithmException e) {
            if (conn != null) {
                conn.rollback(); // Revertir transacción en caso de error
            }
            throw e;
        } finally {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    }


    public void denegarSolicitud(String solicitanteId2) throws SQLException{
        String sql = "update usuario set isBan = 1 where idUsuario = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, solicitanteId2);
            pstmt.executeUpdate();
        }
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, solicitanteId2);

            pstmt.executeUpdate();
        }
        EnviarEmail enviarEmail = new EnviarEmail();
        UsuarioB usuarioB = obtenerSolicitante(solicitanteId2);
        enviarEmail.sendEmailDenegacionSolicitante(usuarioB.getCorreo(),usuarioB.getNombre());



    }

    public UsuarioB obtenerSolicitante(String solicitanteId) {
        UsuarioB usuarioB = new UsuarioB();
        String sql = "SELECT * \n" +
                "FROM televecinosdb.usuario \n" +
                "WHERE idUsuario=?;";


        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,solicitanteId);

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

    public ArrayList<UsuarioB> listarSolicitantesPorNombre(String textoBuscar) {

        String sql = "SELECT idUsuario,nombre,apellido,dni,direccion,correo\n" +
                "FROM televecinosdb.usuario \n" +
                "where Rol_idRol = 1 and isBan=0 and (usuario.nombre like ? or usuario.apellido like ? or usuario.dni like ?)" +
                "ORDER BY idUsuario desc";


        ArrayList<UsuarioB> listaSolicitantes = new ArrayList<>();

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, textoBuscar+ "%");
            pstmt.setString(2, textoBuscar+ "%");
            pstmt.setString(3, textoBuscar);

            try(ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    UsuarioB usuarioB = new UsuarioB();
                    usuarioB.setIdUsuario(rs.getInt(1));
                    usuarioB.setNombre(rs.getString(2));
                    usuarioB.setApellido(rs.getString(3));
                    usuarioB.setDni(rs.getString(4));
                    usuarioB.setDireccion(rs.getString(5));
                    usuarioB.setCorreo(rs.getString(6));


                    listaSolicitantes.add(usuarioB);
                }
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return listaSolicitantes;
    }


}
