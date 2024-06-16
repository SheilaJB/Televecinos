package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.EventoB;
import org.example.televecinosunidos_appweb.model.beans.ProfesoresEvento;

import java.sql.*;
import java.util.ArrayList;

public class EventoDao {

    //Función lista de eventos
    public ArrayList<EventoB> listarEventosPropios() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/televecinosdb";
        String username = "root";
        String password = "root";

        String sql = "SELECT e.idEventos AS 'ID Evento', e.nombre AS 'Nombre', DATE_FORMAT(e.fecha_inicio, '%d %M') AS 'Fecha de Inicio', " +
                "es.estadosEvento AS 'Estado', ef.tipoFrecuencia AS 'Frecuencia' " +
                "FROM Eventos e JOIN EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados " +
                "JOIN EventFrecuencia ef ON e.EventFrecuencia_idEventFrecuencia = ef.idEventFrecuencia " +
                "WHERE e.TipoEvento_idTipoEvento = 1 AND e.eliminado = FALSE;";

        ArrayList<EventoB> listaEventosPropios = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                EventoB evento = new EventoB();
                evento.setidEvento(rs.getInt("ID Evento"));
                evento.setNombre(rs.getString("Nombre"));
                evento.setFecha_inicio(rs.getString("Fecha de Inicio"));
                evento.setEstadoString(rs.getString("Estado"));
                evento.setFrecuenciaString(rs.getString("Frecuencia"));
                listaEventosPropios.add(evento);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaEventosPropios;
    }

    //Function buscar un evento
    public EventoB buscarEventoPorId(String idEvento) {
        EventoB evento = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/televecinosdb";
        String username = "root";
        String password = "root";

        String sql = "SELECT " +
                "e.idEventos AS id_evento, " +
                "e.nombre AS nombre, " +
                "e.descripcion AS descripcion, " +
                "u.idUsuario AS id_coordinador, " +
                "u.nombre AS nombre_coordinador, " +
                "u.apellido AS apellido_coordinador, " +
                "e.lugar AS lugar, " +
                "ef.tipoFrecuencia AS frecuencia, " +
                "e.cantidadVacantes AS cantidad_vacantes, " +
                "e.cantDisponibles AS cantidad_disponibles, " +
                "e.foto AS foto, " +
                "DATE_FORMAT(e.fecha_inicio, '%Y-%m-%d') AS fecha_inicio, " +
                "DATE_FORMAT(e.fecha_fin, '%Y-%m-%d') AS fecha_fin, " +
                "pf.idProfesoresEvento AS id_profesor, " +
                "pf.nombre AS nombreProfesor, " +
                "pf.apellido AS apellidoProfesor, " +
                "TIME(e.hora_inicio) AS hora_inicio, " +
                "TIME(e.hora_fin) AS hora_fin, " +
                "e.listaMateriales AS listaMateriales, " +
                "e.diasEvento as diasEvento " + // Añadido espacio antes de FROM
                "FROM " +
                "Eventos e " +
                "JOIN Usuario u ON e.Coordinador_idUsuario = u.idUsuario " +
                "JOIN EventFrecuencia ef ON e.EventFrecuencia_idEventFrecuencia = ef.idEventFrecuencia " +
                "JOIN profesoresevento pf ON e.ProfesoresEvento_idProfesoresEvento = pf.idProfesoresEvento " +
                "WHERE e.idEventos = ?";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            int idEvent = Integer.parseInt(idEvento);
            pstmt.setInt(1, idEvent);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    evento = new EventoB();
                    evento.setidEvento(rs.getInt("id_evento"));
                    evento.setNombre(rs.getString("nombre"));
                    evento.setDescripcion(rs.getString("descripcion"));
                    evento.setCoordinador_idUsuario(rs.getInt("id_coordinador"));  // Configurar id_coordinador
                    evento.setLugar(rs.getString("lugar"));
                    evento.setFrecuenciaString(rs.getString("frecuencia"));
                    evento.setCantidadVacantes(rs.getInt("cantidad_vacantes"));
                    evento.setCantDisponibles(rs.getInt("cantidad_disponibles"));
                    evento.setFecha_inicio(rs.getString("fecha_inicio"));
                    evento.setFecha_fin(rs.getString("fecha_fin"));
                    evento.setProfesoresEvento_idProfesoresEvento(rs.getInt("id_profesor"));  // Configurar id_profesor
                    evento.setNombreProfesor(rs.getString("nombreProfesor"));
                    evento.setApellidoProfesor(rs.getString("apellidoProfesor"));
                    evento.setHora_inicio(rs.getString("hora_inicio"));
                    evento.setHora_fin(rs.getString("hora_fin"));
                    evento.setFoto(rs.getString("foto"));
                    evento.setListaMateriales(rs.getString("listaMateriales"));
                    evento.setDiaEvento(rs.getString("diasEvento"));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return evento;
    }


    // Function crear evento
    public void crearEvento(EventoB eventoB) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/televecinosdb";
        String username = "root";
        String password = "root";
        String sql = "INSERT INTO `televecinosDB`.`eventos` \n" +
                "(`nombre`, `descripcion`, `lugar`, `Coordinador_idUsuario`, `fecha_inicio`, `fecha_fin`, `cantidadVacantes`, `cantDisponibles`, `foto`, `listaMateriales`, `EventEstados_idEventEstados`, `EventFrecuencia_idEventFrecuencia`, `TipoEvento_idTipoEvento`, `ProfesoresEvento_idProfesoresEvento`, `hora_inicio`, `hora_fin`, `diasEvento`) \n" +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            int idCoordinador = 1;
            int tipoEvento = 1;
            int estadoEvento = 1;

            pstmt.setString(1, eventoB.getNombre());
            pstmt.setString(2, eventoB.getDescripcion());
            pstmt.setString(3, eventoB.getLugar());
            pstmt.setInt(4, idCoordinador);
            pstmt.setString(5, eventoB.getFecha_inicio());
            pstmt.setString(6, eventoB.getFecha_fin());
            pstmt.setInt(7, eventoB.getCantidadVacantes());
            pstmt.setInt(8, eventoB.getCantidadVacantes());
            pstmt.setString(9, eventoB.getFoto());
            pstmt.setString(10, eventoB.getListaMateriales());
            pstmt.setInt(11, estadoEvento);
            pstmt.setInt(12, eventoB.getEventFrecuencia_idEventFrecuencia());
            pstmt.setInt(13, tipoEvento);
            pstmt.setInt(14, eventoB.getProfesoresEvento_idProfesoresEvento());
            pstmt.setString(15, eventoB.getHora_inicio());
            pstmt.setString(16, eventoB.getHora_fin());
            pstmt.setString(17, eventoB.getDiaEvento());

            pstmt.executeUpdate();

            // Obtener el id generado
            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int idEvento = generatedKeys.getInt(1);

                    // Llamar a otra función que requiere el id, fecha_inicio y fecha_fin
                    fechas_evento(idEvento, eventoB.getFecha_inicio(), eventoB.getFecha_fin());
                } else {
                    throw new SQLException("Creating event failed, no ID obtained.");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error al insertar en la base de datos", e);
        }
    }

    public void fechas_evento(int idEvento, String fechaInicio, String fechaFin) {
        // Implementación de la función que utiliza idEvento, fechaInicio y fechaFin
    }

    public ArrayList<ProfesoresEvento> listarProfesores() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        ArrayList<ProfesoresEvento> lista = new ArrayList<>();
        String url = "jdbc:mysql://localhost:3306/televecinosdb";
        String username = "root";
        String password = "root";
        String sql = "SELECT * FROM profesoresevento";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                ProfesoresEvento pEvento = new ProfesoresEvento();
                pEvento.setIdProfesoresEvento(rs.getInt(1));
                pEvento.setNombre(rs.getString(2));
                pEvento.setApellido(rs.getString(3));
                pEvento.setCurso(rs.getString(4));
                lista.add(pEvento);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }

    public void actualizarEvento(EventoB evento) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/televecinosdb";
        String username = "root";
        String password = "root";
        String sql = "UPDATE Eventos SET nombre = ?, descripcion = ?, lugar = ?, " +
                "fecha_inicio = ?, fecha_fin = ?, EventFrecuencia_idEventFrecuencia = ?, ProfesoresEvento_idProfesoresEvento = ?, " +
                "cantidadVacantes = ?, foto = ?, listaMateriales = ?, hora_inicio = ?, hora_fin = ?, diasEvento = ? WHERE idEventos = ? AND eliminado = FALSE";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, evento.getNombre());
            ps.setString(2, evento.getDescripcion());
            ps.setString(3, evento.getLugar());
            // ps.setInt(4, evento.getCoordinador_idUsuario()); // Descomentar si es necesario
            ps.setString(4, evento.getFecha_inicio());
            ps.setString(5, evento.getFecha_fin());
            ps.setInt(6, evento.getEventFrecuencia_idEventFrecuencia());
            ps.setInt(7, evento.getProfesoresEvento_idProfesoresEvento());
            ps.setInt(8, evento.getCantidadVacantes());
            ps.setString(9, evento.getFoto());
            ps.setString(10, evento.getListaMateriales());
            ps.setString(11, evento.getHora_inicio());
            ps.setString(12, evento.getHora_fin());
            ps.setString(13, evento.getDiaEvento());
            ps.setInt(14, evento.getIdEvento());

            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean borrarEvento(int id) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/televecinosdb";
        String username = "root";
        String password = "root";
        String sql = "UPDATE Eventos SET eliminado = TRUE WHERE idEventos = ?";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return true;
    }
}

