package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.EventoB;

import java.sql.*;
import java.util.ArrayList;

public class EventoDao {

    public ArrayList<EventoB> listaEventos(){

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/hr";
        String username = "root";
        String password = "root";

        String sql = "aaaaaaaaaaaaaaaNiloApura";
        ArrayList<EventoB> listaEventos = new ArrayList<EventoB>();


        try(Connection conn = DriverManager.getConnection(url,username,password); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql);) {//usamos try con recursos

            while(rs.next()){
                EventoB evento = new EventoB();
                evento.setNombre(rs.getString(1));
                evento.setDescripcion(rs.getString(2));
                evento.setLugar(rs.getString(3));
                evento.setFecha_inicio(rs.getString(4));
                //falta terminar pero necesito el querie
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaEventos;
    }
}
