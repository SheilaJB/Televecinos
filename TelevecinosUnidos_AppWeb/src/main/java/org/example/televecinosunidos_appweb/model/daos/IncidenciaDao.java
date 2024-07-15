package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.IncidenciasB;
import org.example.televecinosunidos_appweb.model.beans.UsuarioB;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;
import java.sql.*;


public class IncidenciaDao extends BaseDao{
    public ArrayList<IncidenciasB> listarIncidencias() {

        String sql = "SELECT * FROM televecinosdb.incidencias \n" +
                    "WHERE incidencias.borrado = 0 \n" +
                    "ORDER BY incidencias.EstadosIncidencia_idEstadosIncidencia ASC, incidencias.idIncidencias DESC;";

        ArrayList<IncidenciasB> listaIncidencias = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                IncidenciasB incidenciaB = new IncidenciasB();
                incidenciaB.setIdIncidencias(rs.getInt("idIncidencias"));
                incidenciaB.setNombreIncidencia(rs.getString("nombreIncidencia"));
                incidenciaB.setFecha(rs.getString("fecha"));
                incidenciaB.setLugarExacto(rs.getString("lugarExacto"));
                incidenciaB.setIdUrbanizacion(rs.getInt("urbanizacion_idUrbanizacion"));
                incidenciaB.setAmbulancia(rs.getInt("ambulancia"));
                incidenciaB.setNumeroContacto(rs.getString("numeroContacto"));
                incidenciaB.setCriticidadIncidencia_idCriticidadIncidencia(rs.getInt("CriticidadIncidencia_idCriticidadIncidencia"));
                incidenciaB.setTipoIncidencia_idTipoIncidencia(rs.getInt("TipoIncidencia_idTipoIncidencia"));
                incidenciaB.setEstadosIncidencia_idEstadoIncidencia(rs.getInt("EstadosIncidencia_idEstadosIncidencia"));
                incidenciaB.setSerenazgo_idSerenazgo(rs.getInt("Serenazgo_idSerenazgo"));
                incidenciaB.setUsuario_idUsuario(rs.getInt("Usuario_idUsuario"));
                incidenciaB.setIncidenciaPersonal(rs.getInt("incidenciaPersonal"));
                incidenciaB.setNombrePersonalTurno(rs.getString("nombreDelPersonalEnTurno"));
                incidenciaB.setNombreFoto(rs.getString("nombreFoto"));
                listaIncidencias.add(incidenciaB);

                switch (incidenciaB.getCriticidadIncidencia_idCriticidadIncidencia()){
                    case 1:
                        incidenciaB.setCriticidadIncidencia_idCriticidadIncidenciaStr("Baja");
                        break;
                    case 2:
                        incidenciaB.setCriticidadIncidencia_idCriticidadIncidenciaStr("Media");
                        break;
                    case 3:
                        incidenciaB.setCriticidadIncidencia_idCriticidadIncidenciaStr("Alta");
                        break;
                }
                switch (incidenciaB.getEstadosIncidencia_idEstadoIncidencia()){
                    case 1:
                        incidenciaB.setEstadosIncidencia_idEstadoIncidenciaStr("Pendiente");
                        break;
                    case 2:
                        incidenciaB.setEstadosIncidencia_idEstadoIncidenciaStr("En curso");
                        break;
                    case 3:
                        incidenciaB.setEstadosIncidencia_idEstadoIncidenciaStr("Cancelado");
                        break;
                    case 4:
                        incidenciaB.setEstadosIncidencia_idEstadoIncidenciaStr("Rechazado");
                        break;
                    case 5:
                        incidenciaB.setEstadosIncidencia_idEstadoIncidenciaStr("Procesado");
                        break;
                }
                switch (incidenciaB.getTipoIncidencia_idTipoIncidencia()){
                    case 1:
                        incidenciaB.setTipoIncidencia_idTipoIncidenciaStr("Seguridad Pública");
                        break;
                    case 2:
                        incidenciaB.setTipoIncidencia_idTipoIncidenciaStr("Emergencia pública");
                        break;
                    case 3:
                        incidenciaB.setTipoIncidencia_idTipoIncidenciaStr("Infraestructura y Servicios Publicos");
                        break;
                    case 4:
                        incidenciaB.setTipoIncidencia_idTipoIncidenciaStr("Otro");
                        break;
                }

                switch (incidenciaB.getIdUrbanizacion()){
                    case 1:
                        incidenciaB.setUrbanizacion("Rafael Escardó ");
                        break;
                    case 2:
                        incidenciaB.setUrbanizacion("José de La Riva Agüero");
                        break;
                    case 3:
                        incidenciaB.setUrbanizacion("Juan XXIII");
                        break;
                    case 4:
                        incidenciaB.setUrbanizacion("Libertad");
                        break;
                    case 5:
                        incidenciaB.setUrbanizacion("Los Jardines de La Marina");
                        break;
                    case 6:
                        incidenciaB.setUrbanizacion("Las Leyendas");
                        break;
                    case 7:
                        incidenciaB.setUrbanizacion("Las Torres San Miguelito");
                        break;
                    case 8:
                        incidenciaB.setUrbanizacion("Elmer Faucett");
                        break;
                    case 9:
                        incidenciaB.setUrbanizacion("Maranga");
                        break;
                    case 10:
                        incidenciaB.setUrbanizacion("Pando");
                        break;
                    case 11:
                        incidenciaB.setUrbanizacion("Parques de La Huaca");
                        break;
                    case 12:
                        incidenciaB.setUrbanizacion("Otro");
                        break;
                }

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaIncidencias;
    }

