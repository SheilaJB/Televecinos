package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.EventoB;
import org.example.televecinosunidos_appweb.model.beans.ProfesoresEvento;

import java.time.LocalDate;
import java.time.DayOfWeek;
import java.time.temporal.TemporalAdjusters;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EventoDao extends BaseDao{

    //Función lista de eventos
    public ArrayList<EventoB> listarEventosPropios() {

        String sqlSetLanguage = "SET lc_time_names = 'es_ES';";
        String sql = "SELECT e.idEventos AS 'ID Evento', e.nombre AS 'Nombre', DATE_FORMAT(e.fecha_inicio, '%d %M') AS 'Fecha de Inicio', " +
                "es.estadosEvento AS 'Estado', ef.tipoFrecuencia AS 'Frecuencia' " +
                "FROM Eventos e JOIN EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados " +
                "JOIN EventFrecuencia ef ON e.EventFrecuencia_idEventFrecuencia = ef.idEventFrecuencia " +
                "WHERE e.TipoEvento_idTipoEvento = 2 AND e.eliminado = FALSE " +
                "ORDER BY e.fecha_inicio DESC " +
                "LIMIT 6;";

        ArrayList<EventoB> listaEventosPropios = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {

            // Ejecutar la sentencia para establecer el idioma de las fechas en español
            stmt.execute(sqlSetLanguage);

            // Ejecutar la consulta principal
            try (ResultSet rs = stmt.executeQuery(sql)) {
                while (rs.next()) {
                    EventoB evento = new EventoB();
                    evento.setidEvento(rs.getInt("ID Evento"));
                    evento.setNombre(rs.getString("Nombre"));
                    evento.setFecha_inicio(rs.getString("Fecha de Inicio"));
                    evento.setEstadoString(rs.getString("Estado"));
                    evento.setFrecuenciaString(rs.getString("Frecuencia"));
                    listaEventosPropios.add(evento);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaEventosPropios;
    }

    //Función lista de eventos disponibles
    public ArrayList<EventoB> listarEventosDisponibles() {

        String sqlSetLanguage = "SET lc_time_names = 'es_ES';";
        String sql = "SELECT \n" +
                "e.idEventos AS 'ID Evento', \n" +
                "e.nombre AS 'Nombre', \n" +
                "DATE_FORMAT(e.fecha_inicio, '%d %M') AS 'Fecha de Inicio', \n" +
                "DATE_FORMAT(e.fecha_fin, '%d %M') AS 'Fecha de finalizacion', \n" +
                "es.estadosEvento AS 'Estado', \n" +
                "ef.tipoFrecuencia AS 'Frecuencia' ,\n" +
                "DATE_FORMAT(e.hora_inicio, '%H:%i') AS hora_inicio, \n" +
                "DATE_FORMAT(e.hora_fin, '%H:%i') AS hora_fin \n" +
                "FROM \n" +
                "    Eventos e \n" +
                "JOIN \n" +
                "    EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados \n" +
                "JOIN \n" +
                "    EventFrecuencia ef ON e.EventFrecuencia_idEventFrecuencia = ef.idEventFrecuencia \n" +
                "WHERE \n" +
                "    e.TipoEvento_idTipoEvento = 2 \n" +
                "    AND e.eliminado = FALSE \n" +
                "ORDER BY \n" +
                "    e.fecha_inicio DESC ;";

        ArrayList<EventoB> listaEventosDisponible = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {

            // Ejecutar la sentencia para establecer el idioma de las fechas en español
            stmt.execute(sqlSetLanguage);

            // Ejecutar la consulta principal
            try (ResultSet rs = stmt.executeQuery(sql)) {
                while (rs.next()) {
                    EventoB evento = new EventoB();
                    evento.setidEvento(rs.getInt("ID Evento"));
                    evento.setNombre(rs.getString("Nombre"));
                    evento.setFecha_inicio(rs.getString("Fecha de Inicio"));
                    evento.setFecha_fin(rs.getString("Fecha de finalizacion"));
                    evento.setEstadoString(rs.getString("Estado"));
                    evento.setFrecuenciaString(rs.getString("Frecuencia"));
                    evento.setHora_inicio(rs.getString("hora_inicio"));
                    evento.setHora_fin(rs.getString("hora_fin"));
                    listaEventosDisponible.add(evento);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaEventosDisponible;
    }

    //Mostrar solo los 3 eventos creados recientemente
    public ArrayList<EventoB> listarEventosPropiosRecientes() {

        String sqlSetLanguage = "SET lc_time_names = 'es_ES';";
        String sql = "SELECT e.idEventos AS 'ID Evento', e.nombre AS 'Nombre', DATE_FORMAT(e.fecha_inicio, '%d %M') AS 'Fecha de Inicio', " +
                "es.estadosEvento AS 'Estado', ef.tipoFrecuencia AS 'Frecuencia' " +
                "FROM Eventos e JOIN EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados " +
                "JOIN EventFrecuencia ef ON e.EventFrecuencia_idEventFrecuencia = ef.idEventFrecuencia " +
                "WHERE e.TipoEvento_idTipoEvento = 1 AND e.eliminado = FALSE " +
                "ORDER BY e.fecha_inicio DESC " +
                "LIMIT 3;";

        ArrayList<EventoB> listaEventosPropios = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {

            // Ejecutar la sentencia para establecer el idioma de las fechas en español
            stmt.execute(sqlSetLanguage);

            // Ejecutar la consulta principal
            try (ResultSet rs = stmt.executeQuery(sql)) {
                while (rs.next()) {
                    EventoB evento = new EventoB();
                    evento.setidEvento(rs.getInt("ID Evento"));
                    evento.setNombre(rs.getString("Nombre"));
                    evento.setFecha_inicio(rs.getString("Fecha de Inicio"));
                    evento.setEstadoString(rs.getString("Estado"));
                    evento.setFrecuenciaString(rs.getString("Frecuencia"));
                    listaEventosPropios.add(evento);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaEventosPropios;
    }

    //Function buscar un evento
    public EventoB buscarEventoPorId(String idEvento) {
        EventoB evento = null;

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

        try (Connection conn = getConnection();
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
                    evento.setNombreCoordinador(rs.getString("nombre_coordinador"));
                    evento.setApellidoProfesor(rs.getString("apellidoProfesor"));
                    evento.setApellidoCoordinador(rs.getString("apellido_coordinador"));
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

        String sql = "INSERT INTO `televecinosDB`.`eventos` \n" +
                "(`nombre`, `descripcion`, `lugar`, `Coordinador_idUsuario`, `fecha_inicio`, `fecha_fin`, `cantidadVacantes`, `cantDisponibles`, `foto`, `listaMateriales`, `EventEstados_idEventEstados`, `EventFrecuencia_idEventFrecuencia`, `TipoEvento_idTipoEvento`, `ProfesoresEvento_idProfesoresEvento`, `hora_inicio`, `hora_fin`, `diasEvento`) \n" +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = getConnection();
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

            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int idEvento = generatedKeys.getInt(1);

                    fechasEvento(idEvento, eventoB.getFecha_inicio(), eventoB.getFecha_fin(), eventoB.getEventFrecuencia_idEventFrecuencia(), eventoB.getDiaEvento());
                } else {
                    throw new SQLException("Creating event failed, no ID obtained.");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error al insertar en la base de datos", e);
        }
    }

    public void fechasEvento(int idEvento, String fechaInicio, String fechaFin, int frecuencia, String diaEvento) {
        LocalDate inicio = LocalDate.parse(fechaInicio);
        LocalDate fin = LocalDate.parse(fechaFin);


        ArrayList<LocalDate> fechasEntre = new ArrayList<>();
        ArrayList<LocalDate> fechasEntre2 = new ArrayList<>();
        LocalDate fechaActual = inicio;
        if(frecuencia == 1){
            fechasEntre.add(inicio);
            while (!fechaActual.isAfter(fin)) {
                LocalDate siguienteFecha = fechaActual.with(TemporalAdjusters.next(fechaActual.getDayOfWeek()));
                if (!siguienteFecha.isAfter(fin)) {
                    fechasEntre.add(siguienteFecha);
                }
                fechaActual = siguienteFecha;
            }
        } else if (frecuencia == 2) {
            while (!fechaActual.isAfter(fin)) {
                fechasEntre.add(fechaActual);
                LocalDate fechaDosDiasDespues = fechaActual.plusDays(2);
                if (!fechaDosDiasDespues.isAfter(fin)) {
                    fechasEntre2.add(fechaDosDiasDespues);
                }else{
                    fechasEntre2.add(null);
                }
                fechaActual = fechaActual.with(TemporalAdjusters.next(fechaActual.getDayOfWeek()));
            }
        }

        for (int i = 0; i < fechasEntre.size(); i++) {
            String url = "jdbc:mysql://localhost:3306/televecinosdb";
            String username = "root";
            String password = "root";
            String sql = "INSERT INTO dias_evento (eventos_idEventos, dia1, dia2) VALUES (?, ?, ?)";
            try (Connection connection = DriverManager.getConnection(url, username, password);
                 PreparedStatement pstmt = connection.prepareStatement(sql)) {
                if (frecuencia == 1){
                    pstmt.setInt(1, idEvento);
                    pstmt.setString(2, fechasEntre.get(i).toString());
                    pstmt.setNull(3, java.sql.Types.INTEGER);
                }else{
                    pstmt.setInt(1, idEvento);
                    pstmt.setString(2, fechasEntre.get(i).toString());
                    if (fechasEntre2.get(i) != null) {
                        pstmt.setString(3, fechasEntre2.get(i).toString());
                    }else{
                        pstmt.setNull(3, java.sql.Types.INTEGER);
                    }

                }
                pstmt.executeUpdate();

            } catch (SQLException e) {
                e.printStackTrace();
                throw new RuntimeException("Error al insertar en la base de datos", e);
            }

        }
    }
    public void eliminarFechasEventoPorIdEvento(int eventosId) {
        String url = "jdbc:mysql://localhost:3306/televecinosdb";
        String username = "root";
        String password = "root";
        String sql = "DELETE FROM dias_evento WHERE eventos_idEventos = ?";

        try (Connection connection = DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, eventosId);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error al eliminar días de evento en la base de datos", e);
        }
    }

    public ArrayList<ProfesoresEvento> listarProfesores() {
        ArrayList<ProfesoresEvento> lista = new ArrayList<>();
        String sql = "SELECT * FROM profesoresevento";

        try (Connection conn = getConnection();
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

        String sql = "UPDATE Eventos SET nombre = ?, descripcion = ?, lugar = ?, " +
                "fecha_inicio = ?, fecha_fin = ?, EventFrecuencia_idEventFrecuencia = ?, ProfesoresEvento_idProfesoresEvento = ?, " +
                "cantidadVacantes = ?, foto = ?, listaMateriales = ?, hora_inicio = ?, hora_fin = ?, diasEvento = ? WHERE idEventos = ? AND eliminado = FALSE";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS)) {
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

            fechasEvento(evento.getIdEvento(), evento.getFecha_inicio(), evento.getFecha_fin(), evento.getEventFrecuencia_idEventFrecuencia(), evento.getDiaEvento());

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean borrarEvento(int id) {

        String sql = "UPDATE Eventos SET eliminado = TRUE WHERE idEventos = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return true;
    }
    //Buscar evento por filtro
    public ArrayList<EventoB> listarEventoFiltro(String nombre, String frecuencia, String estado) {
        String sql = "SELECT " +
                "    e.idEventos AS id_evento, " +
                "    e.nombre AS nombre, " +
                "    e.descripcion AS descripcion, " +
                "    u.idUsuario AS id_coordinador, " +
                "    u.nombre AS nombre_coordinador, " +
                "    u.apellido AS apellido_coordinador, " +
                "    e.lugar AS lugar, " +
                "    ef.tipoFrecuencia AS frecuencia, " +
                "    es.estadosEvento AS estado, " +
                "    e.cantidadVacantes AS cantidad_vacantes, " +
                "    e.cantDisponibles AS cantidad_disponibles, " +
                "    e.foto AS foto, " +
                "    DATE_FORMAT(e.fecha_inicio, '%Y-%m-%d') AS fecha_inicio, " +
                "    DATE_FORMAT(e.fecha_fin, '%Y-%m-%d') AS fecha_fin, " +
                "    pf.idProfesoresEvento AS id_profesor, " +
                "    pf.nombre AS nombreProfesor, " +
                "    pf.apellido AS apellidoProfesor, " +
                "    TIME(e.hora_inicio) AS hora_inicio, " +
                "    TIME(e.hora_fin) AS hora_fin, " +
                "    e.listaMateriales AS listaMateriales, " +
                "    e.diasEvento as diasEvento " +
                "FROM " +
                "    Eventos e " +
                "JOIN EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados " +
                "JOIN Usuario u ON e.Coordinador_idUsuario = u.idUsuario " +
                "JOIN EventFrecuencia ef ON e.EventFrecuencia_idEventFrecuencia = ef.idEventFrecuencia " +
                "JOIN profesoresevento pf ON e.ProfesoresEvento_idProfesoresEvento = pf.idProfesoresEvento " +
                "WHERE e.nombre LIKE ? ";

        ArrayList<EventoB> evento = new ArrayList<>();
        List<Object> parametros = new ArrayList<>();
        parametros.add(nombre + "%");

        // Agregar los filtros adicionales
        if (frecuencia != null && !frecuencia.isEmpty()) {
            sql += "AND ef.idEventFrecuencia = ? ";
            parametros.add(frecuencia);
        }

        if (estado != null && !estado.isEmpty()) {
            sql += "AND es.idEventEstados = ? ";
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
                    EventoB event = new EventoB();
                    event.setidEvento(rs.getInt("id_evento"));
                    event.setNombre(rs.getString("nombre"));
                    event.setFecha_inicio(rs.getString("fecha_inicio"));
                    event.setEstadoString(rs.getString("estado"));
                    event.setFrecuenciaString(rs.getString("frecuencia"));
                    evento.add(event);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al listar eventos filtradas", e);
        }
        return evento;
    }

    //Función para listar todos los eventos tipo para Vecino
    public ArrayList<EventoB> listarTodosEventos() {

        String sqlSetLanguage = "SET lc_time_names = 'es_ES';";
        String sql = "SELECT e.idEventos AS 'ID Evento', e.nombre AS 'Nombre', e.descripcion AS 'Descripcion', " +
                "DATE_FORMAT(e.fecha_inicio, '%d %M %Y') AS 'Fecha de Inicio', " +
                "DATE_FORMAT(e.fecha_fin, '%d %M %Y') AS 'Fecha de Fin', " +
                "es.estadosEvento AS 'Estado', e.foto AS 'Foto' " +
                "FROM Eventos e " +
                "JOIN EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados " +
                "WHERE e.eliminado = FALSE " +
                "ORDER BY e.fecha_inicio DESC";

        ArrayList<EventoB> listaTodosEventos = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {

            // Ejecutar la sentencia para establecer el idioma de las fechas en español
            stmt.execute(sqlSetLanguage);

            // Ejecutar la consulta principal
            try (ResultSet rs = stmt.executeQuery(sql)) {
                while (rs.next()) {
                    EventoB evento = new EventoB();
                    evento.setidEvento(rs.getInt("ID Evento"));
                    evento.setNombre(rs.getString("Nombre"));
                    evento.setDescripcion(rs.getString("Descripcion"));
                    evento.setFecha_inicio(rs.getString("Fecha de Inicio"));
                    evento.setFecha_fin(rs.getString("Fecha de Fin"));
                    evento.setEstadoString(rs.getString("Estado"));
                    evento.setFoto(rs.getString("Foto"));
                    listaTodosEventos.add(evento);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaTodosEventos;
    }

    //Lista de eventos generales para Coordinador Deporte
    public ArrayList<EventoB> listarTodosEventosCoordinadorDeporte() {

        String sqlSetLanguage = "SET lc_time_names = 'es_ES';";
        String sql = "SELECT \n" +
                "    e.idEventos AS 'ID Evento', \n" +
                "    e.nombre AS 'Nombre', \n" +
                "    e.descripcion AS 'Descripcion', \n" +
                "    DATE_FORMAT(e.fecha_inicio, '%d %M %Y') AS 'Fecha de Inicio', \n" +
                "    DATE_FORMAT(e.fecha_fin, '%d %M %Y') AS 'Fecha de Fin', \n" +
                "    es.estadosEvento AS 'Estado', \n" +
                "    e.foto AS 'Foto'\n" +
                "FROM \n" +
                "    Eventos e\n" +
                "JOIN \n" +
                "    EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados\n" +
                "WHERE \n" +
                "    e.eliminado = FALSE AND e.TipoEvento_idTipoEvento = 2\n" +
                "ORDER BY \n" +
                "    e.fecha_inicio DESC;";

        ArrayList<EventoB> listaTodosEventos = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {

            // Ejecutar la sentencia para establecer el idioma de las fechas en español
            stmt.execute(sqlSetLanguage);

            // Ejecutar la consulta principal
            try (ResultSet rs = stmt.executeQuery(sql)) {
                while (rs.next()) {
                    EventoB evento = new EventoB();
                    evento.setidEvento(rs.getInt("ID Evento"));
                    evento.setNombre(rs.getString("Nombre"));
                    evento.setDescripcion(rs.getString("Descripcion"));
                    evento.setFecha_inicio(rs.getString("Fecha de Inicio"));
                    evento.setFecha_fin(rs.getString("Fecha de Fin"));
                    evento.setEstadoString(rs.getString("Estado"));
                    evento.setFoto(rs.getString("Foto"));
                    listaTodosEventos.add(evento);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaTodosEventos;
    }

    //Lista de eventos generales para Coordinador Cultura
    public ArrayList<EventoB> listarTodosEventosCoordinadorCultura() {

        String sqlSetLanguage = "SET lc_time_names = 'es_ES';";
        String sql = "SELECT \n" +
                "    e.idEventos AS 'ID Evento', \n" +
                "    e.nombre AS 'Nombre', \n" +
                "    e.descripcion AS 'Descripcion', \n" +
                "    DATE_FORMAT(e.fecha_inicio, '%d %M %Y') AS 'Fecha de Inicio', \n" +
                "    DATE_FORMAT(e.fecha_fin, '%d %M %Y') AS 'Fecha de Fin', \n" +
                "    es.estadosEvento AS 'Estado', \n" +
                "    e.foto AS 'Foto'\n" +
                "FROM \n" +
                "    Eventos e\n" +
                "JOIN \n" +
                "    EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados\n" +
                "WHERE \n" +
                "    e.eliminado = FALSE AND e.TipoEvento_idTipoEvento = 1\n" +
                "ORDER BY \n" +
                "    e.fecha_inicio DESC;";

        ArrayList<EventoB> listaTodosEventos = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {

            // Ejecutar la sentencia para establecer el idioma de las fechas en español
            stmt.execute(sqlSetLanguage);

            // Ejecutar la consulta principal
            try (ResultSet rs = stmt.executeQuery(sql)) {
                while (rs.next()) {
                    EventoB evento = new EventoB();
                    evento.setidEvento(rs.getInt("ID Evento"));
                    evento.setNombre(rs.getString("Nombre"));
                    evento.setDescripcion(rs.getString("Descripcion"));
                    evento.setFecha_inicio(rs.getString("Fecha de Inicio"));
                    evento.setFecha_fin(rs.getString("Fecha de Fin"));
                    evento.setEstadoString(rs.getString("Estado"));
                    evento.setFoto(rs.getString("Foto"));
                    listaTodosEventos.add(evento);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaTodosEventos;
    }

    public boolean inscribirUsuarioEvento(int idUsuario, int idEvento) {
        String sql = "INSERT INTO flujo_usuario_evento (Usuario_idUsuario, Eventos_idEventos) VALUES (?, ?)";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idUsuario);
            pstmt.setInt(2, idEvento);

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}

