package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.IncidenciasB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class IncidenCoordDao extends BaseDao{

    //Lista de incidencias
    public ArrayList<IncidenciasB> listarIncidencia(int userId) {

        String setLocaleSql = "SET lc_time_names = 'es_ES'";
        String sql = "SELECT " +
                "    i.idIncidencias AS 'ID Incidencia', " +
                "    i.nombreIncidencia AS 'Nombre', " +
                "    DATE_FORMAT(i.fecha, '%d %M') AS 'Fecha', " +
                "    TIME_FORMAT(i.fecha, '%H:%i') AS 'Hora', " +
                "    ti.TipoIncidencia AS 'Tipo de Incidencia', " +
                "    ei.estado AS 'Estado Incidencia' " +
                "FROM " +
                "    incidencias i " +
                "JOIN tipoincidencia ti ON i.TipoIncidencia_idTipoIncidencia = ti.idTipoIncidencia " +
                "JOIN estadosincidencia ei ON i.EstadosIncidencia_idEstadosIncidencia = ei.idEstadosIncidencia " +
                "WHERE " +
                "    i.borrado = FALSE AND i.Usuario_idUsuario = ? " +
                "ORDER BY " +
                "    i.fecha DESC " +
                "LIMIT 6;";

        ArrayList<IncidenciasB> listaIncidencia = new ArrayList<>();

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.execute(setLocaleSql);
            pstmt.setInt(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    IncidenciasB incidencia = new IncidenciasB();
                    incidencia.setIdIncidencias(rs.getInt("ID Incidencia"));
                    incidencia.setNombreIncidencia(rs.getString("Nombre"));
                    incidencia.setFecha(rs.getString("Fecha"));
                    incidencia.setHora(rs.getString("Hora"));
                    incidencia.setTipoIncidencia(rs.getString("Tipo de Incidencia"));
                    incidencia.setEstadoIncidencia(rs.getString("Estado Incidencia"));
                    listaIncidencia.add(incidencia);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaIncidencia;
    }


    //Solo mostrar las 3 incidencias mas recientes
    public ArrayList<IncidenciasB> listarIncidenciaRecientes(int userId) {

        String setLocaleSql = "SET lc_time_names = 'es_ES'";
        String sql = "SELECT " +
                "    i.idIncidencias AS 'ID Incidencia', " +
                "    i.nombreIncidencia AS 'Nombre', " +
                "    DATE_FORMAT(i.fecha, '%d %M') AS 'Fecha', " +
                "    TIME_FORMAT(i.fecha, '%H:%i') AS 'Hora', " +
                "    ti.TipoIncidencia AS 'Tipo de Incidencia', " +
                "    ei.estado AS 'Estado Incidencia' " +
                "FROM " +
                "    incidencias i " +
                "JOIN tipoincidencia ti ON i.TipoIncidencia_idTipoIncidencia = ti.idTipoIncidencia " +
                "JOIN estadosincidencia ei ON i.EstadosIncidencia_idEstadosIncidencia = ei.idEstadosIncidencia " +
                "WHERE " +
                "    i.borrado = FALSE AND i.Usuario_idUsuario = ? " +
                "ORDER BY " +
                "    i.fecha DESC " +
                "LIMIT 3;";

        ArrayList<IncidenciasB> listaIncidencia = new ArrayList<>();

        try (Connection conn = getConnection()) {
            // Set locale
            try (PreparedStatement localeStmt = conn.prepareStatement(setLocaleSql)) {
                localeStmt.execute();
            }

            // Prepare and execute main query
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, userId);
                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        IncidenciasB incidencia = new IncidenciasB();
                        incidencia.setIdIncidencias(rs.getInt("ID Incidencia"));
                        incidencia.setNombreIncidencia(rs.getString("Nombre"));
                        incidencia.setFecha(rs.getString("Fecha"));
                        incidencia.setHora(rs.getString("Hora"));
                        incidencia.setTipoIncidencia(rs.getString("Tipo de Incidencia"));
                        incidencia.setEstadoIncidencia(rs.getString("Estado Incidencia"));
                        listaIncidencia.add(incidencia);
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaIncidencia;
    }


    //Buscar incidencia por id
    public  IncidenciasB buscarIncidenciaPorId(String idIncidencia) {
        IncidenciasB incidencia = null;

        String setLocaleSql = "SET lc_time_names = 'es_ES'";
        String sql = "SELECT " +
                "i.idIncidencias AS 'ID Incidencia', " +
                "i.nombreIncidencia AS 'Nombre', " +
                "i.lugarExacto, " +
                "i.referencia, " +
                "i.foto, " +
                "i.ambulancia, " +
                "i.numeroContacto, " +
                "i.urbanizacion_idUrbanizacion, " +
                "i.TipoIncidencia_idTipoIncidencia, " +
                "i.incidenciaPersonal, " +
                "DATE_FORMAT(i.fecha, '%d %M') AS 'Fecha', " +
                "TIME_FORMAT(i.fecha, '%H:%i') AS 'Hora', " +
                "urb.nombre AS 'Urbanizacion', " +
                "ti.TipoIncidencia AS 'Tipo de Incidencia', " +
                "ei.estado AS 'Estado Incidencia' " +
                "FROM incidencias i " +
                "JOIN urbanizacion urb ON i.urbanizacion_idUrbanizacion = urb.idUrbanizacion " +
                "JOIN tipoincidencia ti ON i.TipoIncidencia_idTipoIncidencia = ti.idTipoIncidencia " +
                "JOIN estadosincidencia ei ON i.EstadosIncidencia_idEstadosIncidencia = ei.idEstadosIncidencia " +
                "WHERE i.idIncidencias = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.execute(setLocaleSql);
            pstmt.setString(1, idIncidencia);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    incidencia = new IncidenciasB();
                    incidencia.setIdIncidencias(rs.getInt("ID Incidencia"));
                    incidencia.setNombreIncidencia(rs.getString("Nombre"));
                    incidencia.setLugarExacto(rs.getString("lugarExacto"));
                    incidencia.setReferencia(rs.getString("referencia"));
                    incidencia.setFoto(rs.getBinaryStream("foto"));
                    incidencia.setAmbulancia(rs.getInt("ambulancia"));
                    incidencia.setNumeroContacto(rs.getString("numeroContacto"));
                    incidencia.setUrbanizacion(rs.getString("Urbanizacion"));
                    incidencia.setTipoIncidencia(rs.getString("Tipo de Incidencia"));
                    incidencia.setIncidenciaPersonal(rs.getInt("incidenciaPersonal"));
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



    //Buscar incidencia por filtro
    public ArrayList<IncidenciasB> listarIncidenciasFiltro(String nombre, String fecha, String tipo, String estado, int userId) {
        String sql = "SELECT " +
                "i.idIncidencias AS 'ID Incidencia', " +
                "i.nombreIncidencia AS 'Nombre', " +
                "DATE_FORMAT(i.fecha, '%d %M %Y') AS 'Fecha', " +
                "TIME_FORMAT(i.fecha, '%H:%i') AS 'Hora', " +
                "ti.TipoIncidencia AS 'Tipo de Incidencia', " +
                "ei.estado AS 'Estado Incidencia' " +
                "FROM incidencias i " +
                "JOIN tipoincidencia ti ON i.TipoIncidencia_idTipoIncidencia = ti.idTipoIncidencia " +
                "JOIN estadosincidencia ei ON i.EstadosIncidencia_idEstadosIncidencia = ei.idEstadosIncidencia " +
                "WHERE i.borrado = FALSE AND i.Usuario_idUsuario = ? AND i.nombreIncidencia LIKE ?";

        ArrayList<IncidenciasB> incidencias = new ArrayList<>();
        List<Object> parametros = new ArrayList<>();
        parametros.add(userId);
        parametros.add(nombre + "%");

        // Agregar los filtros adicionales
        if (fecha != null && !fecha.isEmpty()) {
            sql += " AND DATE(i.fecha) = ?";
            parametros.add(fecha);
        }
        if (tipo != null && !tipo.isEmpty()) {
            sql += " AND i.TipoIncidencia_idTipoIncidencia = ?";
            parametros.add(tipo);
        }
        if (estado != null && !estado.isEmpty()) {
            sql += " AND ei.idEstadosIncidencia = ?";
            parametros.add(estado);
        }

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Asignar los parámetros al PreparedStatement
            for (int i = 0; i < parametros.size(); i++) {
                pstmt.setObject(i + 1, parametros.get(i));
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    IncidenciasB incidencia = new IncidenciasB();
                    incidencia.setIdIncidencias(rs.getInt("ID Incidencia"));
                    incidencia.setNombreIncidencia(rs.getString("Nombre"));
                    incidencia.setFecha(rs.getString("Fecha"));
                    incidencia.setHora(rs.getString("Hora"));
                    incidencia.setTipoIncidencia(rs.getString("Tipo de Incidencia"));
                    incidencia.setEstadoIncidencia(rs.getString("Estado Incidencia"));
                    incidencias.add(incidencia);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al listar incidencias filtradas", e);
        }

        return incidencias;
    }



    //crear una incidencia
    public void generarIncidenciaC(IncidenciasB incidencia, int userId) {
        String sql = "INSERT INTO incidencias (nombreIncidencia, fecha, lugarExacto, referencia, foto, ambulancia, " +
                "numeroContacto, urbanizacion_idUrbanizacion, TipoIncidencia_idTipoIncidencia, incidenciaPersonal, " +
                "EstadosIncidencia_idEstadosIncidencia, Usuario_idUsuario, nombreFoto) " +
                "VALUES (?, NOW(), ?, ?, ?, ?, ?, ?, ?, ?, 1, ?,'1234.png')";

        System.out.println("foto: " + incidencia.getNombreFoto());
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, incidencia.getNombreIncidencia());
            pstmt.setString(2, incidencia.getLugarExacto());
            pstmt.setString(3, incidencia.getReferencia());
            pstmt.setBlob(4, incidencia.getFoto());
            pstmt.setInt(5, incidencia.getAmbulancia());
            pstmt.setString(6, incidencia.getNumeroContacto());
            pstmt.setString(7, incidencia.getUrbanizacion());
            pstmt.setString(8, incidencia.getTipoIncidencia());
            pstmt.setInt(9, incidencia.getIncidenciaPersonal());
            pstmt.setInt(10, userId);
            //pstmt.setString(11, incidencia.getNombreFoto());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    //Editar una incidencia
    public void actualizarIncidencia(IncidenciasB incidencia, int userId) {
        String sql = "UPDATE incidencias " +
                "SET nombreIncidencia = ?, lugarExacto = ?, referencia = ?, foto = ?, " +
                "ambulancia = ?, numeroContacto = ?, urbanizacion_idUrbanizacion = ?, " +
                "TipoIncidencia_idTipoIncidencia = ?, incidenciaPersonal = ? " +
                "WHERE idIncidencias = ? AND borrado =FALSE AND EstadosIncidencia_idEstadosIncidencia = 1 AND Usuario_idUsuario = ?;";

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, incidencia.getNombreIncidencia());
            pstmt.setString(2, incidencia.getLugarExacto());
            pstmt.setString(3, incidencia.getReferencia());
            pstmt.setBlob(9, incidencia.getFoto());
            pstmt.setInt(5, incidencia.getAmbulancia());
            pstmt.setString(6, incidencia.getNumeroContacto());
            int urbanizacionId = obtenerIdUrbanizacion(incidencia.getUrbanizacion());
            pstmt.setInt(7, urbanizacionId);
            int tipoIncidenciaId = obtenerIdTipoIncidencia(incidencia.getTipoIncidencia());
            pstmt.setInt(8, tipoIncidenciaId);
            pstmt.setInt(9, incidencia.getIncidenciaPersonal());
            pstmt.setInt(10, incidencia.getIdIncidencias());
            pstmt.setInt(11, userId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    //Borrar una incidencia
    public static void borrarIncidencia(String idIncidencia, int userId) throws SQLException {

        String sql = "UPDATE incidencias SET borrado=TRUE WHERE idIncidencias=? AND Usuario_idUsuario = ?";

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, idIncidencia);
            pstmt.setInt(2, userId);
            pstmt.executeUpdate();
        }
    }


    //Para obtener el id de urbanización
    private int obtenerIdUrbanizacion(String urbanizacion) {
        switch (urbanizacion) {
            case "Rafael Escardó": return 1;
            case "José de La Riva Agüero": return 2;
            case "Juan XXIII": return 3;
            case "Libertad": return 4;
            case "Los Jardines de La Marina": return 5;
            case "Las Leyendas": return 6;
            case "Las Torres San Miguelito": return 7;
            case "Elmer Faucett": return 8;
            case "Maranga": return 9;
            case "Pando": return 10;
            case "Parques de La Huaca": return 11;
            case "Otro": return 12;
            default: throw new IllegalArgumentException("Urbanización no reconocida: " + urbanizacion);
        }
    }

    //Para obtener el id del tipo de incidencia
    private int obtenerIdTipoIncidencia(String tipoIncidencia) {
        switch (tipoIncidencia) {
            case "Seguridad Pública": return 1;
            case "Emergencia Médica": return 2;
            case "Infraestructura y Servicios Públicos": return 3;
            case "Otro": return 4;
            default: throw new IllegalArgumentException("Tipo de incidencia no reconocido: " + tipoIncidencia);
        }
    }
}
