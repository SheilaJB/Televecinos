package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.EventoB;
import org.example.televecinosunidos_appweb.model.beans.SerenazgoB;

import java.sql.*;
import java.util.ArrayList;

public class SerenazgoDao {
    //Función lista de serenazgos
    public ArrayList<SerenazgoB> listarSerenazgos() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/televecinosdb";
        String username = "root";
        String password = "root";

        String sql = "";

        ArrayList<SerenazgoB> listaEventosPropios = new ArrayList<>();

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
                listaEventosPropios.add(evento); // Asegurarse de añadir el serenazgo a la lista
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaEventosPropios;
    }

}
