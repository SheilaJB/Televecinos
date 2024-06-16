package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.IncidenciasB;
import org.example.televecinosunidos_appweb.model.beans.UsuarioB;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
                incidenciaB.setUrbanizacion(rs.getString("urbanizacion_idUrbanizacion"));
                incidenciaB.setAmbulancia(rs.getInt("ambulancia"));
                incidenciaB.setNumeroContacto(rs.getString("numeroContacto"));
                incidenciaB.setCriticidadIncidencia_idCriticidadIncidencia(rs.getInt("CriticidadIncidencia_idCriticidadIncidencia"));
                incidenciaB.setTipoIncidencia(rs.getString("TipoIncidencia_idTipoIncidencia"));
                incidenciaB.setEstadosIncidencia_idEstadoIncidencia(rs.getInt("EstadosIncidencia_idEstadosIncidencia"));
                incidenciaB.setSerenazgo_idSerenazgo(rs.getInt("Serenazgo_idSerenazgo"));
                incidenciaB.setUsuario_idUsuario(rs.getInt("Usuario_idUsuario"));
                incidenciaB.setIncidenciaPersonal(rs.getInt("incidenciaPersonal"));




                listaIncidencias.add(incidenciaB);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return listaIncidencias;
    }

}
