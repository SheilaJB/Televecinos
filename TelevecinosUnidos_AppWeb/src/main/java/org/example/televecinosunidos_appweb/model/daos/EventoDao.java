package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.EventoB;

import java.sql.*;
import java.util.ArrayList;

//Evento: crea,buscar,  editar, listar y eliminar

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
                evento.setidEvento(rs.getInt("ID Evento"));
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
                    evento.setNombre(rs.getString(2));
                    evento.setLugar(rs.getString(3));
                    evento.setFecha_inicio(rs.getString(4));
                    evento.setFecha_fin(rs.getString(5));
                    evento.setCantidadVacantes(rs.getInt(6));
                    evento.setFoto(rs.getString(8));
                    evento.setListaMateriales(rs.getString(9));
                    evento.setEventFrecuencia_idEventFrecuencia(rs.getInt(10));
                    evento.setProfesoresEvento_idProfesoresEvento(rs.getInt(11));

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return evento;
    }

    //Function crear evento
    public void crearEvento(String nombre, String descripcion, int Coordinador_idUsuario,
                            int ProfesoresEvento_idProfesoresEvento, String lugar, int frecuencia,
                            int cantidadVacantes, String fecha_inicio, String fecha_fin, String foto, String listaMateriales, int EventFrecuencia_idEventFrecuencia ) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/televecinosdb";
        String username = "root";
        String password = "root";

        // Cadena SQL de inserción
        String sql = "INSERT INTO Eventos (nombre, descripcion, lugar, Coordinador_idUsuario, fecha_inicio, fecha_fin, cantidadVacantes, foto, listaMateriales, EventFrecuencia_idEventFrecuencia, ProfesoresEvento_idProfesoresEvento) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(url, username, password);
                PreparedStatement pstmt = connection.prepareStatement(sql)) {
            // Establece los valores de los parámetros
            pstmt.setString(1, nombre);
            pstmt.setString(2, descripcion);
            pstmt.setString(3, lugar);
            pstmt.setInt(4, Coordinador_idUsuario);
            pstmt.setString(5, fecha_inicio);
            pstmt.setString(6, fecha_fin);
            pstmt.setInt(7, cantidadVacantes);
            pstmt.setString(8, foto);
            pstmt.setString(9, listaMateriales);
            pstmt.setInt(10, EventFrecuencia_idEventFrecuencia);
            pstmt.setInt(11, ProfesoresEvento_idProfesoresEvento);

            // Ejecuta la actualización
            pstmt.executeUpdate();

        } catch (SQLException e) {
            // Manejo de excepciones SQL
            e.printStackTrace();
            throw new RuntimeException("Error al insertar en la base de datos", e);
        }

    }

    /*public void actualizar(EventoB eventoB){

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/televecinos.db";
        String username = "root";
        String password = "root";

        String sql = "update jobs set job_title = ?, min_salary = ?, max_salary = ? where job_id = ?";

        try(Connection connection = DriverManager.getConnection(url,username,password);
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,eventoB.getJobTitle());
            pstmt.setInt(2,eventoB.getMinSalary());
            pstmt.setInt(3,eventoB.getMaxSalary());
            pstmt.setString(4,eventoB.getJobId());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }*/
    //Function editar evento
    


    //Function eliminar evento





}
