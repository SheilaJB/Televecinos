package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.IncidenciasB;
import org.example.televecinosunidos_appweb.model.beans.UsuarioB;

import java.sql.*;
import java.util.ArrayList;

public class IncidenciaDao extends BaseDao{
    public ArrayList<IncidenciasB> listarIncidencias() {

        String sql = "SELECT * FROM televecinosdb.incidencias;" ;


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
                    incidenciasB.setUrbanizacion(rs.getString("urbanizacion_idUrbanizacion"));
                    incidenciasB.setAmbulancia(rs.getInt("ambulancia"));
                    incidenciasB.setNumeroContacto(rs.getString("numeroContacto"));
                    incidenciasB.setCriticidadIncidencia_idCriticidadIncidencia(rs.getInt("CriticidadIncidencia_idCriticidadIncidencia"));
                    incidenciasB.setTipoIncidencia(rs.getString("TipoIncidencia_idTipoIncidencia"));
                    incidenciasB.setEstadosIncidencia_idEstadoIncidencia(rs.getInt("EstadosIncidencia_idEstadosIncidencia"));
                    incidenciasB.setSerenazgo_idSerenazgo(rs.getInt("Serenazgo_idSerenazgo"));
                    incidenciasB.setUsuario_idUsuario(rs.getInt("Usuario_idUsuario"));
                    incidenciasB.setIncidenciaPersonal(rs.getInt("incidenciaPersonal"));

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return incidenciasB;
    }

    //funcion que falta probar y arreglar:
    public ArrayList<IncidenciasB> listarIncidenciasFiltro(String textoBuscar,String criticidad,String tipo,String estado,String urbanizacion ) {

        String sql = "SELECT * FROM televecinosdb.incidencias where incidencias.nombreIncidencia  like ?" ;

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
            sql += "AND incidencias.urbanizacion_idUrbanizacion = ?;";
        }



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



}
