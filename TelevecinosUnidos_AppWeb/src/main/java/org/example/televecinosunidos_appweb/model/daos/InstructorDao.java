package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.ProfesoresEvento;
import org.example.televecinosunidos_appweb.model.beans.SerenazgoB;
import org.example.televecinosunidos_appweb.model.beans.UsuarioB;

import java.sql.*;
import java.util.ArrayList;

public class InstructorDao extends BaseDao{

    public ArrayList<ProfesoresEvento> listarProfesores() {
        String sql = "SELECT * FROM televecinosdb.profesoresevento;" ;


        ArrayList<ProfesoresEvento> lista = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                ProfesoresEvento profesoresEvento = new ProfesoresEvento();
                profesoresEvento.setIdProfesoresEvento(rs.getInt(1));
                profesoresEvento.setNombre(rs.getString(2));
                profesoresEvento.setApellido(rs.getString(3));
                profesoresEvento.setCurso(rs.getString(4));



                lista.add(profesoresEvento);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return lista;

    }

    public void registrarNuevoProfesor(ProfesoresEvento profesoresEvento) {
        String sql = "INSERT INTO `televecinosdb`.`profesoresevento` (`nombre`, `apellido`, `curso`) VALUES (?, ?, ?)";
        try(Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setString(1,profesoresEvento.getNombre());
            pstmt.setString(2,profesoresEvento.getApellido());
            pstmt.setString(3,profesoresEvento.getCurso());


            pstmt.executeUpdate();


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public ArrayList<ProfesoresEvento> listarProfesoresPorNombre(String textoBuscar) {
        String sql = "SELECT * FROM televecinosdb.profesoresevento where nombre like ? or apellido like ?);" ;


        ArrayList<ProfesoresEvento> lista = new ArrayList<>();

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, textoBuscar+ "%");
            pstmt.setString(2, textoBuscar+ "%");
            try(ResultSet rs = pstmt.executeQuery()){
                while (rs.next()) {
                    ProfesoresEvento profesoresEvento = new ProfesoresEvento();
                    profesoresEvento.setIdProfesoresEvento(rs.getInt(1));
                    profesoresEvento.setNombre(rs.getString(2));
                    profesoresEvento.setApellido(rs.getString(3));
                    profesoresEvento.setCurso(rs.getString(4));



                    lista.add(profesoresEvento);
                }

            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return lista;

    }
}
