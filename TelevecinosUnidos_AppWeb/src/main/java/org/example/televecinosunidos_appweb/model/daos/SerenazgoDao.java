package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.EventoB;
import org.example.televecinosunidos_appweb.model.beans.ProfesoresEvento;
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

        String sql = "SELECT s.idSerenazgo, s.nombre, s.apellido,s.dni, sTurno.turno, sTipo.tipo, numTelefono " +
                "FROM serenazgo s " +
                "JOIN turnoserenazgo sTurno ON s.TurnoSerenazgo_idTurnoSerenazgo = sTurno.idTurnoSerenazgo " +
                "JOIN tiposerenazgo sTipo ON s.TipoSerenazgo_idTipoSerenazgo = sTipo.idTipoSerenazgo " ;


        ArrayList<SerenazgoB> listaSerenazgos = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                SerenazgoB serenazgoB = new SerenazgoB();
                serenazgoB.setIdSerenazgo(rs.getInt(1));
                serenazgoB.setNombre(rs.getString(2));
                serenazgoB.setApellido(rs.getString(3));
                serenazgoB.setDni(rs.getString(4));
                serenazgoB.setTurnoSerenazgoStr(rs.getString(5));
                serenazgoB.setTipoSerenazgoStr(rs.getString(6));
                serenazgoB.setNumTelefono(rs.getString(7));

                listaSerenazgos.add(serenazgoB); // Asegurarse de añadir el serenazgo a la lista
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return listaSerenazgos;
    }

    public SerenazgoB buscarSerenazgoPorId(String idSerenazgo) {
        return new SerenazgoB();

    }


}
