package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.EventoB;
import org.example.televecinosunidos_appweb.model.beans.ProfesoresEvento;
import org.example.televecinosunidos_appweb.model.beans.SerenazgoB;
import org.example.televecinosunidos_appweb.model.beans.UsuarioB;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class SerenazgoDao extends BaseDao {
    //Función lista de serenazgos
    public ArrayList<SerenazgoB> listarSerenazgos() {



        String sql = "SELECT \n" +
                "    serenazgo.idSerenazgo,\n" +
                "    serenazgo.numTelefono,\n" +
                "    serenazgo.fechaNacimiento,\n" +
                "    serenazgo.TurnoSerenazgo_idTurnoSerenazgo,\n" +
                "    serenazgo.TipoSerenazgo_idTipoSerenazgo,\n" +
                "    usuario.idUsuario,\n" +
                "    usuario.nombre AS usuario_nombre,\n" +
                "    usuario.apellido AS usuario_apellido,\n" +
                "    usuario.dni AS usuario_dni,\n" +
                "    usuario.direccion AS usuario_direccion,\n" +
                "    usuario.correo AS usuario_correo,\n" +
                "    usuario.contrasena AS usuario_contrasena,\n" +
                "    usuario.PreguntasFrecuentes_idtable2 AS usuario_PreguntasFrecuentes_idtable2,\n" +
                "    usuario.Rol_idRol AS usuario_Rol_idRol,\n" +
                "    usuario.isBan AS usuario_isBan\n" +
                "FROM \n" +
                "    `televecinosdb`.`serenazgo`\n" +
                "JOIN \n" +
                "    `televecinosdb`.`usuario` ON serenazgo.usuario_idUsuario = usuario.idUsuario;\n" ;


        ArrayList<SerenazgoB> listaSerenazgos = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                SerenazgoB serenazgoB = new SerenazgoB();
                serenazgoB.setIdSerenazgo(rs.getInt(1));
                serenazgoB.setNumTelefono(rs.getString(2));
                serenazgoB.setFechaNacimiento(rs.getString(3));
                serenazgoB.setIdTurnoSerenazgo(rs.getInt(4));
                serenazgoB.setIdTipoSerenazgo(rs.getInt(5));
                UsuarioB us = new UsuarioB();
                us.setIdUsuario(rs.getInt(6));
                us.setNombre(rs.getString(7));
                us.setApellido(rs.getString(8));
                us.setDni(rs.getString(9));
                us.setDireccion(rs.getString(10));
                us.setCorreo(rs.getString(11));
                us.setContrasenia(rs.getString(12));
                us.setPreguntasFrecuentes_idTable2(rs.getInt(13));
                us.setIdRol(rs.getInt(14));
                serenazgoB.setUsuario(us);


                switch (serenazgoB.getIdTipoSerenazgo()){
                    case 1:
                        serenazgoB.setTipoSerenazgoStr("Bicicleta");
                        break;
                    case 2:
                        serenazgoB.setTipoSerenazgoStr("A pie");
                        break;
                    case 3:
                        serenazgoB.setTipoSerenazgoStr("Canino");
                        break;
                    case 4:
                        serenazgoB.setTipoSerenazgoStr("Vehiculo");
                        break;
                }

                switch (serenazgoB.getIdTurnoSerenazgo()){
                    case 1:
                        serenazgoB.setTurnoSerenazgoStr("Diurno");
                        break;
                    case 2:
                        serenazgoB.setTurnoSerenazgoStr("Nocturno");
                        break;

                }


                listaSerenazgos.add(serenazgoB);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return listaSerenazgos;
    }

    public SerenazgoB buscarSerenazgoPorId(String idSerenazgo) {
        SerenazgoB serenazgoB= new SerenazgoB();


        String sql = "SELECT \n" +
                "    serenazgo.idSerenazgo,\n" +
                "    serenazgo.numTelefono,\n" +
                "    serenazgo.fechaNacimiento,\n" +
                "    serenazgo.TurnoSerenazgo_idTurnoSerenazgo,\n" +
                "    serenazgo.TipoSerenazgo_idTipoSerenazgo,\n" +
                "    usuario.idUsuario,\n" +
                "    usuario.nombre AS usuario_nombre,\n" +
                "    usuario.apellido AS usuario_apellido,\n" +
                "    usuario.dni AS usuario_dni,\n" +
                "    usuario.direccion AS usuario_direccion,\n" +
                "    usuario.correo AS usuario_correo,\n" +
                "    usuario.contrasena AS usuario_contrasena,\n" +
                "    usuario.PreguntasFrecuentes_idtable2 AS usuario_PreguntasFrecuentes_idtable2,\n" +
                "    usuario.Rol_idRol AS usuario_Rol_idRol,\n" +
                "    usuario.isBan AS usuario_isBan\n" +
                "FROM \n" +
                "    `televecinosdb`.`serenazgo`\n" +
                "JOIN \n" +
                "    `televecinosdb`.`usuario` ON serenazgo.usuario_idUsuario = usuario.idUsuario\n" +
                "WHERE idSerenazgo = ?;";


        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,idSerenazgo);

            try(ResultSet rs = pstmt.executeQuery()){

                if(rs.next()) {
                    serenazgoB.setIdSerenazgo(rs.getInt(1));
                    serenazgoB.setNumTelefono(rs.getString(2));
                    serenazgoB.setFechaNacimiento(rs.getString(3));
                    serenazgoB.setIdTurnoSerenazgo(rs.getInt(4));
                    serenazgoB.setIdTipoSerenazgo(rs.getInt(5));
                    UsuarioB us = new UsuarioB();
                    us.setIdUsuario(rs.getInt(6));
                    us.setNombre(rs.getString(7));
                    us.setApellido(rs.getString(8));
                    us.setDni(rs.getString(9));
                    us.setDireccion(rs.getString(10));
                    us.setCorreo(rs.getString(11));
                    us.setContrasenia(rs.getString(12));
                    us.setPreguntasFrecuentes_idTable2(rs.getInt(13));
                    us.setIdRol(rs.getInt(14));
                    serenazgoB.setUsuario(us);

                    switch (serenazgoB.getIdTipoSerenazgo()){
                        case 1:
                            serenazgoB.setTipoSerenazgoStr("Bicicleta");
                            break;
                        case 2:
                            serenazgoB.setTipoSerenazgoStr("A pie");
                            break;
                        case 3:
                            serenazgoB.setTipoSerenazgoStr("Canino");
                            break;
                        case 4:
                            serenazgoB.setTipoSerenazgoStr("Vehiculo");
                            break;
                    }

                    switch (serenazgoB.getIdTurnoSerenazgo()){
                        case 1:
                            serenazgoB.setTurnoSerenazgoStr("Diurno");
                            break;
                        case 2:
                            serenazgoB.setTurnoSerenazgoStr("Nocturno");
                            break;

                    }
                }

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return serenazgoB;

    }


    public void registrarSerenazgo(SerenazgoB serenazgoB) {

        String sql = "INSERT INTO `televecinosdb`.`usuario` (`nombre`, `apellido`, `dni`, `direccion`, `correo`, `contrasena`,`PreguntasFrecuentes_idtable2`, `Rol_idRol`, `isBan`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try(Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql);) { // usando try con recursos

            pstmt.setString(1,serenazgoB.getUsuario().getNombre());
            pstmt.setString(2,serenazgoB.getUsuario().getApellido());
            pstmt.setString(3,serenazgoB.getUsuario().getDni());
            pstmt.setString(4,serenazgoB.getUsuario().getDireccion());
            pstmt.setString(5,serenazgoB.getUsuario().getCorreo());
            pstmt.setString(6,serenazgoB.getUsuario().getContrasenia());
            pstmt.setInt(7,serenazgoB.getUsuario().getPreguntasFrecuentes_idTable2());
            pstmt.setInt(8,serenazgoB.getUsuario().getIdRol());
            pstmt.setInt(9,serenazgoB.getUsuario().getIsBan());

            pstmt.executeUpdate();


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        String sql2 = "SELECT MAX(idUsuario) AS ultimo_idUsuario FROM televecinosdb.usuario;\n";
        int lastUsuarioId = 1;
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql2)) {
            if (rs.next()) {
                lastUsuarioId = rs.getInt(1);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }



        String sqlSerenazgo = "INSERT INTO `televecinosdb`.`serenazgo` (`numTelefono`, `fechaNacimiento`, `TurnoSerenazgo_idTurnoSerenazgo`, `TipoSerenazgo_idTipoSerenazgo`, `usuario_idUsuario`) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sqlSerenazgo)) {
            pstmt.setString(1,serenazgoB.getNumTelefono());
            pstmt.setString(2,serenazgoB.getFechaNacimiento());
            pstmt.setInt(3,serenazgoB.getIdTurnoSerenazgo());
            pstmt.setInt(4,serenazgoB.getIdTipoSerenazgo());
            pstmt.setInt(5, lastUsuarioId);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }




    }
}