    public IncidenciasB buscarPorId(String id){

        //Job job = null;
        IncidenciasB incidenciasB = null;


        String sql = "select * from incidencias where idIncidencias = ?";


        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,id);

            try(ResultSet rs = pstmt.executeQuery()){
                if (rs.next()) {

                    incidenciasB = new IncidenciasB();

                    incidenciasB.setIdIncidencias(rs.getInt(1));
                    incidenciasB.setNombreIncidencia(rs.getString("nombreIncidencia"));
                    incidenciasB.setFecha(rs.getString("fecha"));
                    incidenciasB.setLugarExacto(rs.getString("lugarExacto"));
                    incidenciasB.setUrbanizacion_idUrbanizacion(rs.getInt("urbanizacion_idUrbanizacion"));
                    incidenciasB.setReferencia(rs.getString("referencia"));
                    incidenciasB.setAmbulancia(rs.getInt("ambulancia"));
                    incidenciasB.setNumeroContacto(rs.getString("numeroContacto"));
                    incidenciasB.setCriticidadIncidencia_idCriticidadIncidencia(rs.getInt("CriticidadIncidencia_idCriticidadIncidencia"));
                    incidenciasB.setTipoIncidencia_idTipoIncidencia(rs.getInt("TipoIncidencia_idTipoIncidencia"));
                    incidenciasB.setTipoIncidencia(rs.getString("TipoIncidencia_idTipoIncidencia"));
                    incidenciasB.setEstadosIncidencia_idEstadoIncidencia(rs.getInt("EstadosIncidencia_idEstadosIncidencia"));
                    incidenciasB.setSerenazgo_idSerenazgo(rs.getInt("Serenazgo_idSerenazgo"));
                    incidenciasB.setUsuario_idUsuario(rs.getInt("Usuario_idUsuario"));
                    incidenciasB.setIncidenciaPersonal(rs.getInt("incidenciaPersonal"));
                    //incidenciasB.setBorrado_idBorrado(rs.getInt("borrado"))
                    incidenciasB.setSolucionADar(rs.getString("SolucionADar"));
                    incidenciasB.setPersonalRequerido(rs.getInt("personalRequerido_idpersonalRequerido"));
                    incidenciasB.setNombrePersonalTurno(rs.getString("nombreDelPersonalEnTurno"));
                    incidenciasB.setTipoMovilidadRequerido(rs.getInt("tipoMovilidadRequerido"));
                    incidenciasB.setNombreFoto(rs.getString("nombreFoto"));
                }
                //
                switch (incidenciasB.getCriticidadIncidencia_idCriticidadIncidencia()){
                    case 1:
                        incidenciasB.setCriticidadIncidencia_idCriticidadIncidenciaStr("Baja");
                        break;
                    case 2:
                        incidenciasB.setCriticidadIncidencia_idCriticidadIncidenciaStr("Media");
                        break;
                    case 3:
                        incidenciasB.setCriticidadIncidencia_idCriticidadIncidenciaStr("Alta");
                        break;
                }
                switch (incidenciasB.getEstadosIncidencia_idEstadoIncidencia()){
                    case 1:
                        incidenciasB.setEstadosIncidencia_idEstadoIncidenciaStr("Pendiente");
                        break;
                    case 2:
                        incidenciasB.setEstadosIncidencia_idEstadoIncidenciaStr("En curso");
                        break;
                    case 3:
                        incidenciasB.setEstadosIncidencia_idEstadoIncidenciaStr("Cancelado");
                        break;
                    case 4:
                        incidenciasB.setEstadosIncidencia_idEstadoIncidenciaStr("Rechazado");
                        break;
                    case 5:
                        incidenciasB.setEstadosIncidencia_idEstadoIncidenciaStr("Procesado");
                        break;
                }
                switch (incidenciasB.getPersonalRequerido()){
                    case 1:
                        incidenciasB.setPersonalRequeridoStr("Ambulancia");
                        break;
                    case 2:
                        incidenciasB.setPersonalRequeridoStr("Policia");
                        break;
                    case 3:
                        incidenciasB.setPersonalRequeridoStr("Bomberos");
                        break;
                }
                switch (incidenciasB.getTipoMovilidadRequerido()){
                    case 1:
                        incidenciasB.setMovilidadRequeridoStr("Bicicleta");
                        break;
                    case 2:
                        incidenciasB.setMovilidadRequeridoStr("A pie");
                        break;
                    case 3:
                        incidenciasB.setMovilidadRequeridoStr("Canino");
                        break;
                    case 4:
                        incidenciasB.setMovilidadRequeridoStr("Vehiculo");
                        break;
                }


                switch (incidenciasB.getTipoIncidencia()){
                    case "1":
                        incidenciasB.setTipoIncidencia_idTipoIncidenciaStr("Seguridad Pública");
                        break;
                    case "2":
                        incidenciasB.setTipoIncidencia_idTipoIncidenciaStr("Emergencia pública");
                        break;
                    case "3":
                        incidenciasB.setTipoIncidencia_idTipoIncidenciaStr("Infraestructura y Servicios Publicos");
                        break;
                    case "4":
                        incidenciasB.setTipoIncidencia_idTipoIncidenciaStr("Otro");
                        break;
                }

                switch (incidenciasB.getUrbanizacion_idUrbanizacion()){
                    case 1:
                        incidenciasB.setUrbanizacion("Rafael Escardó ");
                        break;
                    case 2:
                        incidenciasB.setUrbanizacion("José de La Riva Agüero");
                        break;
                    case 3:
                        incidenciasB.setUrbanizacion("Juan XXIII");
                        break;
                    case 4:
                        incidenciasB.setUrbanizacion("Libertad");
                        break;
                    case 5:
                        incidenciasB.setUrbanizacion("Los Jardines de La Marina");
                        break;
                    case 6:
                        incidenciasB.setUrbanizacion("Las Leyendas");
                        break;
                    case 7:
                        incidenciasB.setUrbanizacion("Las Torres San Miguelito");
                        break;
                    case 8:
                        incidenciasB.setUrbanizacion("Elmer Faucett");
                        break;
                    case 9:
                        incidenciasB.setUrbanizacion("Maranga");
                        break;
                    case 10:
                        incidenciasB.setUrbanizacion("Pando");
                        break;
                    case 11:
                        incidenciasB.setUrbanizacion("Parques de La Huaca");
                        break;
                    case 12:
                        incidenciasB.setUrbanizacion("Otro");
                        break;
                }
                //


            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return incidenciasB;
    }

