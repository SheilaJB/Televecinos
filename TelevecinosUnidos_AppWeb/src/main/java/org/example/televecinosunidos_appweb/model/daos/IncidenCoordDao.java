package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.IncidenciasB;

import java.sql.*;
import java.util.ArrayList;

public class IncidenCoordDao {
    public ArrayList<IncidenciasB> listarIncidencia() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/televecinosdb";
        String username = "root";
        String password = "root";

        String setLocaleSql = "SET lc_time_names = 'es_ES'";
        String sql = "SELECT " +
                "i.idIncidencias AS 'ID Incidencia', " +
                "i.nombreIncidencia AS 'Nombre', " +
                "DATE_FORMAT(i.fechaHora, '%d %M') AS 'Fecha', " +
                "TIME_FORMAT(i.fechaHora, '%H:%i') AS 'Hora', " +
                "ti.TipoIncidencia AS 'Tipo de Incidencia', " +
                "ei.estado AS 'Estado Incidencia' " +
                "FROM " +
                "incidencias i " +
                "JOIN tipoincidencia ti ON i.TipoIncidencia_idTipoIncidencia = ti.idTipoIncidencia " +
                "JOIN estadosincidencia ei ON i.EstadosIncidencia_idEstadosIncidencia = ei.idEstadosIncidencia";

        ArrayList<IncidenciasB> listaIncidencia = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement()) {
            stmt.execute(setLocaleSql);
            try (ResultSet rs = stmt.executeQuery(sql)) {
                while (rs.next()) {
                    IncidenciasB incidencia = new IncidenciasB();
                    incidencia.setIdIncidencias(rs.getInt("ID Incidencia"));
                    incidencia.setNombreIncidencia(rs.getString("Nombre"));
                    incidencia.setFechaHora(rs.getString("Fecha") + " " + rs.getString("Hora"));
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


    public IncidenciasB buscarIncidenciaPorId(String idIncidencia  ) {

        IncidenciasB incidencia = null;


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/televecinosdb";
        String username = "root";
        String password = "root";

        String setLocaleSql = "SET lc_time_names = 'es_ES'";
        String sql = "SELECT " +
                "i.idIncidencias AS 'ID Incidencia', " +
                "i.nombreIncidencia AS 'Nombre', " +
                "DATE_FORMAT(i.fechaHora, '%d %M') AS 'Fecha', " +
                "TIME_FORMAT(i.fechaHora, '%H:%i') AS 'Hora', " +
                "ti.TipoIncidencia AS 'Tipo de Incidencia', " +
                "ei.estado AS 'Estado Incidencia' " +
                "FROM " +
                "incidencias i " +
                "JOIN tipoincidencia ti ON i.TipoIncidencia_idTipoIncidencia = ti.idTipoIncidencia " +
                "JOIN estadosincidencia ei ON i.EstadosIncidencia_idEstadosIncidencia = ei.idEstadosIncidencia";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,idIncidencia);

            try(ResultSet rs = pstmt.executeQuery()){
                while (rs.next()) {
                    incidencia = new IncidenciasB();

                    incidencia.setIdIncidencias(rs.getInt("ID Incidencia"));
                    incidencia.setNombreIncidencia(rs.getString("Nombre"));
                    incidencia.setFechaHora(rs.getString("Fecha") + " " + rs.getString("Hora"));
                    incidencia.setTipoIncidencia(rs.getString("Tipo de Incidencia"));
                    incidencia.setEstadoIncidencia(rs.getString("Estado Incidencia"));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return incidencia;
    }
    public void generarIncidenica (){

    }
}
