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
                "u.idUsuario AS id_coordinador, " +  // Agregar id_coordinador
                "u.nombre AS nombre_coordinador, " +
                "u.apellido AS apellido_coordinador, " +
                "e.lugar AS lugar, " +
                "ef.tipoFrecuencia AS frecuencia, " +
                "e.cantidadVacantes AS cantidad_vacantes, " +
                "e.cantDisponibles AS cantidad_disponibles, " +
                "e.foto AS foto, " +
                "DATE_FORMAT(e.fecha_inicio, '%Y-%m-%d') AS fecha_inicio, " +
                "DATE_FORMAT(e.fecha_fin, '%Y-%m-%d') AS fecha_fin, " +
                "pf.idProfesoresEvento AS id_profesor, " +  // Agregar id_profesor
                "pf.nombre AS nombreProfesor, " +
                "pf.apellido AS apellidoProfesor, " +
                "TIME(e.fecha_inicio) AS hora_inicio, " +
                "TIME(e.fecha_fin) AS hora_fin, " +
                "e.listaMateriales AS listaMateriales " +
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
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return evento;
    }


    // Function crear evento
    public void crearEvento(String nombre, String descripcion, int Coordinador_idUsuario, int ProfesoresEvento_idProfesoresEvento,
                            String lugar, int cantidadVacantes, String fecha_inicio, String fecha_fin, String foto,
                            String listaMateriales, int EventFrecuencia_idEventFrecuencia, int estado) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/televecinosdb";
        String username = "root";
        String password = "root";
        String sql = "INSERT INTO Eventos (nombre, descripcion, lugar, Coordinador_idUsuario, fecha_inicio, fecha_fin, " +
                "cantidadVacantes, cantDisponibles, foto, listaMateriales, EventEstados_idEventEstados, " +
                "EventFrecuencia_idEventFrecuencia, TipoEvento_idTipoEvento, ProfesoresEvento_idProfesoresEvento, eliminado) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, FALSE)";

        try (Connection connection = DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            int tipoEvento = 1;
            pstmt.setString(1, nombre);
            pstmt.setString(2, descripcion);
            pstmt.setString(3, lugar);
            pstmt.setInt(4, Coordinador_idUsuario);
            pstmt.setString(5, fecha_inicio);
            pstmt.setString(6, fecha_fin);
            pstmt.setInt(7, cantidadVacantes);
            pstmt.setInt(8, cantidadVacantes);
            pstmt.setString(9, foto);
            pstmt.setString(10, listaMateriales);
            pstmt.setInt(11, estado);
            pstmt.setInt(12, EventFrecuencia_idEventFrecuencia);
            pstmt.setInt(13, tipoEvento);
            pstmt.setInt(14, ProfesoresEvento_idProfesoresEvento);

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error al insertar en la base de datos", e);
        }
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
                "cantidadVacantes = ?, foto = ?, listaMateriales = ? WHERE idEventos = ? AND eliminado = FALSE";

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
            ps.setInt(11, evento.getIdEvento());

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