    //funcion que falta probar y arreglar:
    public ArrayList<IncidenciasB> listarIncidenciasFiltro(String textoBuscar,String criticidad,String tipo,String estado,String urbanizacion ) {

        String sql = "SELECT * FROM televecinosdb.incidencias WHERE incidencias.borrado=0";

        sql += " AND incidencias.nombreIncidencia LIKE ?";

        if (criticidad != null) {
            sql += " AND incidencias.CriticidadIncidencia_idCriticidadIncidencia = ?";
        }

        if (tipo != null) {
            sql += " AND incidencias.TipoIncidencia_idTipoIncidencia = ?";
        }

        if (estado != null) {
            sql += " AND incidencias.EstadosIncidencia_idEstadosIncidencia = ?";
        }

        if (urbanizacion != null) {
            sql += " AND incidencias.urbanizacion_idUrbanizacion = ?";
        }

        sql += " ORDER BY incidencias.EstadosIncidencia_idEstadosIncidencia ASC";


        ArrayList<IncidenciasB> listaIncidencias = new ArrayList<>();

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1, textoBuscar+ "%");
            if (criticidad != null && tipo != null && estado != null && urbanizacion!=null){
                pstmt.setString(2, criticidad);
                pstmt.setString(3, tipo);
                pstmt.setString(4, estado);
                pstmt.setString(5, urbanizacion);
            }
            else{
                if (criticidad != null && tipo != null && estado != null && urbanizacion==null){
                    pstmt.setString(2, criticidad);
                    pstmt.setString(3, tipo);
                    pstmt.setString(4, estado);
                }
                else{
                    if(criticidad != null && tipo != null && estado==null && urbanizacion==null){
                        pstmt.setString(2, criticidad);
                        pstmt.setString(3, tipo);

                    }
                    else{
                        if(criticidad != null && tipo != null && estado==null && urbanizacion!=null){
                            pstmt.setString(2, criticidad);
                            pstmt.setString(3, tipo);
                            pstmt.setString(4, urbanizacion);
                        }
                        else{
                            if(criticidad != null && tipo == null && estado!=null && urbanizacion!=null){
                                pstmt.setString(2, criticidad);
                                pstmt.setString(3, estado);
                                pstmt.setString(4, urbanizacion);
                            }
                            else{
                                if(criticidad != null && tipo == null && estado!=null && urbanizacion==null){
                                    pstmt.setString(2, criticidad);
                                    pstmt.setString(3, estado);
                                }
                                else{
                                    if(criticidad != null && tipo == null && estado==null && urbanizacion!=null){
                                        pstmt.setString(2, criticidad);
                                        pstmt.setString(3, urbanizacion);
                                    }
                                    else{
                                        if(criticidad != null && tipo == null && estado==null && urbanizacion==null){
                                            pstmt.setString(2, criticidad);
                                        }
                                        else{
                                            if(criticidad == null && tipo != null && estado!=null && urbanizacion!=null){
                                                pstmt.setString(2, tipo);
                                                pstmt.setString(3, estado);
                                                pstmt.setString(4, urbanizacion);
                                            }
                                            else{
                                                if(criticidad == null && tipo != null && estado!=null && urbanizacion==null){
                                                    pstmt.setString(2, tipo);
                                                    pstmt.setString(3, estado);
                                                }
                                                else{
                                                    if(criticidad == null && tipo != null && estado==null && urbanizacion!=null){
                                                        pstmt.setString(2, tipo);
                                                        pstmt.setString(3, urbanizacion);
                                                    }
                                                    else{
                                                        if(criticidad == null && tipo != null && estado==null && urbanizacion==null){
                                                            pstmt.setString(2, tipo);
                                                        }
                                                        else{
                                                            if(criticidad == null && tipo == null && estado!=null && urbanizacion!=null){
                                                                pstmt.setString(2, estado);
                                                                pstmt.setString(3, urbanizacion);
                                                            }
                                                            else{
                                                                if(criticidad == null && tipo == null && estado!=null && urbanizacion==null){
                                                                    pstmt.setString(2, estado);
                                                                }
                                                                else{
                                                                    if(criticidad == null && tipo == null && estado==null && urbanizacion!=null){
                                                                        pstmt.setString(2, urbanizacion);
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }

                                                }
                                            }
                                        }
                                    }
                                }
                            }

                        }
                    }
                }
            }

            try(ResultSet rs = pstmt.executeQuery()){
                while (rs.next()) {
                    IncidenciasB incidenciaB = new IncidenciasB();
                    incidenciaB.setIdIncidencias(rs.getInt("idIncidencias"));
                    incidenciaB.setNombreIncidencia(rs.getString("nombreIncidencia"));
                    incidenciaB.setFecha(rs.getString("fecha"));
                    incidenciaB.setLugarExacto(rs.getString("lugarExacto"));
                    incidenciaB.setIdUrbanizacion(rs.getInt("urbanizacion_idUrbanizacion"));
                    incidenciaB.setAmbulancia(rs.getInt("ambulancia"));
                    incidenciaB.setNumeroContacto(rs.getString("numeroContacto"));
                    incidenciaB.setCriticidadIncidencia_idCriticidadIncidencia(rs.getInt("CriticidadIncidencia_idCriticidadIncidencia"));
                    incidenciaB.setTipoIncidencia_idTipoIncidencia(rs.getInt("TipoIncidencia_idTipoIncidencia"));
                    incidenciaB.setEstadosIncidencia_idEstadoIncidencia(rs.getInt("EstadosIncidencia_idEstadosIncidencia"));
                    incidenciaB.setSerenazgo_idSerenazgo(rs.getInt("Serenazgo_idSerenazgo"));
                    incidenciaB.setUsuario_idUsuario(rs.getInt("Usuario_idUsuario"));
                    incidenciaB.setIncidenciaPersonal(rs.getInt("incidenciaPersonal"));
                    incidenciaB.setNombrePersonalTurno(rs.getString("nombreDelPersonalEnTurno"));
                    incidenciaB.setNombreFoto(rs.getString("nombreFoto"));
                    listaIncidencias.add(incidenciaB);

                    switch (incidenciaB.getCriticidadIncidencia_idCriticidadIncidencia()){
                        case 1:
                            incidenciaB.setCriticidadIncidencia_idCriticidadIncidenciaStr("Baja");
                            break;
                        case 2:
                            incidenciaB.setCriticidadIncidencia_idCriticidadIncidenciaStr("Media");
                            break;
                        case 3:
                            incidenciaB.setCriticidadIncidencia_idCriticidadIncidenciaStr("Alta");
                            break;
                    }
                    switch (incidenciaB.getEstadosIncidencia_idEstadoIncidencia()){
                        case 1:
                            incidenciaB.setEstadosIncidencia_idEstadoIncidenciaStr("Pendiente");
                            break;
                        case 2:
                            incidenciaB.setEstadosIncidencia_idEstadoIncidenciaStr("En curso");
                            break;
                        case 3:
                            incidenciaB.setEstadosIncidencia_idEstadoIncidenciaStr("Cancelado");
                            break;
                        case 4:
                            incidenciaB.setEstadosIncidencia_idEstadoIncidenciaStr("Rechazado");
                            break;
                        case 5:
                            incidenciaB.setEstadosIncidencia_idEstadoIncidenciaStr("Procesado");
                            break;
                    }
                    switch (incidenciaB.getTipoIncidencia_idTipoIncidencia()){
                        case 1:
                            incidenciaB.setTipoIncidencia_idTipoIncidenciaStr("Seguridad Pública");
                            break;
                        case 2:
                            incidenciaB.setTipoIncidencia_idTipoIncidenciaStr("Emergencia pública");
                            break;
                        case 3:
                            incidenciaB.setTipoIncidencia_idTipoIncidenciaStr("Infraestructura y Servicios Publicos");
                            break;
                        case 4:
                            incidenciaB.setTipoIncidencia_idTipoIncidenciaStr("Otro");
                            break;
                    }

                    switch (incidenciaB.getIdUrbanizacion()){
                        case 1:
                            incidenciaB.setUrbanizacion("Rafael Escardó ");
                            break;
                        case 2:
                            incidenciaB.setUrbanizacion("José de La Riva Agüero");
                            break;
                        case 3:
                            incidenciaB.setUrbanizacion("Juan XXIII");
                            break;
                        case 4:
                            incidenciaB.setUrbanizacion("Libertad");
                            break;
                        case 5:
                            incidenciaB.setUrbanizacion("Los Jardines de La Marina");
                            break;
                        case 6:
                            incidenciaB.setUrbanizacion("Las Leyendas");
                            break;
                        case 7:
                            incidenciaB.setUrbanizacion("Las Torres San Miguelito");
                            break;
                        case 8:
                            incidenciaB.setUrbanizacion("Elmer Faucett");
                            break;
                        case 9:
                            incidenciaB.setUrbanizacion("Maranga");
                            break;
                        case 10:
                            incidenciaB.setUrbanizacion("Pando");
                            break;
                        case 11:
                            incidenciaB.setUrbanizacion("Parques de La Huaca");
                            break;
                        case 12:
                            incidenciaB.setUrbanizacion("Otro");
                            break;
                    }

            }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaIncidencias;
    }

    public void actualizarIncidenciaS(IncidenciasB incidencia) {

        String sql = "UPDATE incidencias " +
                "SET solucionADar = ?, personalRequerido_idpersonalRequerido = ?, nombreDelPersonalEnTurno = ?, tipoMovilidadRequerido = ?,CriticidadIncidencia_idCriticidadIncidencia=?,EstadosIncidencia_idEstadosIncidencia=?,Serenazgo_idSerenazgo=? " +
                "WHERE idIncidencias = ? ;";

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, incidencia.getSolucionADar());
            pstmt.setInt(2, incidencia.getPersonalRequerido());
            pstmt.setString(3, incidencia.getNombrePersonalTurno());
            pstmt.setInt(4,incidencia.getTipoMovilidadRequerido() );
            pstmt.setInt(5,incidencia.getCriticidadIncidencia_idCriticidadIncidencia() );
            pstmt.setInt(6,incidencia.getEstadosIncidencia_idEstadoIncidencia() );
            pstmt.setInt(7, incidencia.getSerenazgo_idSerenazgo());
            pstmt.setInt(8, incidencia.getIdIncidencias());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    public void actualizarIncidenciaComoCancelada(String idIncidencia) {
        String sql = "update incidencias\n" +
                "set EstadosIncidencia_idEstadosIncidencia = 3\n" +
                "where idIncidencias = ?";

        try (Connection connection = getConnection();
             PreparedStatement pstmt1 = connection.prepareStatement(sql)) {
            pstmt1.setString(1, idIncidencia);


            pstmt1.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public void actualizarIncidenciaComoFalsa(String idIncidencia,String idUsuario) {
        String sql = "update incidencias\n" +
                "set EstadosIncidencia_idEstadosIncidencia = 4\n" +
                "where idIncidencias = ?";

        try (Connection connection = getConnection();
             PreparedStatement pstmt1 = connection.prepareStatement(sql)) {
            pstmt1.setString(1, idIncidencia);


            pstmt1.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        String sql2 = "SELECT u.cantidadIncidenciasFalsas \n" +
                "FROM incidencias i\n" +
                "INNER JOIN usuario u ON u.idUsuario = i.Usuario_idUsuario\n" +
                "where u.idUsuario = ?";

        int cantidadIncidenciasFalsas=0;
        try (Connection connection = getConnection();
             PreparedStatement pstmt2 = connection.prepareStatement(sql2)) {
            pstmt2.setString(1, idUsuario);

            try(ResultSet rs = pstmt2.executeQuery()){
                if(rs.next()) {
                    cantidadIncidenciasFalsas = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        String sql3 = "update usuario\n" +
                "set cantidadIncidenciasFalsas = ?\n" +
                "where idUsuario = ?";

        try (Connection connection = getConnection();
             PreparedStatement pstmt3 = connection.prepareStatement(sql3)) {
            pstmt3.setInt(1, cantidadIncidenciasFalsas + 1);
            pstmt3.setString(2, idUsuario);
            pstmt3.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }



    }

    public void borradorLogicoIncidencia(String inicienciaId) {
        String sql = "update incidencias\n" +
                "set borrado = 1\n" +
                "where idIncidencias = ?";

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, inicienciaId);


            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public ArrayList<Double> DashboardTabla1234(int i) {
        ArrayList<Integer> tabla1 = new ArrayList<>();

        String sql = "SELECT " +
                "SUM(CASE WHEN i.EstadosIncidencia_idEstadosIncidencia = 1 THEN 1 ELSE 0 END) AS pendientes, " +
                "SUM(CASE WHEN i.EstadosIncidencia_idEstadosIncidencia = 2 THEN 1 ELSE 0 END) AS en_curso, " +
                "SUM(CASE WHEN i.EstadosIncidencia_idEstadosIncidencia = 3 THEN 1 ELSE 0 END) AS cancelado, " +
                "SUM(CASE WHEN i.EstadosIncidencia_idEstadosIncidencia = 4 THEN 1 ELSE 0 END) AS rechazado, " +
                "SUM(CASE WHEN i.EstadosIncidencia_idEstadosIncidencia = 5 THEN 1 ELSE 0 END) AS procesado " +
                "FROM televecinosdb.incidencias i " +
                "JOIN televecinosdb.tipoincidencia ti ON i.TipoIncidencia_idTipoIncidencia = ti.idTipoIncidencia " +
                "WHERE ti.idTipoIncidencia = " + i;



        try (Connection connection = getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if(rs.next()){
                tabla1.add(rs.getInt(1));
                tabla1.add(rs.getInt(2));
                tabla1.add(rs.getInt(3));
                tabla1.add(rs.getInt(4));
                tabla1.add(rs.getInt(5));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return calcularPorcentajes(tabla1);
    }

    public ArrayList<Double> calcularPorcentajes(ArrayList<Integer> numeros) {
        //double sumaTotal = numeros.stream().mapToInt(Integer::intValue).sum();
        double sumaTotal = 0;
        for(int i=0;i<numeros.size();i++){
            sumaTotal += numeros.get(i);
        }

        ArrayList<Double> porcentajes = new ArrayList<>();
        for (int i = 0; i < numeros.size(); i++) {
            double porcentaje = (numeros.get(i) / sumaTotal) * 100.0;
            BigDecimal porcentajeRedondeado = new BigDecimal(porcentaje).setScale(2, RoundingMode.HALF_UP);
            porcentajes.add(porcentajeRedondeado.doubleValue());
        }
        return porcentajes;
    }

    public ArrayList<Integer> DashboardTabla7(int i) {
        ArrayList<Integer> tabla1 = new ArrayList<>();
        String sql = "SELECT " +
                "u.idUrbanizacion, " +
                "COUNT(i.idIncidencias) AS cantidad_incidencias " +
                "FROM " +
                "televecinosdb.urbanizacion u " +
                "LEFT JOIN " +
                "televecinosdb.incidencias i ON u.idUrbanizacion = i.urbanizacion_idUrbanizacion " +
                "AND i.TipoIncidencia_idTipoIncidencia = " + i +"\n" +
                "GROUP BY " +
                "u.idUrbanizacion " +
                "ORDER BY " +
                "u.idUrbanizacion;";
        try (Connection connection = getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while(rs.next()){
                tabla1.add(rs.getInt(2));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return tabla1;
    }

    public ArrayList<Integer> DashboardTabla6(int i) {

        ArrayList<Integer> tabla1 = new ArrayList<>(Arrays.asList(0, 0, 0, 0, 0, 0, 0));

        String sql = "SELECT \n" +
                "    DAYNAME(fecha) AS dia_semana,\n" +
                "    COUNT(*) AS cantidad_incidencias\n" +
                "FROM \n" +
                "    televecinosdb.incidencias\n" +
                "WHERE \n" +
                "    TipoIncidencia_idTipoIncidencia =" + i + "\n" +
                "GROUP BY \n" +
                "    dia_semana\n" +
                "ORDER BY \n" +
                "    FIELD(dia_semana, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');";

        Map<String, Integer> diasSemana = new HashMap<>();
        diasSemana.put("Monday", 0);
        diasSemana.put("Tuesday", 1);
        diasSemana.put("Wednesday", 2);
        diasSemana.put("Thursday", 3);
        diasSemana.put("Friday", 4);
        diasSemana.put("Saturday", 5);
        diasSemana.put("Sunday", 6);


        try (Connection connection = getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                String dia = rs.getString(1);
                int cantidad = rs.getInt(2);
                if (diasSemana.containsKey(dia)) {
                    int index = diasSemana.get(dia);
                    tabla1.set(index, cantidad);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return tabla1;

    }
    public ArrayList<Integer> DashboardTabla6_mes(int i) {

        ArrayList<Integer> tabla1 = new ArrayList<>(Arrays.asList(0, 0, 0, 0, 0, 0, 0,0,0,0,0,0));

        String sql = "SELECT \n" +
                "    DATE_FORMAT(fecha, '%m') AS mes,\n" +
                "   \n" +
                "    COUNT(*) AS cantidad_incidencias\n" +
                "FROM \n" +
                "    televecinosdb.incidencias\n" +
                "WHERE \n" +
                "    TipoIncidencia_idTipoIncidencia =" + i + "\n" +
                "GROUP BY \n" +
                "    mes";

        Map<String, Integer> meses = new HashMap<>();
        meses.put("01", 0);
        meses.put("02", 1);
        meses.put("03", 2);
        meses.put("04", 3);
        meses.put("05", 4);
        meses.put("06", 5);
        meses.put("07", 6);
        meses.put("08", 7);
        meses.put("09", 8);
        meses.put("10", 9);
        meses.put("11", 10);
        meses.put("12", 11);


        try (Connection connection = getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                String mes = rs.getString(1);
                int cantidad = rs.getInt(2);
                if (meses.containsKey(mes)) {
                    int index = meses.get(mes);
                    tabla1.set(index, cantidad);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return tabla1;

    }

}
