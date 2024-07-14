package org.example.televecinosunidos_appweb.model.daos;


import org.example.televecinosunidos_appweb.model.beans.AsistenciaCoordB;
import org.example.televecinosunidos_appweb.model.beans.EventoB;
import org.example.televecinosunidos_appweb.model.beans.ProfesoresEvento;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Logger;


public class EventoDao extends BaseDao{

    public static final Logger logger = Logger.getLogger(EventoDao.class.getName());

    //Función lista de eventos
    public ArrayList<EventoB> listarEventosPropios(int idTipoEvento) {
        String sqlSetLanguage = "SET lc_time_names = 'es_ES';";
        String sqlSetTotalRows = "SET @total_rows = (SELECT COUNT(*) FROM Eventos WHERE TipoEvento_idTipoEvento = ? AND eliminado = FALSE);";
        String sqlSetNumPartitions = "SET @num_partitions = FLOOR((@total_rows + 4) / 5);"; // Ajustado para calcular el número de particiones

        String sql = "SELECT \n" +
                "    (@row_number := @row_number + 1) AS row_num,\n" +
                "    CEILING(@row_number / 5) AS 'pag',\n" +
                "    e.idEventos AS 'ID Evento', \n" +
                "    e.nombre AS 'Nombre', \n" +
                "    DATE_FORMAT(e.fecha_inicio, '%d %M %Y') AS 'Fecha de Inicio', \n" +
                "    es.estadosEvento AS 'Estado', \n" +
                "    ef.tipoFrecuencia AS 'Frecuencia'\n" +
                "FROM Eventos e \n" +
                "JOIN EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados \n" +
                "JOIN EventFrecuencia ef ON e.EventFrecuencia_idEventFrecuencia = ef.idEventFrecuencia \n" +
                "WHERE e.TipoEvento_idTipoEvento = ? AND e.eliminado = FALSE \n" +
                "ORDER BY " +
                "    CASE WHEN es.estadosEvento = 'Finalizado' THEN 1 ELSE 0 END, \n" +
                "    e.fecha_inicio DESC;";

        ArrayList<EventoB> listaEventosPropios = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Ejecutar la sentencia para establecer el idioma de las fechas en español
            stmt.execute(sqlSetLanguage);

            // Ejecutar las sentencias SET para total_rows y num_partitions
            PreparedStatement pstmtTotalRows = conn.prepareStatement(sqlSetTotalRows);
            pstmtTotalRows.setInt(1, idTipoEvento);
            pstmtTotalRows.execute();

            stmt.execute(sqlSetNumPartitions);

            // Establecer el parámetro para el PreparedStatement
            pstmt.setInt(1, idTipoEvento);

            // Inicializar la variable de sesión para el número de fila
            stmt.execute("SET @row_number = 0;");

            // Ejecutar la consulta principal
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    EventoB evento = new EventoB();
                    evento.setIdPag(rs.getInt("pag"));
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
    public ArrayList<EventoB> listarEventosDisponibles() { ///Corregir

        String sqlSetLanguage = "SET lc_time_names = 'es_ES';";
        String sql = "SELECT \n" +
                "e.idEventos AS 'ID Evento', \n" +
                "e.nombre AS 'Nombre', \n" +
                "DATE_FORMAT(e.fecha_inicio, '%d %M %Y') AS 'Fecha de Inicio', \n" +
                "DATE_FORMAT(e.fecha_fin, '%d %M %Y') AS 'Fecha de finalizacion', \n" +
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
    public ArrayList<EventoB> listarEventosPropiosRecientes(int idUser, int idTipoCoord) {
        ArrayList<EventoB> listaEventosPropios = new ArrayList<>();
        String sqlSetLanguage = "SET lc_time_names = 'es_ES';";
        String sql = "SELECT e.idEventos AS 'ID Evento', e.nombre AS 'Nombre', \n" +
                "       DATE_FORMAT(e.fecha_inicio, '%d %M') AS 'Fecha de Inicio', \n" +
                "       es.estadosEvento AS 'Estado', ef.tipoFrecuencia AS 'Frecuencia' \n" +
                "FROM Eventos e \n" +
                "JOIN EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados \n" +
                "JOIN EventFrecuencia ef ON e.EventFrecuencia_idEventFrecuencia = ef.idEventFrecuencia \n" +
                "JOIN flujo_usuario_evento fue ON e.idEventos = fue.Eventos_idEventos \n" +
                "JOIN usuario u ON e.Coordinador_idUsuario = u.idUsuario \n" +
                "WHERE e.TipoEvento_idTipoEvento = ? AND e.eliminado = FALSE AND u.idUsuario = ? \n" +
                "      AND MONTH(e.fecha_inicio) = MONTH(CURRENT_DATE()) \n" +
                "ORDER BY e.fecha_inicio DESC\n" +
                "LIMIT 5;";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Ejecutar la sentencia para establecer el idioma de las fechas en español
            pstmt.execute(sqlSetLanguage);

            // Configurar los parámetros idTipoCoord e idUser
            pstmt.setInt(1, idTipoCoord);
            pstmt.setInt(2, idUser);

            // Ejecutar la consulta principal
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    EventoB evento = new EventoB();
                    evento.setIdEvento(rs.getInt("ID Evento"));
                    evento.setNombre(rs.getString("Nombre"));
                    evento.setFecha_inicio(rs.getString("Fecha de Inicio"));
                    evento.setEstadoString(rs.getString("Estado"));
                    evento.setFrecuenciaString(rs.getString("Frecuencia"));
                    listaEventosPropios.add(evento);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al listar eventos propios recientes: " + e.getMessage(), e);
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
                "e.nombreFoto AS nombreFoto, " +
                "DATE_FORMAT(e.fecha_inicio, '%d %M %Y') AS fecha_inicio, " +
                "DATE_FORMAT(e.fecha_fin, '%d %M %Y') AS fecha_fin, " +
                "pf.idProfesoresEvento AS id_profesor, " +
                "pf.nombre AS nombreProfesor, " +
                "pf.apellido AS apellidoProfesor, " +
                "TIME(e.hora_inicio) AS hora_inicio, " +
                "TIME(e.hora_fin) AS hora_fin, " +
                "e.listaMateriales AS listaMateriales, " +
                "es.estadosEvento, " +
                "e.diasEvento as diasEvento " + // Añadido espacio antes de FROM
                "FROM " +
                "Eventos e " +
                "JOIN Usuario u ON e.Coordinador_idUsuario = u.idUsuario " +
                "JOIN EventFrecuencia ef ON e.EventFrecuencia_idEventFrecuencia = ef.idEventFrecuencia " +
                "JOIN profesoresevento pf ON e.ProfesoresEvento_idProfesoresEvento = pf.idProfesoresEvento " +
                "JOIN EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados " +
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
                    evento.setFoto(rs.getBinaryStream("foto"));
                    evento.setNombreFoto(rs.getString("nombreFoto"));
                    evento.setListaMateriales(rs.getString("listaMateriales"));
                    evento.setEstadoString(rs.getString("estadosEvento"));
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
                "(`nombre`, `descripcion`, `lugar`, `Coordinador_idUsuario`, `fecha_inicio`, `fecha_fin`, `cantidadVacantes`, `cantDisponibles`, `foto`, `nombreFoto`,`listaMateriales`, `EventEstados_idEventEstados`, `EventFrecuencia_idEventFrecuencia`, `TipoEvento_idTipoEvento`, `ProfesoresEvento_idProfesoresEvento`, `hora_inicio`, `hora_fin`, `diasEvento`) \n" +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            int estadoEvento = 1;

            pstmt.setString(1, eventoB.getNombre());
            pstmt.setString(2, eventoB.getDescripcion());
            pstmt.setString(3, eventoB.getLugar());
            pstmt.setInt(4, eventoB.getCoordinador_idUsuario());
            pstmt.setString(5, eventoB.getFecha_inicio());
            pstmt.setString(6, eventoB.getFecha_fin());
            pstmt.setInt(7, eventoB.getCantidadVacantes());
            pstmt.setInt(8, eventoB.getCantidadVacantes());
            pstmt.setBlob(9, eventoB.getFoto());
            pstmt.setString(10,eventoB.getNombreFoto());
            pstmt.setString(11, eventoB.getListaMateriales());
            pstmt.setInt(12, estadoEvento);
            pstmt.setInt(13, eventoB.getEventFrecuencia_idEventFrecuencia());
            pstmt.setInt(14, eventoB.getTipoEvento_idTipoEvento());
            pstmt.setInt(15, eventoB.getProfesoresEvento_idProfesoresEvento());
            pstmt.setString(16, eventoB.getHora_inicio());
            pstmt.setString(17, eventoB.getHora_fin());
            pstmt.setString(18, eventoB.getDiaEvento());

            pstmt.executeUpdate();

            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int idEvento = generatedKeys.getInt(1);
                    fechasEvento(idEvento, eventoB.getFecha_inicio(), eventoB.getFecha_fin(), eventoB.getEventFrecuencia_idEventFrecuencia(), eventoB.getDiaEvento(),eventoB.getHora_inicio(),eventoB.getHora_fin());
                    asistencia_fechas_evento(idEvento, eventoB.getFecha_inicio(), eventoB.getFecha_fin(), eventoB.getEventFrecuencia_idEventFrecuencia(), eventoB.getDiaEvento(),eventoB.getHora_inicio(),eventoB.getHora_fin());
                } else {
                    throw new SQLException("Creating event failed, no ID obtained.");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error al insertar en la base de datos", e);
        }
    }

    public void fechasEvento(int idEvento, String fechaInicio, String fechaFin, int frecuencia, String diaEvento, String hora_inicio,String hora_fin) {
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
            String sql = "INSERT INTO dias_evento (eventos_idEventos, dia1, dia2,hora_inicio,hora_fin, asistenciaCoordinador) VALUES (?, ?, ?, ?, ?,?)";
            try (Connection connection = DriverManager.getConnection(url, username, password);
                 PreparedStatement pstmt = connection.prepareStatement(sql)) {
                if (frecuencia == 1){
                    pstmt.setInt(1, idEvento);
                    pstmt.setString(2, fechasEntre.get(i).toString());
                    pstmt.setNull(3, java.sql.Types.INTEGER);
                    pstmt.setString(4, hora_inicio);
                    pstmt.setString(5, hora_fin);
                    pstmt.setBoolean(6,false);
                }else{
                    pstmt.setInt(1, idEvento);
                    pstmt.setString(2, fechasEntre.get(i).toString());
                    if (fechasEntre2.get(i) != null) {
                        pstmt.setString(3, fechasEntre2.get(i).toString());
                    }else{
                        pstmt.setNull(3, java.sql.Types.INTEGER);
                    }
                    pstmt.setString(4, hora_inicio);
                    pstmt.setString(5, hora_fin);
                    pstmt.setBoolean(6,false);

                }
                pstmt.executeUpdate();

            } catch (SQLException e) {
                e.printStackTrace();
                throw new RuntimeException("Error al insertar en la base de datos", e);
            }

        }
    }

