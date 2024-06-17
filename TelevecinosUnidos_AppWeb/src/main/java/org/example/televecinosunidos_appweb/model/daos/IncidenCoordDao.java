package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.IncidenciasB;

import java.sql.*;
import java.util.ArrayList;

public class IncidenCoordDao extends BaseDao{
    public ArrayList<IncidenciasB> listarIncidencia() {

        String setLocaleSql = "SET lc_time_names = 'es_ES'";
        String sql = "SELECT \n" +
                "    i.idIncidencias AS 'ID Incidencia', \n" +
                "    i.nombreIncidencia AS 'Nombre', \n" +
                "    DATE_FORMAT(i.fecha, '%d %M') AS 'Fecha', \n" +
                "    TIME_FORMAT(i.fecha, '%H:%i') AS 'Hora', \n" +
                "    ti.TipoIncidencia AS 'Tipo de Incidencia', \n" +
                "    ei.estado AS 'Estado Incidencia' \n" +
                "FROM \n" +
                "    incidencias i \n" +
                "JOIN tipoincidencia ti ON i.TipoIncidencia_idTipoIncidencia = ti.idTipoIncidencia \n" +
                "JOIN estadosincidencia ei ON i.EstadosIncidencia_idEstadosIncidencia = ei.idEstadosIncidencia \n" +
                "ORDER BY i.fecha DESC;";

        ArrayList<IncidenciasB> listaIncidencia = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {
            stmt.execute(setLocaleSql);
            try (ResultSet rs = stmt.executeQuery(sql)) {
                while (rs.next()) {
                    IncidenciasB incidencia = new IncidenciasB();
                    incidencia.setIdIncidencias(rs.getInt("ID Incidencia"));
                    incidencia.setNombreIncidencia(rs.getString("Nombre"));
                    incidencia.setFecha(rs.getString("Fecha"));
                    incidencia.setHora(rs.getString("Hora"));
                    incidencia.setTipoIncidencia(rs.getString("Tipo de Incidencia"));
                    incidencia.setEstadoIncidencia(rs.getString("Estado Incidencia"));
                    listaIncidencia.add(incidencia); // Asegurarse de añadir la incidencia a la lista

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaIncidencia;
    }


    public IncidenciasB buscarIncidenciaPorId(String idIncidencia) {
        IncidenciasB incidencia = null;

        String sql = "SELECT " +
                "i.idIncidencias AS 'ID Incidencia', " +
                "i.nombreIncidencia AS 'Nombre', " +
                "DATE_FORMAT(i.fecha, '%d %M') AS 'Fecha', " +
                "TIME_FORMAT(i.fecha, '%H:%i') AS 'Hora', " +
                "ti.TipoIncidencia AS 'Tipo de Incidencia', " +
                "ei.estado AS 'Estado Incidencia' " +
                "FROM " +
                "incidencias i " +
                "JOIN tipoincidencia ti ON i.TipoIncidencia_idTipoIncidencia = ti.idTipoIncidencia " +
                "JOIN estadosincidencia ei ON i.EstadosIncidencia_idEstadosIncidencia = ei.idEstadosIncidencia " +
                "WHERE i.idIncidencias = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, idIncidencia);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    incidencia = new IncidenciasB();
                    incidencia.setIdIncidencias(rs.getInt("ID Incidencia"));
                    incidencia.setNombreIncidencia(rs.getString("Nombre"));
                    incidencia.setFecha(rs.getString("Fecha"));
                    incidencia.setHora(rs.getString("Hora"));
                    incidencia.setTipoIncidencia(rs.getString("Tipo de Incidencia"));
                    incidencia.setEstadoIncidencia(rs.getString("Estado Incidencia"));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return incidencia;
    }
    public void generarIncidenciaC (IncidenciasB incidencia){
        String sql = "INSERT INTO incidencias (nombreIncidencia, fecha, lugarExacto, referencia, foto, ambulancia, " +
                "numeroContacto, urbanizacion_idUrbanizacion, TipoIncidencia_idTipoIncidencia, incidenciaPersonal, " +
                "EstadosIncidencia_idEstadosIncidencia, Usuario_idUsuario) " +
                "VALUES (?, NOW(), ?, ?, ?, ?, ?, ?, ?, ?, 1, 1)";


        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, incidencia.getNombreIncidencia());
            pstmt.setString(2, incidencia.getLugarExacto());
            pstmt.setString(3, incidencia.getReferencia());
            pstmt.setString(4, incidencia.getFoto());
            pstmt.setInt(5, incidencia.getAmbulancia());
            pstmt.setString(6, incidencia.getNumeroContacto());
            pstmt.setString(7, incidencia.getUrbanizacion());
            pstmt.setString(8, incidencia.getTipoIncidencia());
            pstmt.setInt(9, incidencia.getIncidenciaPersonal());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /*public void  actualizarIncidencia (IncidenciasB incidencia){


        String sql ="UPDATE incidencias\n" +
                "SET\n" +
                "    nombreIncidencia = ?,\n" +
                "    foto = ?,\n" +
                "    TipoIncidencia_idTipoIncidencia = ?,\n" +
                "    urbanizacion_idUrbanizacion = ?,\n" +
                "    incidenciaPersonal = ?,\n" +
                "    lugarExacto = ?,\n" +
                "    referencia = ?,\n" +
                "    numeroContacto = ?,\n" +
                "    ambulancia = ?\n" +
                "WHERE\n" +
                "    idIncidencias = ?\n" +
                "    AND EstadosIncidencia_idEstadosIncidencia = 1;";
        //solo cuando el estado esta en pendiente se puede actualizar

        try(Connection connection = getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, incidencia.getNombreIncidencia());
            pstmt.setString(2, incidencia.getFoto());
            pstmt.setString(3, incidencia.getTipoIncidencia());
            pstmt.setString(4, incidencia.getUrbanizacion());
            pstmt.setInt(5, incidencia.getIncidenciaPersonal());
            pstmt.setString(6, incidencia.getLugarExacto());
            pstmt.setString(7, incidencia.getReferencia());
            pstmt.setString(8, incidencia.getNumeroContacto());
            pstmt.setInt(9, incidencia.getAmbulancia());
            pstmt.setInt(10, incidencia.getIdIncidencias());
            pstmt.executeUpdate();

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }*/
}
