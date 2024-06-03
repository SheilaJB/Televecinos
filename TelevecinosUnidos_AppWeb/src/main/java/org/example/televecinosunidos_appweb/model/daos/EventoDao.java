package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.EventoB;
import org.example.televecinosunidos_appweb.model.beans.UsuarioB;

import java.sql.*;
import java.util.ArrayList;

public class EventoDao {

    public ArrayList<EventoB> listarEventosPropios() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/televecinosdb";
        String username = "root";
        String password = "root";

        String sql =
                "SELECT " +
                        "e.idEventos AS 'ID Evento', " +
                        "e.nombre AS 'Nombre', " +
                        "DATE_FORMAT(e.fecha_inicio, '%d %M') AS 'Fecha de Inicio', " +
                        "es.estadosEvento AS 'Estado', " +
                        "ef.tipoFrecuencia AS 'Frecuencia' " +
                        "FROM " +
                        "Eventos e " +
                        "JOIN " +
                        "EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados " +
                        "JOIN " +
                        "EventFrecuencia ef ON e.EventFrecuencia_idEventFrecuencia = ef.idEventFrecuencia " +
                        "WHERE " +
                        "e.TipoEvento_idTipoEvento = 2;"; //tipo 2 para mostrar solo los eventos de deportes

        ArrayList<EventoB> listaEventosPropios = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                EventoB evento = new EventoB();
                evento.setIdEvento(rs.getInt("ID Evento"));
                evento.setNombre(rs.getString("Nombre"));
                evento.setFecha_inicio(rs.getString("Fecha de Inicio"));
                evento.setEstadoString(rs.getString("Estado"));
                evento.setFrecuenciaString(rs.getString("Frecuencia"));
                listaEventosPropios.add(evento); // Asegurarse de añadir el evento a la lista
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaEventosPropios;
    }


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
                "e.descripcion AS descripcion_evento, " +
                "u.nombre AS nombre_coordinador, " +
                "u.apellido AS apellido_coordinador, " +
                "e.lugar AS lugar_evento, " +
                "ef.tipoFrecuencia AS frecuencia, " +
                "e.cantidadVacantes AS cantidad_vacantes, " +
                "e.cantDisponibles AS cantidad_disponibles, " +
                "DATE(e.fecha_inicio) AS fecha_inicio, " +
                "DATE(e.fecha_fin) AS fecha_fin, " +
                "TIME(e.fecha_inicio) AS hora_inicio, " +
                "TIME(e.fecha_fin) AS hora_fin " +
                "FROM " +
                "Eventos e " +
                "JOIN " +
                "Usuario u ON e.Coordinador_idUsuario = u.idUsuario " +
                "JOIN " +
                "EventFrecuencia ef ON e.EventFrecuencia_idEventFrecuencia = ef.idEventFrecuencia " +
                "WHERE e.idEventos = ?";



        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,idEvento);

            try(ResultSet rs = pstmt.executeQuery()){
                while (rs.next()) {
                    evento = new EventoB();
                    evento.setDescripcion(rs.getString(1));


                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return evento;
    }

}
