package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.*;
import org.example.televecinosunidos_appweb.model.beans.UsuarioB;
import org.example.televecinosunidos_appweb.model.dto.SerenazgoDTO;

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
    public boolean validarUsuarioPassword(String correo, String contrasena){
        boolean exito = false;
        String sql = "SELECT * FROM usuario WHERE correo = ? AND contrasena = SHA2(?, 256)";
        try (Connection connection= getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1, correo);
            pstmt.setString(2, contrasena);

            try(ResultSet rs = pstmt.executeQuery()){
                if(rs.next()){
                    exito = true;
                }

            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return exito;
    }
    public UsuarioB obtenerUsuario1(String correo) {
        UsuarioB usuarioB = new UsuarioB();
        String sql = "SELECT * FROM televecinosdb.usuario u WHERE u.correo=?";


        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1,correo);

            try(ResultSet rs = pstmt.executeQuery()){

                if(rs.next()) {
                    usuarioB = new UsuarioB();
                    usuarioB.setIdUsuario(rs.getInt(1));
                    usuarioB.setNombre(rs.getString(2));
                    usuarioB.setApellido(rs.getString(3));
                    usuarioB.setDni(rs.getString(4));
                    usuarioB.setDireccion(rs.getString(5));
                    usuarioB.setCorreo(rs.getString(6));
                    usuarioB.setTipoCoordinador_idTipoCoordinador(rs.getInt(8));
                    usuarioB.setIdRol(rs.getInt(12));
                    usuarioB.setIsBan(rs.getInt(13));

                }

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return usuarioB;
    }
    public SerenazgoDTO obtenerUsuarioSerenazgo(String correo){
        SerenazgoDTO serenazgoDTO = null;
        String sql = "SELECT \n" +
                "    u.idUsuario AS idUsuario,\n" +
                "    s.idSerenazgo AS idSerenazgo,\n" +
                "    u.nombre AS nombreSerenazgo,\n" +
                "    u.apellido AS apellidoSerenazgo,\n" +
                "    u.dni AS DNI,\n" +
                "    s.numTelefono AS telefonoSerenazgo,\n" +
                "    u.correo AS correoSerenazgo,\n" +
                "    u.direccion AS direccionSerenazgo,\n" +
                "    u.isBan AS isBan,\n" +
                "    u.avatar AS avatarSerenazgo,\n" +
                "    s.fechaNacimiento AS fechaNacimientoSerenazgo,\n" +
                "    ts.turno AS turnoSerenazgo,\n" +
                "    tps.tipo AS tipoSerenazgo\n" +
                "FROM \n" +
                "    televecinosdb.usuario u\n" +
                "INNER JOIN \n" +
                "    televecinosdb.serenazgo s ON u.idUsuario = s.usuario_idUsuario\n" +
                "INNER JOIN \n" +
                "    televecinosdb.turnoserenazgo ts ON s.TurnoSerenazgo_idTurnoSerenazgo = ts.idTurnoSerenazgo\n" +
                "INNER JOIN \n" +
                "    televecinosdb.tiposerenazgo tps ON s.TipoSerenazgo_idTipoSerenazgo = tps.idTipoSerenazgo\n" +
                "WHERE \n" +
                "    u.correo = ?;\n";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1,correo);

            try(ResultSet rs = pstmt.executeQuery()){

                if(rs.next()) {
                    serenazgoDTO = new SerenazgoDTO();
                    serenazgoDTO.setIdUsuario(rs.getInt("idUsuario"));
                    serenazgoDTO.setIdSerenazgo(rs.getInt("idSerenazgo"));
                    serenazgoDTO.setNombreSerenazgo(rs.getString("nombreSerenazgo"));
                    serenazgoDTO.setApellidoSerenazgo(rs.getString("apellidoSerenazgo"));
                    serenazgoDTO.setDNI(rs.getString("DNI"));
                    serenazgoDTO.setTelefonoSerenazgo(rs.getString("telefonoSerenazgo"));
                    serenazgoDTO.setCorreoSerenazgo(rs.getString("correoSerenazgo"));
                    serenazgoDTO.setDireccionSerenazgo(rs.getString("direccionSerenazgo"));
                    serenazgoDTO.setBan(rs.getBoolean("isBan"));
                    serenazgoDTO.setAvatarSerenazgo(rs.getString("avatarSerenazgo"));
                    serenazgoDTO.setFechaNacimientoSerenazgo("fechaNacimientoSerenazgo");
                    serenazgoDTO.setTurnoSerenazgo(rs.getString("turnoSerenazgo"));
                    serenazgoDTO.setTipoSerenazgo(rs.getString("tipoSerenazgo"));
                }

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return serenazgoDTO;
    }
    public int obtenerIdPorCorreo(String correo){
        int id=0;
        String sql = "SELECT Rol_idRol\n" +
                "FROM televecinosdb.usuario\n" +
                "WHERE correo = ?;\n";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1,correo);

            try(ResultSet rs = pstmt.executeQuery()){
                if(rs.next()) {
                    id = rs.getInt(1);
                }

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return id;
    }
}
