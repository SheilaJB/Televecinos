package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.EventoB;

import java.sql.*;
import java.util.ArrayList;

public class EventoDao {

    public ArrayList<EventoB> listarEventosPropios(){

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/mydb";
        String username = "root";
        String password = "root";

        String sql = "select * from eventos"; // falta cambiar el querie
        ArrayList<EventoB> listaEventosPropios = new ArrayList<EventoB>();


        try(Connection conn = DriverManager.getConnection(url,username,password); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql);) {//usamos try con recursos

            while(rs.next()){
                EventoB evento = new EventoB();
                evento.setIdEvento(rs.getInt(1));
                evento.setNombre(rs.getString(2));
                evento.setFecha_inicio(rs.getString(3));
                evento.setEstadoString(rs.getString(4));
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaEventosPropios;
    }
}