    public void asistencia_fechas_evento(int idEvento, String fechaInicio, String fechaFin, int frecuencia, String diaEvento, String hora_inicio,String hora_fin) {
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
        ArrayList<LocalDate> fechasCombinadas = new ArrayList<>(fechasEntre);
        fechasCombinadas.addAll(fechasEntre2);
        Collections.sort(fechasCombinadas);
        if (frecuencia == 1){
            for (int i = 0; i < fechasEntre.size(); i++) {
                String url = "jdbc:mysql://localhost:3306/televecinosdb";
                String username = "root";
                String password = "root";
                String sql = "INSERT INTO asistenciaCoordinadora (eventos_idEventos, fecha_evento,hora_inicio,hora_fin, asistencia) VALUES (?, ?, ?, ?,?)";
                try (Connection connection = DriverManager.getConnection(url, username, password);
                     PreparedStatement pstmt = connection.prepareStatement(sql)) {
                    pstmt.setInt(1, idEvento);
                    pstmt.setString(2, fechasEntre.get(i).toString());
                    pstmt.setString(3, hora_inicio);
                    pstmt.setString(4, hora_fin);
                    pstmt.setBoolean(5,false);
                    pstmt.executeUpdate();

                } catch (SQLException e) {
                    e.printStackTrace();
                    throw new RuntimeException("Error al insertar en la base de datos", e);
                }

            }
        }else{
            for (int i = 0; i < fechasCombinadas.size(); i++) {
                String url = "jdbc:mysql://localhost:3306/televecinosdb";
                String username = "root";
                String password = "root";
                String sql = "INSERT INTO asistenciaCoordinadora (eventos_idEventos, fecha_evento,hora_inicio,hora_fin, asistencia) VALUES (?, ?, ?, ?,?)";
                try (Connection connection = DriverManager.getConnection(url, username, password);
                     PreparedStatement pstmt = connection.prepareStatement(sql)) {
                    pstmt.setInt(1, idEvento);
                    pstmt.setString(2, fechasCombinadas.get(i).toString());
                    pstmt.setString(3, hora_inicio);
                    pstmt.setString(4, hora_fin);
                    pstmt.setBoolean(5,false);
                    pstmt.executeUpdate();

                } catch (SQLException e) {
                    e.printStackTrace();
                    throw new RuntimeException("Error al insertar en la base de datos", e);
                }

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
    public void eliminarFechasAsistencia(int eventosId) {
        String url = "jdbc:mysql://localhost:3306/televecinosdb";
        String username = "root";
        String password = "root";
        String sql = "DELETE FROM asistenciaCoordinadora WHERE eventos_idEventos = ?";

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
                "cantidadVacantes = ?, foto = ?, nombreFoto = ?,listaMateriales = ?, hora_inicio = ?, hora_fin = ?, diasEvento = ? WHERE idEventos = ? AND eliminado = FALSE";

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
            ps.setBlob(9, evento.getFoto());
            ps.setString(10,evento.getNombreFoto());
            ps.setString(11, evento.getListaMateriales());
            ps.setString(12, evento.getHora_inicio());
            ps.setString(13, evento.getHora_fin());
            ps.setString(14, evento.getDiaEvento());
            ps.setInt(15, evento.getIdEvento());

            ps.executeUpdate();

            fechasEvento(evento.getIdEvento(), evento.getFecha_inicio(), evento.getFecha_fin(), evento.getEventFrecuencia_idEventFrecuencia(), evento.getDiaEvento(),evento.getHora_inicio(),evento.getHora_fin());
            asistencia_fechas_evento(evento.getIdEvento(), evento.getFecha_inicio(), evento.getFecha_fin(), evento.getEventFrecuencia_idEventFrecuencia(), evento.getDiaEvento(),evento.getHora_inicio(),evento.getHora_fin());
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
    public ArrayList<EventoB> listarEventoFiltro(String nombre, String fecha, String frecuencia, String estado, int idTipoEvento, int pagina) {
        String sqlSetLanguage = "SET lc_time_names = 'es_ES';";
        String sqlSetTotalRows = "SET @total_rows = (SELECT COUNT(*) FROM Eventos e " +
                "JOIN EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados " +
                "JOIN Usuario u ON e.Coordinador_idUsuario = u.idUsuario " +
                "JOIN EventFrecuencia ef ON e.EventFrecuencia_idEventFrecuencia = ef.idEventFrecuencia " +
                "JOIN profesoresevento pf ON e.ProfesoresEvento_idProfesoresEvento = pf.idProfesoresEvento " +
                "WHERE e.nombre LIKE ? " +
                (fecha != null && !fecha.isEmpty() ? "AND e.fecha_inicio >= ? " : "") +
                (frecuencia != null && !frecuencia.isEmpty() ? "AND ef.idEventFrecuencia = ? " : "") +
                (estado != null && !estado.isEmpty() ? "AND es.idEventEstados = ? " : "") +
                (idTipoEvento != 0 ? "AND e.TipoEvento_idTipoEvento = ? " : "") +
                "AND e.eliminado = FALSE);";
        String sqlSetNumPartitions = "SET @num_partitions = FLOOR((@total_rows + 4) / 5);";

        String sql = "SELECT " +
                "    (@row_number := @row_number + 1) AS row_num, " +
                "    CEILING(@row_number / 5) AS 'pag', " +
                "    e.idEventos AS 'ID Evento', " +
                "    e.nombre AS 'Nombre', " +
                "    DATE_FORMAT(e.fecha_inicio, '%d %M %Y') AS 'Fecha de Inicio', " +
                "    es.estadosEvento AS 'Estado', " +
                "    ef.tipoFrecuencia AS 'Frecuencia' " +
                "FROM Eventos e " +
                "JOIN EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados " +
                "JOIN Usuario u ON e.Coordinador_idUsuario = u.idUsuario " +
                "JOIN EventFrecuencia ef ON e.EventFrecuencia_idEventFrecuencia = ef.idEventFrecuencia " +
                "JOIN profesoresevento pf ON e.ProfesoresEvento_idProfesoresEvento = pf.idProfesoresEvento " +
                "WHERE e.nombre LIKE ? " +
                (fecha != null && !fecha.isEmpty() ? "AND e.fecha_inicio >= ? " : "") +
                (frecuencia != null && !frecuencia.isEmpty() ? "AND ef.idEventFrecuencia = ? " : "") +
                (estado != null && !estado.isEmpty() ? "AND es.idEventEstados = ? " : "") +
                (idTipoEvento != 0 ? "AND e.TipoEvento_idTipoEvento = ? " : "") +
                "AND e.eliminado = FALSE " +
                "ORDER BY e.fecha_inicio DESC;";

        ArrayList<EventoB> eventos = new ArrayList<>();
        List<Object> parametros = new ArrayList<>();
        parametros.add(nombre + "%");
        if (fecha != null && !fecha.isEmpty()) {
            parametros.add(fecha);
        }
        if (frecuencia != null && !frecuencia.isEmpty()) {
            parametros.add(frecuencia);
        }
        if (estado != null && !estado.isEmpty()) {
            parametros.add(estado);
        }
        if (idTipoEvento != 0) {
            parametros.add(idTipoEvento);
        }

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             PreparedStatement pstmtTotalRows = conn.prepareStatement(sqlSetTotalRows);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            stmt.execute(sqlSetLanguage);

            for (int i = 0; i < parametros.size(); i++) {
                pstmtTotalRows.setObject(i + 1, parametros.get(i));
            }
            pstmtTotalRows.execute();

            stmt.execute(sqlSetNumPartitions);
            stmt.execute("SET @row_number = 0;");

            for (int i = 0; i < parametros.size(); i++) {
                pstmt.setObject(i + 1, parametros.get(i));
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    if (rs.getInt("pag") == pagina) {
                        EventoB event = new EventoB();
                        event.setIdPag(rs.getInt("pag"));
                        event.setidEvento(rs.getInt("ID Evento"));
                        event.setNombre(rs.getString("Nombre"));
                        event.setFecha_inicio(rs.getString("Fecha de Inicio"));
                        event.setEstadoString(rs.getString("Estado"));
                        event.setFrecuenciaString(rs.getString("Frecuencia"));
                        eventos.add(event);
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al listar eventos filtrados", e);
        }
        return eventos;
    }



    public int contarEventosFiltrados(String nombre, String fecha, String frecuencia, String estado, int idTipoEvento) {
        String sql = "SELECT COUNT(*) AS total FROM Eventos e " +
                "JOIN EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados " +
                "JOIN Usuario u ON e.Coordinador_idUsuario = u.idUsuario " +
                "JOIN EventFrecuencia ef ON e.EventFrecuencia_idEventFrecuencia = ef.idEventFrecuencia " +
                "JOIN profesoresevento pf ON e.ProfesoresEvento_idProfesoresEvento = pf.idProfesoresEvento " +
                "WHERE e.nombre LIKE ? " +
                (fecha != null && !fecha.isEmpty() ? "AND e.fecha_inicio >= ? " : "") +
                (frecuencia != null && !frecuencia.isEmpty() ? "AND ef.idEventFrecuencia = ? " : "") +
                (estado != null && !estado.isEmpty() ? "AND es.idEventEstados = ? " : "") +
                (idTipoEvento != 0 ? "AND e.TipoEvento_idTipoEvento = ? " : "") +
                "AND e.eliminado = FALSE";

        List<Object> parametros = new ArrayList<>();
        parametros.add(nombre + "%");
        if (fecha != null && !fecha.isEmpty()) {
            parametros.add(fecha);
        }
        if (frecuencia != null && !frecuencia.isEmpty()) {
            parametros.add(frecuencia);
        }
        if (estado != null && !estado.isEmpty()) {
            parametros.add(estado);
        }
        if (idTipoEvento != 0) {
            parametros.add(idTipoEvento);
        }

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            for (int i = 0; i < parametros.size(); i++) {
                pstmt.setObject(i + 1, parametros.get(i));
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("total");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al contar eventos filtrados", e);
        }
        return 0;
    }


    //Función para listar todos los eventos para Vecino
    public ArrayList<EventoB> listarTodosEventos() {

        String sqlSetLanguage = "SET lc_time_names = 'es_ES';";
        String sqlSetTotalRows = "SET @total_rows = (SELECT COUNT(*) FROM Eventos WHERE eliminado = FALSE);";
        String sqlSetNumPartitions = "SET @num_partitions = FLOOR((@total_rows + 7) / 8);";
        String sqlSetRowNumber = "SET @row_number = 0;";

        String sql = "SELECT \n" +
                "    (@row_number := @row_number + 1) AS row_num,\n" +
                "    CEILING(@row_number / 8) AS pag,\n" +
                "    e.idEventos AS 'ID Evento', \n" +
                "    e.nombre AS 'Nombre', \n" +
                "    e.descripcion AS 'Descripcion', \n" +
                "    DATE_FORMAT(e.fecha_inicio, '%d %M %Y') AS 'Fecha de Inicio', \n" +
                "    DATE_FORMAT(e.fecha_fin, '%d %M %Y') AS 'Fecha de Fin', \n" +
                "    e.cantDisponibles AS 'Vacantes Disponibles',\n" +
                "    es.estadosEvento AS 'Estado', \n" +
                "    e.foto AS 'Foto', \n" +
                "    te.tipo AS 'TipoEvento', \n" +
                "    eve.tipoFrecuencia AS 'Frecuencia' \n" +
                "FROM Eventos e \n" +
                "JOIN EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados \n" +
                "JOIN tipoevento te ON e.TipoEvento_idTipoEvento = te.idTipoEvento \n" +
                "JOIN eventfrecuencia eve ON e.EventFrecuencia_idEventFrecuencia = eve.idEventFrecuencia \n" +
                "WHERE e.eliminado = FALSE \n" +
                "ORDER BY \n" +
                "    CASE WHEN es.estadosEvento = 'Finalizado' THEN 1 ELSE 0 END, \n" +
                "    e.fecha_inicio DESC;";

        ArrayList<EventoB> listaTodosEventos = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {

            // Ejecutar la sentencia para establecer el idioma de las fechas en español
            stmt.execute(sqlSetLanguage);

            // Ejecutar las sentencias SET para total_rows y num_partitions
            stmt.execute(sqlSetTotalRows);
            stmt.execute(sqlSetNumPartitions);
            stmt.execute(sqlSetRowNumber);

            // Ejecutar la consulta principal
            try (PreparedStatement pstmt = conn.prepareStatement(sql);
                 ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
                    EventoB evento = new EventoB();
                    evento.setidEvento(rs.getInt("ID Evento"));
                    evento.setTipoEvento(rs.getString("TipoEvento"));
                    evento.setNombre(rs.getString("Nombre"));
                    evento.setDescripcion(rs.getString("Descripcion"));
                    evento.setFecha_inicio(rs.getString("Fecha de Inicio"));
                    evento.setFecha_fin(rs.getString("Fecha de Fin"));
                    evento.setEstadoString(rs.getString("Estado"));
                    evento.setCantDisponibles(rs.getInt("Vacantes Disponibles"));
                    evento.setFoto(rs.getBinaryStream("Foto"));
                    evento.setFrecuenciaString(rs.getString("Frecuencia"));
                    listaTodosEventos.add(evento);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaTodosEventos;
    }
    //Lista de eventos generales para Coordinador
    public ArrayList<EventoB> listarTodosEventosCoordinador(int idTipoEvento) {

        String sqlSetLanguage = "SET lc_time_names = 'es_ES';";
        String sqlSetTotalRows = "SET @total_rows = (SELECT COUNT(*) FROM Eventos WHERE TipoEvento_idTipoEvento = ? AND eliminado = FALSE);";
        String sqlSetNumPartitions = "SET @num_partitions = FLOOR((@total_rows + 7) / 8);"; // Ajustado para calcular el número de particiones

        String sql = "SELECT \n" +
                "    (@row_number := @row_number + 1) AS row_num,\n" +
                "    CEILING(@row_number / 8) AS 'pag',\n" +
                "    CONCAT(u.nombre, ' ', u.apellido) AS 'Coord',\n" +
                "    e.idEventos AS 'ID Evento', \n" +
                "    e.nombre AS 'Nombre', \n" +
                "    e.descripcion AS 'Descripcion', \n" +
                "    DATE_FORMAT(e.fecha_inicio, '%d %M %Y') AS 'Fecha de Inicio', \n" +
                "    DATE_FORMAT(e.fecha_fin, '%d %M %Y') AS 'Fecha de Fin', \n" +
                "    es.estadosEvento AS 'Estado', \n" +
                "    e.foto AS 'Foto',\n" +
                "    ef.tipoFrecuencia AS 'Frecuencia',\n" +
                "    te.tipo as 'Tipo'\n" +
                "FROM Eventos e \n" +
                "JOIN EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados \n" +
                "JOIN EventFrecuencia ef ON e.EventFrecuencia_idEventFrecuencia = ef.idEventFrecuencia \n" +
                "JOIN tipoevento te ON e.TipoEvento_idTipoEvento = te.idTipoEvento\n" +
                "JOIN usuario u ON e.Coordinador_idUsuario = u.idUsuario \n" +
                "WHERE e.TipoEvento_idTipoEvento = ? AND e.eliminado = FALSE \n" +
                "ORDER BY \n" +
                "    CASE WHEN es.estadosEvento = 'Finalizado' THEN 1 ELSE 0 END, \n" +
                "    e.fecha_inicio DESC;";

        ArrayList<EventoB> listaEventosPropios = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {

            // Ejecutar la sentencia para establecer el idioma de las fechas en español
            stmt.execute(sqlSetLanguage);

            // Ejecutar las sentencias SET para total_rows y num_partitions
            try (PreparedStatement pstmtTotalRows = conn.prepareStatement(sqlSetTotalRows)) {
                pstmtTotalRows.setInt(1, idTipoEvento);
                pstmtTotalRows.execute();
            }

            stmt.execute(sqlSetNumPartitions);

            // Inicializar la variable de sesión para el número de fila
            stmt.execute("SET @row_number = 0;");

            // Establecer el parámetro para el PreparedStatement y ejecutar la consulta principal
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, idTipoEvento);

                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        EventoB evento = new EventoB();
                        evento.setIdPag(rs.getInt("pag"));
                        evento.setNombreCoordinador(rs.getString("Coord"));
                        evento.setidEvento(rs.getInt("ID Evento"));
                        evento.setNombre(rs.getString("Nombre"));
                        evento.setDescripcion(rs.getString("Descripcion"));
                        evento.setFecha_inicio(rs.getString("Fecha de Inicio"));
                        evento.setFecha_fin(rs.getString("Fecha de Fin"));
                        evento.setEstadoString(rs.getString("Estado"));
                        evento.setFoto(rs.getBinaryStream("Foto"));
                        evento.setFrecuenciaString(rs.getString("Frecuencia"));
                        evento.setTipoEvento(rs.getString("Tipo"));
                        listaEventosPropios.add(evento);
                    }
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaEventosPropios;
    }

    //Filtro para evento generales
    public ArrayList<EventoB> ListaEventoGeneralesFiltro(String nombre, String fecha, String frecuencia, String estado, int idTipoEvento, int pagina) {
        String sqlSetLanguage = "SET lc_time_names = 'es_ES';";
        String sqlSetTotalRows = "SET @total_rows = (SELECT COUNT(*) FROM Eventos e " +
                "JOIN EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados " +
                "JOIN Usuario u ON e.Coordinador_idUsuario = u.idUsuario " +
                "JOIN EventFrecuencia ef ON e.EventFrecuencia_idEventFrecuencia = ef.idEventFrecuencia " +
                "JOIN tipoevento te ON e.TipoEvento_idTipoEvento = te.idTipoEvento " +
                "JOIN profesoresevento pf ON e.ProfesoresEvento_idProfesoresEvento = pf.idProfesoresEvento " +
                "WHERE e.nombre LIKE ? " +
                (fecha != null && !fecha.isEmpty() ? "AND e.fecha_inicio >= ? " : "") +
                (frecuencia != null && !frecuencia.isEmpty() ? "AND ef.idEventFrecuencia = ? " : "") +
                (estado != null && !estado.isEmpty() ? "AND es.idEventEstados = ? " : "") +
                (idTipoEvento != 0 ? "AND e.TipoEvento_idTipoEvento = ? " : "") +
                "AND e.eliminado = FALSE);";
        String sqlSetNumPartitions = "SET @num_partitions = FLOOR((@total_rows + 7) / 8);";

        String sql = "SELECT " +
                "    (@row_number := @row_number + 1) AS row_num, " +
                "    CEILING(@row_number / 8) AS 'pag', " +
                "    CONCAT(u.nombre, ' ', u.apellido) AS 'Coord', " +
                "    e.idEventos AS 'ID Evento', " +
                "    e.nombre AS 'Nombre', " +
                "    DATE_FORMAT(e.fecha_inicio, '%d %M %Y') AS 'Fecha de Inicio', " +
                "    DATE_FORMAT(e.fecha_fin, '%d %M %Y') AS 'Fecha de Fin', " +
                "    es.estadosEvento AS 'Estado', " +
                "    ef.tipoFrecuencia AS 'Frecuencia', " +
                "    te.tipo as 'Tipo' " +
                "FROM Eventos e " +
                "JOIN EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados " +
                "JOIN Usuario u ON e.Coordinador_idUsuario = u.idUsuario " +
                "JOIN EventFrecuencia ef ON e.EventFrecuencia_idEventFrecuencia = ef.idEventFrecuencia " +
                "JOIN profesoresevento pf ON e.ProfesoresEvento_idProfesoresEvento = pf.idProfesoresEvento " +
                "JOIN tipoevento te ON e.TipoEvento_idTipoEvento = te.idTipoEvento " +
                "WHERE e.nombre LIKE ? " +
                (fecha != null && !fecha.isEmpty() ? "AND e.fecha_inicio >= ? " : "") +
                (frecuencia != null && !frecuencia.isEmpty() ? "AND ef.idEventFrecuencia = ? " : "") +
                (estado != null && !estado.isEmpty() ? "AND es.idEventEstados = ? " : "") +
                (idTipoEvento != 0 ? "AND e.TipoEvento_idTipoEvento = ? " : "") +
                "AND e.eliminado = FALSE " +
                "ORDER BY \n" +
                "    CASE WHEN es.estadosEvento = 'Finalizado' THEN 1 ELSE 0 END, \n" +
                "    e.fecha_inicio DESC;";

        ArrayList<EventoB> evento = new ArrayList<>();
        List<Object> parametros = new ArrayList<>();
        parametros.add(nombre + "%");
        if (fecha != null && !fecha.isEmpty()) {
            parametros.add(fecha);
        }
        if (frecuencia != null && !frecuencia.isEmpty()) {
            parametros.add(frecuencia);
        }
        if (estado != null && !estado.isEmpty()) {
            parametros.add(estado);
        }
        if (idTipoEvento != 0) {
            parametros.add(idTipoEvento);
        }

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             PreparedStatement pstmtTotalRows = conn.prepareStatement(sqlSetTotalRows);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Ejecutar la sentencia para establecer el idioma de las fechas en español
            stmt.execute(sqlSetLanguage);

            // Asignar los parámetros para el total de filas
            for (int i = 0; i < parametros.size(); i++) {
                pstmtTotalRows.setObject(i + 1, parametros.get(i));
            }
            pstmtTotalRows.execute();

            // Ejecutar la sentencia para calcular el número de particiones
            stmt.execute(sqlSetNumPartitions);

            // Inicializar la variable de sesión para el número de fila
            stmt.execute("SET @row_number = 0;");

            // Asignar los parámetros al PreparedStatement principal
            for (int i = 0; i < parametros.size(); i++) {
                pstmt.setObject(i + 1, parametros.get(i));
            }

            // Ejecutar la consulta principal
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    if (rs.getInt("pag") == pagina) {
                        EventoB event = new EventoB();
                        event.setIdPag(rs.getInt("pag"));
                        event.setNombreCoordinador(rs.getString("Coord"));
                        event.setidEvento(rs.getInt("ID Evento"));
                        event.setNombre(rs.getString("Nombre"));
                        event.setFecha_inicio(rs.getString("Fecha de Inicio"));
                        event.setFecha_fin(rs.getString("Fecha de Fin"));
                        event.setEstadoString(rs.getString("Estado"));
                        event.setFrecuenciaString(rs.getString("Frecuencia"));
                        event.setTipoEvento(rs.getString("Tipo"));
                        evento.add(event);
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al listar eventos filtrados", e);
        }
        return evento;
    }

    public int contarEventosGeneralesFiltrados(String nombre, String fecha, String frecuencia, String estado, int idTipoEvento) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) AS total FROM Eventos e " +
                "JOIN EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados " +
                "JOIN Usuario u ON e.Coordinador_idUsuario = u.idUsuario " +
                "JOIN EventFrecuencia ef ON e.EventFrecuencia_idEventFrecuencia = ef.idEventFrecuencia " +
                "JOIN tipoevento te ON e.TipoEvento_idTipoEvento = te.idTipoEvento  " +
                "JOIN profesoresevento pf ON e.ProfesoresEvento_idProfesoresEvento = pf.idProfesoresEvento " +
                "WHERE e.nombre LIKE ? " +
                "AND e.eliminado = FALSE ");

        List<Object> parametros = new ArrayList<>();
        parametros.add(nombre + "%");

        if (fecha != null && !fecha.isEmpty()) {
            sql.append("AND e.fecha_inicio >= ? ");
            parametros.add(fecha);
        }
        if (frecuencia != null && !frecuencia.isEmpty()) {
            sql.append("AND ef.idEventFrecuencia = ? ");
            parametros.add(frecuencia);
        }
        if (estado != null && !estado.isEmpty()) {
            sql.append("AND es.idEventEstados = ? ");
            parametros.add(estado);
        }
        if (idTipoEvento != 0) {
            sql.append("AND e.TipoEvento_idTipoEvento = ? ");
            parametros.add(idTipoEvento);
        }

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {

            for (int i = 0; i < parametros.size(); i++) {
                pstmt.setObject(i + 1, parametros.get(i));
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("total");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al contar eventos filtrados", e);
        }
        return 0;
    }


    //Filtro para eventos generales Vecino
    public ArrayList<EventoB> listarTodosEventosVecinoFiltro(String nombre, String fecha, String frecuencia, String estado, String tipo, int pagina) {

        String sqlSetLanguage = "SET lc_time_names = 'es_ES';";
        String sqlSetTotalRows = "SET @total_rows = (SELECT COUNT(*) FROM Eventos e " +
                "JOIN EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados " +
                "JOIN tipoevento te ON e.TipoEvento_idTipoEvento = te.idTipoEvento " +
                "JOIN eventfrecuencia eve ON e.EventFrecuencia_idEventFrecuencia = eve.idEventFrecuencia " +
                "WHERE e.eliminado = FALSE " +
                (nombre != null && !nombre.isEmpty() ? "AND e.nombre LIKE ? " : "") +
                (fecha != null && !fecha.isEmpty() ? "AND e.fecha_inicio >= ? " : "") +
                (frecuencia != null && !frecuencia.isEmpty() ? "AND eve.idEventFrecuencia = ? " : "") +
                (estado != null && !estado.isEmpty() ? "AND es.idEventEstados = ? " : "") +
                (tipo != null ? "AND te.idTipoEvento = ? " : "") + ");";
        String sqlSetNumPartitions = "SET @num_partitions = FLOOR((@total_rows + 7) / 8);";
        String sqlSetRowNumber = "SET @row_number = 0;";

        String sql = "SELECT \n" +
                "    (@row_number := @row_number + 1) AS row_num,\n" +
                "    CEILING(@row_number / 8) AS pag,\n" +
                "    e.idEventos AS 'ID Evento', \n" +
                "    e.nombre AS 'Nombre', \n" +
                "    e.descripcion AS 'Descripcion', \n" +
                "    DATE_FORMAT(e.fecha_inicio, '%d %M %Y') AS 'Fecha de Inicio', \n" +
                "    DATE_FORMAT(e.fecha_fin, '%d %M %Y') AS 'Fecha de Fin', \n" +
                "    e.cantDisponibles AS 'Vacantes Disponibles',\n" +
                "    es.estadosEvento AS 'Estado', \n" +
                "    e.foto AS 'Foto', \n" +
                "    te.tipo as 'TipoEvento',\n" +
                "    eve.tipoFrecuencia AS 'Frecuencia' \n" +
                "FROM Eventos e \n" +
                "JOIN EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados \n" +
                "JOIN tipoevento te ON e.TipoEvento_idTipoEvento = te.idTipoEvento \n" +
                "JOIN eventfrecuencia eve ON e.EventFrecuencia_idEventFrecuencia = eve.idEventFrecuencia \n" +
                "WHERE e.eliminado = FALSE " +
                (nombre != null && !nombre.isEmpty() ? "AND e.nombre LIKE ? " : "") +
                (fecha != null && !fecha.isEmpty() ? "AND e.fecha_inicio >= ? " : "") +
                (frecuencia != null && !frecuencia.isEmpty() ? "AND e.EventFrecuencia_idEventFrecuencia = ? " : "") +  // Use the correct column for frequency
                (estado != null && !estado.isEmpty() ? "AND es.idEventEstados = ? " : "") +
                (tipo != null ? "AND te.idTipoEvento = ? " : "") +  // Use the correct column for event type
                "ORDER BY e.fecha_inicio DESC;";


        ArrayList<EventoB> listaTodosEventos = new ArrayList<>();
        List<Object> parametros = new ArrayList<>();
        if (nombre != null && !nombre.isEmpty()) {
            parametros.add(nombre + "%");
        }
        if (fecha != null && !fecha.isEmpty()) {
            parametros.add(fecha);
        }
        if (frecuencia != null && !frecuencia.isEmpty()) {
            parametros.add(frecuencia); // Ensure the correct frequency ID is passed
        }
        if (estado != null && !estado.isEmpty()) {
            parametros.add(estado);
        }
        if (tipo != null) {
            parametros.add(tipo); // Ensure the correct event type ID is passed
        }

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             PreparedStatement pstmtTotalRows = conn.prepareStatement(sqlSetTotalRows);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            stmt.execute(sqlSetLanguage);

            int paramIndex = 1;
            for (Object param : parametros) {
                pstmtTotalRows.setObject(paramIndex++, param);
            }
            pstmtTotalRows.execute();

            stmt.execute(sqlSetNumPartitions);
            stmt.execute(sqlSetRowNumber);

            paramIndex = 1;
            for (Object param : parametros) {
                pstmt.setObject(paramIndex++, param);
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    if (rs.getInt("pag") == pagina) {
                        EventoB evento = new EventoB();
                        evento.setIdPag(rs.getInt("pag"));
                        evento.setidEvento(rs.getInt("ID Evento"));
                        evento.setTipoEvento(rs.getString("TipoEvento"));
                        evento.setNombre(rs.getString("Nombre"));
                        evento.setDescripcion(rs.getString("Descripcion"));
                        evento.setFecha_inicio(rs.getString("Fecha de Inicio"));
                        evento.setFecha_fin(rs.getString("Fecha de Fin"));
                        evento.setEstadoString(rs.getString("Estado"));
                        evento.setCantDisponibles(rs.getInt("Vacantes Disponibles"));
                        evento.setFoto(rs.getBinaryStream("Foto"));
                        evento.setFrecuenciaString(rs.getString("Frecuencia"));
                        evento.setTipoEvento(rs.getString("TipoEvento"));
                        listaTodosEventos.add(evento);
                    }
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error al listar eventos filtrados", e);
        }

        return listaTodosEventos;}

    public int contarEventosVecinoFiltrados(String nombre, String fecha, String frecuencia, String estado, String idTipoEvento) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) AS total FROM Eventos e " +
                "JOIN EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados " +
                "JOIN tipoevento te ON e.TipoEvento_idTipoEvento = te.idTipoEvento " +
                "JOIN eventfrecuencia eve ON e.EventFrecuencia_idEventFrecuencia = eve.idEventFrecuencia " +
                "WHERE e.eliminado = FALSE ");

        List<Object> parametros = new ArrayList<>();
        if (nombre != null && !nombre.isEmpty()) {
            sql.append("AND e.nombre LIKE ? ");
            parametros.add(nombre + "%");
        }
        if (fecha != null && !fecha.isEmpty()) {
            sql.append("AND e.fecha_inicio >= ? ");
            parametros.add(fecha);
        }
        if (frecuencia != null && !frecuencia.isEmpty()) {
            sql.append("AND eve.idEventFrecuencia = ? ");
            parametros.add(frecuencia);
        }
        if (estado != null && !estado.isEmpty()) {
            sql.append("AND es.estadosEvento = ? ");
            parametros.add(estado);
        }
        if (idTipoEvento != null) {
            sql.append("AND te.idTipoEvento = ? ");
            parametros.add(idTipoEvento);
        }

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {

            for (int i = 0; i < parametros.size(); i++) {
                pstmt.setObject(i + 1, parametros.get(i));
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("total");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al contar eventos filtrados", e);
        }
        return 0;
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
    public boolean estaInscrito(int idUsuario, int idEvento) {
        String sql = "SELECT COUNT(*) FROM flujo_usuario_evento WHERE Usuario_idUsuario = ? AND Eventos_idEventos = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idUsuario);
            pstmt.setInt(2, idEvento);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    return count > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean hayTraslape(int idUsuario, int idEvento) {
        String sql = "SELECT COUNT(*) FROM flujo_usuario_evento fue " +
                "JOIN dias_evento de ON fue.Eventos_idEventos = de.eventos_idEventos " +
                "WHERE fue.Usuario_idUsuario = ? " +
                "AND EXISTS ( " +
                "  SELECT 1 FROM dias_evento de2 " +
                "  WHERE de2.eventos_idEventos = ? " +
                "  AND ( " +
                "    (de.dia1 = de2.dia1 AND de.hora_inicio <= de2.hora_fin AND de.hora_fin >= de2.hora_inicio) OR " +
                "    (de.dia2 = de2.dia1 AND de.hora_inicio <= de2.hora_fin AND de.hora_fin >= de2.hora_inicio) OR " +
                "    (de.dia1 = de2.dia2 AND de.hora_inicio <= de2.hora_fin AND de.hora_fin >= de2.hora_inicio) OR " +
                "    (de.dia2 = de2.dia2 AND de.hora_inicio <= de2.hora_fin AND de.hora_fin >= de2.hora_inicio) " +
                "  )" +
                ");";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idUsuario);
            pstmt.setInt(2, idEvento);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    return count > 0; // Retorna true si hay traslape (count > 0)
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al verificar si está inscrito: " + e.getMessage());
            e.printStackTrace();
        }
        return false; // Retorna false si no hay traslape o hay error
    }

    public void updateVacantesDisponibles(int idEvento) {
        try (Connection conn = this.getConnection()) {
            // 1. total de usuarios registrados
            String sqlCount = "SELECT COUNT(*) FROM flujo_usuario_evento WHERE Eventos_idEventos = ?";
            try (PreparedStatement pstmtCount = conn.prepareStatement(sqlCount)) {
                pstmtCount.setInt(1, idEvento);
                try (ResultSet rsCount = pstmtCount.executeQuery()) {
                    if (rsCount.next()) {
                        int inscriptos = rsCount.getInt(1);

                        // 2. cantidad total del evento
                        String sqlGetVacantes = "SELECT cantidadVacantes FROM eventos WHERE idEventos = ?";
                        try (PreparedStatement pstmtGetVacantes = conn.prepareStatement(sqlGetVacantes)) {
                            pstmtGetVacantes.setInt(1, idEvento);
                            try (ResultSet rsGetVacantes = pstmtGetVacantes.executeQuery()) {
                                if (rsGetVacantes.next()) {
                                    int totalVacantes = rsGetVacantes.getInt("cantidadVacantes");

                                    // 3. calcular vacantes disponibles
                                    int nuevasVacantes = totalVacantes - inscriptos;
                                    String sqlUpdate = "UPDATE eventos SET cantDisponibles = ? WHERE idEventos = ?";
                                    try (PreparedStatement pstmtUpdate = conn.prepareStatement(sqlUpdate)) {
                                        pstmtUpdate.setInt(1, nuevasVacantes);
                                        pstmtUpdate.setInt(2, idEvento);
                                        int rowsUpdated = pstmtUpdate.executeUpdate();

                                    }
                                }
                            }
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public ArrayList<AsistenciaCoordB> listarFechasEvento(int idEvento) {
        ArrayList<AsistenciaCoordB> listaFechasEvento = new ArrayList<>();
        String sql = "SELECT a.*, e.nombre FROM asistenciaCoordinadora AS a JOIN eventos AS e ON a.eventos_idEventos = e.idEventos WHERE a.eventos_idEventos = ?";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idEvento);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    AsistenciaCoordB asistenciaCoordB = new AsistenciaCoordB();
                    asistenciaCoordB.setIdAsistenciaCoordinadora(rs.getInt("idAsistenciaCoordinadora"));
                    asistenciaCoordB.setIdEvento(rs.getInt("eventos_idEventos"));
                    asistenciaCoordB.setFechaEvento(rs.getString("fecha_evento"));
                    asistenciaCoordB.setHora_inicio(rs.getString("hora_inicio"));
                    asistenciaCoordB.setHora_fin(rs.getString("hora_fin"));
                    asistenciaCoordB.setNombreEvento(rs.getString("nombre"));
                    listaFechasEvento.add(asistenciaCoordB);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener eventos inscritos: " + e.getMessage());
            e.printStackTrace();
        }
        return listaFechasEvento;
    }

    public ArrayList<EventoB> obtenerEventosInscritosActual(int idUser){
        ArrayList<EventoB> eventosInscritos = new ArrayList<>();
        String sqlSetLanguage = "SET lc_time_names = 'es_ES';";
        String sql = "SELECT \n" +
                "    e.idEventos, \n" +
                "    e.nombre, \n" +
                "    DATE_FORMAT(e.fecha_inicio, '%d %M %Y') AS 'Fecha de Inicio', \n" +
                "    es.estadosEvento, \n" +
                "    ef.tipoFrecuencia, \n" +
                "    te.tipo \n" +
                "FROM \n" +
                "    Eventos e \n" +
                "JOIN \n" +
                "    EventFrecuencia ef ON e.EventFrecuencia_idEventFrecuencia = ef.idEventFrecuencia \n" +
                "JOIN \n" +
                "    TipoEvento te ON e.TipoEvento_idTipoEvento = te.idTipoEvento \n" +
                "JOIN \n" +
                "    EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados \n" +
                "JOIN \n" +
                "    flujo_usuario_evento fue ON e.idEventos = fue.Eventos_idEventos \n" +
                "WHERE \n" +
                "    fue.Usuario_idUsuario = ? \n" +
                "    AND e.eliminado = FALSE \n" +
                "    AND MONTH(e.fecha_inicio) = MONTH(CURRENT_DATE()) \n" +
                "ORDER BY \n" +
                "    e.fecha_inicio DESC \n" +
                "LIMIT 5;";


        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            stmt.execute(sqlSetLanguage);
            pstmt.setInt(1, idUser);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    EventoB evento = new EventoB();
                    evento.setIdEvento(rs.getInt("idEventos"));
                    evento.setNombre(rs.getString("nombre"));
                    evento.setFecha_inicio(rs.getString("Fecha de Inicio"));
                    evento.setEstadoString(rs.getString("estadosEvento"));
                    evento.setFrecuenciaString(rs.getString("tipoFrecuencia"));
                    evento.setTipoEvento(rs.getString("tipo"));

                    eventosInscritos.add(evento);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener eventos inscritos: " + e.getMessage());
            e.printStackTrace();
        }
        return eventosInscritos;
    }


    public ArrayList<EventoB> obtenerEventosInscritos(int userId) {
        ArrayList<EventoB> eventosInscritos = new ArrayList<>();
        String sqlSetLanguage = "SET lc_time_names = 'es_ES';";
        String sql = "SELECT e.idEventos, e.nombre, DATE_FORMAT(e.fecha_inicio, '%d %M %Y') AS 'Fecha de Inicio', es.estadosEvento, ef.tipoFrecuencia, te.tipo " +
                "FROM Eventos e " +
                "JOIN EventFrecuencia ef ON e.EventFrecuencia_idEventFrecuencia = ef.idEventFrecuencia " +
                "JOIN TipoEvento te ON e.TipoEvento_idTipoEvento = te.idTipoEvento " +
                "JOIN EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados " +
                "JOIN flujo_usuario_evento fue ON e.idEventos = fue.Eventos_idEventos " +
                "WHERE fue.Usuario_idUsuario = ? AND e.eliminado = FALSE " +
                "ORDER BY e.fecha_inicio DESC;";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            stmt.execute(sqlSetLanguage);
            pstmt.setInt(1, userId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    EventoB evento = new EventoB();
                    evento.setIdEvento(rs.getInt("idEventos"));
                    evento.setNombre(rs.getString("nombre"));
                    evento.setFecha_inicio(rs.getString("Fecha de Inicio"));
                    evento.setEstadoString(rs.getString("estadosEvento"));
                    evento.setFrecuenciaString(rs.getString("tipoFrecuencia"));
                    evento.setTipoEvento(rs.getString("tipo"));

                    eventosInscritos.add(evento);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener eventos inscritos: " + e.getMessage());
            e.printStackTrace();
        }
        return eventosInscritos;
    }

    public boolean hayTraslapeCoordinador(int idCoordinador, int idEvento, String fechaInicio, String fechaFin, String horaInicio, String horaFin, int frecuencia) {

        String sql = "SELECT COUNT(*) FROM dias_evento de " +
                "JOIN eventos e ON de.eventos_idEventos = e.idEventos " +
                "WHERE e.Coordinador_idUsuario = ? " + // Filtrar por el coordinador
                "AND e.idEventos <> ? " + // Excluir el evento actual (si se está editando)
                "AND ( " +
                "    (de.dia1 BETWEEN ? AND ?) OR (de.dia2 BETWEEN ? AND ?) " + // Traslape de fechas
                "    AND (de.hora_inicio <= ? AND de.hora_fin >= ?) " +
                ");";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idCoordinador);
            pstmt.setInt(2, idEvento);
            pstmt.setString(3, fechaInicio);
            pstmt.setString(4, fechaFin);
            pstmt.setString(5, fechaInicio);
            pstmt.setString(6, fechaFin);
            pstmt.setString(7, horaFin);
            pstmt.setString(8, horaInicio);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    return count > 0; // Retorna true si hay traslape
                }
            }

        } catch (SQLException e) {
            System.err.println("Error al verificar traslape de eventos para coordinador: " + e.getMessage());
            e.printStackTrace();
        }

        return false;
    }

    //Filtro evento inscriptos
    public ArrayList<EventoB> listarEventosInscriptoFiltro(String nombre, String fecha, String frecuencia, String estado, String tipo, int idUser, int pagina) {
        String sqlSetLanguage = "SET lc_time_names = 'es_ES';";
        String sqlSetTotalRows = "SET @total_rows = (SELECT COUNT(*) FROM Eventos e " +
                "JOIN EventFrecuencia ef ON e.EventFrecuencia_idEventFrecuencia = ef.idEventFrecuencia " +
                "JOIN TipoEvento te ON e.TipoEvento_idTipoEvento = te.idTipoEvento " +
                "JOIN EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados " +
                "JOIN flujo_usuario_evento fue ON e.idEventos = fue.Eventos_idEventos " +
                "WHERE fue.Usuario_idUsuario = ? " +
                "AND e.nombre LIKE ? " +
                (fecha != null && !fecha.isEmpty() ? "AND DATE(e.fecha_inicio) >= ? " : "") +
                (frecuencia != null && !frecuencia.isEmpty() ? "AND ef.idEventFrecuencia = ? " : "") +
                (estado != null && !estado.isEmpty() ? "AND es.idEventEstados = ? " : "") +
                (tipo != null && !tipo.isEmpty() ? "AND te.idTipoEvento = ? " : "") +
                "AND e.eliminado = FALSE);";
        String sqlSetNumPartitions = "SET @num_partitions = FLOOR((@total_rows + 4) / 5);"; // Ajustado para calcular el número de particiones

        String sql = "SELECT " +
                "    (@row_number := @row_number + 1) AS row_num, " +
                "    CEILING(@row_number / 5) AS 'pag', " +
                "    e.idEventos AS 'ID Evento', " +
                "    e.nombre AS 'Nombre', " +
                "    DATE_FORMAT(e.fecha_inicio, '%d %M %Y') AS 'Fecha de Inicio', " +
                "    es.estadosEvento AS 'Estado', " +
                "    ef.tipoFrecuencia AS 'Frecuencia', " +
                "    te.tipo AS 'Tipo' " +
                "FROM Eventos e " +
                "JOIN EventFrecuencia ef ON e.EventFrecuencia_idEventFrecuencia = ef.idEventFrecuencia " +
                "JOIN TipoEvento te ON e.TipoEvento_idTipoEvento = te.idTipoEvento " +
                "JOIN EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados " +
                "JOIN flujo_usuario_evento fue ON e.idEventos = fue.Eventos_idEventos " +
                "WHERE fue.Usuario_idUsuario = ? " +
                "AND e.nombre LIKE ? " +
                (fecha != null && !fecha.isEmpty() ? "AND DATE(e.fecha_inicio) >= ? " : "") +
                (frecuencia != null && !frecuencia.isEmpty() ? "AND ef.idEventFrecuencia = ? " : "") +
                (estado != null && !estado.isEmpty() ? "AND es.idEventEstados = ? " : "") +
                (tipo != null && !tipo.isEmpty() ? "AND te.idTipoEvento = ? " : "") +
                "AND e.eliminado = FALSE " +
                "ORDER BY e.fecha_inicio DESC;";

        ArrayList<EventoB> evento = new ArrayList<>();
        List<Object> parametros = new ArrayList<>();
        parametros.add(idUser);
        parametros.add(nombre + "%");
        if (fecha != null && !fecha.isEmpty()) {
            parametros.add(fecha);
        }
        if (frecuencia != null && !frecuencia.isEmpty()) {
            parametros.add(frecuencia);
        }
        if (estado != null && !estado.isEmpty()) {
            parametros.add(estado);
        }
        if (tipo != null && !tipo.isEmpty()) {
            parametros.add(tipo);
        }

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             PreparedStatement pstmtTotalRows = conn.prepareStatement(sqlSetTotalRows);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Ejecutar la sentencia para establecer el idioma de las fechas en español
            stmt.execute(sqlSetLanguage);

            // Asignar los parámetros para el total de filas
            for (int i = 0; i < parametros.size(); i++) {
                pstmtTotalRows.setObject(i + 1, parametros.get(i));
            }
            pstmtTotalRows.execute();

            // Ejecutar la sentencia para calcular el número de particiones
            stmt.execute(sqlSetNumPartitions);

            // Inicializar la variable de sesión para el número de fila
            stmt.execute("SET @row_number = 0;");

            // Asignar los parámetros al PreparedStatement principal
            for (int i = 0; i < parametros.size(); i++) {
                pstmt.setObject(i + 1, parametros.get(i));
            }

            // Ejecutar la consulta principal
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    if (rs.getInt("pag") == pagina) {
                        EventoB event = new EventoB();
                        event.setIdPag(rs.getInt("pag"));
                        event.setidEvento(rs.getInt("ID Evento"));
                        event.setNombre(rs.getString("Nombre"));
                        event.setFecha_inicio(rs.getString("Fecha de Inicio"));
                        event.setEstadoString(rs.getString("Estado"));
                        event.setFrecuenciaString(rs.getString("Frecuencia"));
                        event.setTipoEvento(rs.getString("Tipo"));
                        evento.add(event);
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al listar eventos filtradas", e);
        }
        return evento;
    }

    public int contarEventosInscriptoFiltrados(String nombre, String fecha, String frecuencia, String estado, String tipo, int idUser) {
        String sql = "SELECT COUNT(*) AS total FROM Eventos e " +
                "JOIN EventFrecuencia ef ON e.EventFrecuencia_idEventFrecuencia = ef.idEventFrecuencia " +
                "JOIN TipoEvento te ON e.TipoEvento_idTipoEvento = te.idTipoEvento " +
                "JOIN EventEstados es ON e.EventEstados_idEventEstados = es.idEventEstados " +
                "JOIN flujo_usuario_evento fue ON e.idEventos = fue.Eventos_idEventos " +
                "WHERE fue.Usuario_idUsuario = ? " +
                "AND e.nombre LIKE ? " +
                (fecha != null && !fecha.isEmpty() ? "AND DATE(e.fecha_inicio) >= ? " : "") +
                (frecuencia != null && !frecuencia.isEmpty() ? "AND ef.tipoFrecuencia = ? " : "") +
                (estado != null && !estado.isEmpty() ? "AND es.estadosEvento = ? " : "") +
                (tipo != null && !tipo.isEmpty() ? "AND te.tipo = ? " : "") +
                "AND e.eliminado = FALSE";

        List<Object> parametros = new ArrayList<>();
        parametros.add(idUser);
        parametros.add(nombre + "%");
        if (fecha != null && !fecha.isEmpty()) {
            parametros.add(fecha);
        }
        if (frecuencia != null && !frecuencia.isEmpty()) {
            parametros.add(frecuencia);
        }
        if (estado != null && !estado.isEmpty()) {
            parametros.add(estado);
        }
        if (tipo != null && !tipo.isEmpty()) {
            parametros.add(tipo);
        }

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            for (int i = 0; i < parametros.size(); i++) {
                pstmt.setObject(i + 1, parametros.get(i));
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("total");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al contar eventos inscritos filtrados", e);
        }
        return 0;
    }

    public boolean hayTraslapeProfesor(int idProfesor, String fechaInicio, String fechaFin, String horaInicio, String horaFin) {
        String sql = "SELECT COUNT(*) FROM eventos e " +
                "JOIN dias_evento de ON e.idEventos = de.eventos_idEventos " +
                "WHERE e.ProfesoresEvento_idProfesoresEvento = ? " +
                "  AND ( " +
                "       (de.dia1 BETWEEN ? AND ? OR de.dia2 BETWEEN ? AND ?) " +
                "       AND ( " +
                "            TIME(e.hora_inicio) BETWEEN ? AND ? " +
                "            OR TIME(e.hora_fin) BETWEEN ? AND ? " +
                "            OR ? BETWEEN TIME(e.hora_inicio) AND TIME(e.hora_fin) " +
                "            OR ? BETWEEN TIME(e.hora_inicio) AND TIME(e.hora_fin) " + // Corregido: horaFin
                "           ) " +
                "      );";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idProfesor);
            pstmt.setString(2, fechaInicio);
            pstmt.setString(3, fechaFin);
            pstmt.setString(4, fechaInicio);
            pstmt.setString(5, fechaFin);
            pstmt.setString(6, horaInicio);
            pstmt.setString(7, horaFin);
            pstmt.setString(8, horaInicio);
            pstmt.setString(9, horaFin);
            pstmt.setString(10, horaInicio); // Corregido: horaFin

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    return count > 0; // Retorna true si hay traslape
                }
            }

        } catch (SQLException e) {
            System.err.println("Error al verificar traslape de eventos para coordinador: " + e.getMessage());
            e.printStackTrace();
        }

        return false;
    }

    public void guardarFoto(int idEvento, String nombreFoto, InputStream contenidoFoto, int indiceFoto) throws SQLException {
        boolean galeriaExiste = verificarExistenciaGaleria(idEvento);

        String sql;
        if (galeriaExiste) {
            sql = "UPDATE galeria SET foto" + indiceFoto + " = ?, nombreFoto" + indiceFoto + " = ? WHERE eventos_idEventos = ?";
        } else {
            sql = "INSERT INTO galeria (eventos_idEventos, foto" + indiceFoto + ", nombreFoto" + indiceFoto + ") VALUES (?, ?, ?)";
        }

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            if (galeriaExiste) {
                pstmt.setBinaryStream(1, contenidoFoto);
                pstmt.setString(2, nombreFoto);
                pstmt.setInt(3, idEvento);
            } else {
                pstmt.setInt(1, idEvento);
                pstmt.setBinaryStream(2, contenidoFoto);
                pstmt.setString(3, nombreFoto);
            }
            int rowsAffected = pstmt.executeUpdate();
            logger.info("Número de filas afectadas: " + rowsAffected);
        } catch (SQLException e) {
            logger.severe("Error al guardar la foto en la base de datos: " + e.getMessage());
            throw new SQLException("Error al guardar la foto en la base de datos", e);
        } finally {
            if (contenidoFoto != null) {
                try {
                    contenidoFoto.close();
                } catch (IOException e) {
                    logger.severe("Error al cerrar el InputStream: " + e.getMessage());
                }
            }
        }
    }

    public boolean verificarExistenciaGaleria(int idEvento) throws SQLException {
        String sql = "SELECT COUNT(*) FROM galeria WHERE eventos_idEventos = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idEvento);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            logger.severe("Error al verificar la existencia de la galería: " + e.getMessage());
            throw new SQLException("Error al verificar la existencia de la galería", e);
        }
        return false;
    }

}

