package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.EventoB;

import java.sql.*;
import java.util.ArrayList;

public class EventoDao {

    public ArrayList<EventoB> listarEventosPropios() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/mydb";
        String username = "root";
        String password = "root";

        String sql =
                "SELECT " +
                        "e.idEventos AS 'ID Evento', " +
                        "e.nombre AS 'Nombre', " +
                        "DATE_FORMAT(e.fecha_inicio, '%d %M') AS 'Fecha de Inicio', " +
                        "es.estadosEvento AS 'Estado' " +
                        "FROM " +
                        "Eventos e " +
                        "JOIN " +
                        "EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados " +
                        "WHERE " +
                        "e.TipoEvento_idTipoEvento = 2;";

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
                listaEventosPropios.add(evento); // Asegurarse de añadir el evento a la lista
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaEventosPropios;
    }
}
