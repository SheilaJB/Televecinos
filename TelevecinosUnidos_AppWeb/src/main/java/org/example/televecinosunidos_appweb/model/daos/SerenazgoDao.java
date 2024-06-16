package org.example.televecinosunidos_appweb.model.daos;

import org.example.televecinosunidos_appweb.model.beans.EventoB;
import org.example.televecinosunidos_appweb.model.beans.ProfesoresEvento;
import org.example.televecinosunidos_appweb.model.beans.SerenazgoB;

import java.sql.*;
import java.text.SimpleDateFormat;
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

        String sql = "select * from Serenazgo " ;


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
                //serenazgoB.setNumTelefono(rs.getString(7));

                listaSerenazgos.add(serenazgoB); // Asegurarse de añadir el serenazgo a la lista
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return listaSerenazgos;
    }

    public SerenazgoB buscarSerenazgoPorId(String idSerenazgo) {
        SerenazgoB serenazgoB= new SerenazgoB();

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
                "JOIN tiposerenazgo sTipo ON s.TipoSerenazgo_idTipoSerenazgo = sTipo.idTipoSerenazgo " +
                "WHERE idSerenazgo = ?";


        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,idSerenazgo);

            try(ResultSet rs = pstmt.executeQuery()){
                while (rs.next()){
                    serenazgoB.setIdSerenazgo(rs.getInt(1));
                    serenazgoB.setNombre(rs.getString(2));
                    serenazgoB.setApellido(rs.getString(3));
                    serenazgoB.setDni(rs.getString(4));
                    serenazgoB.setTurnoSerenazgoStr(rs.getString(5));
                    serenazgoB.setTipoSerenazgoStr(rs.getString(6));
                    serenazgoB.setNumTelefono(rs.getString(7));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return serenazgoB;

    }


    public void registrarSerenazgo(SerenazgoB serenazgoB) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/televecinosdb";
        String username = "root";
        String password = "root";

        String sql = "INSERT INTO `televecinosDB`.`Serenazgo` (`nombre`, `apellido`, `dni`, `direccion`, `numTelefono`,`fechaNacimiento`,`TurnoSerenazgo_idTurnoSerenazgo`, `TipoSerenazgo_idTipoSerenazgo`) VALUES " +
                "(?,?,?,?,?,?,?,?)";


        try(Connection conn = DriverManager.getConnection(url,username,password); PreparedStatement pstmt = conn.prepareStatement(sql);) { // usando try con recursos

            pstmt.setString(1,serenazgoB.getNombre());
            pstmt.setString(2,serenazgoB.getApellido());
            pstmt.setString(3,serenazgoB.getDni());
            pstmt.setString(4,serenazgoB.getDireccion());
            pstmt.setString(5,serenazgoB.getNumTelefono());
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String fechaNacimientoStr = formatter.format(serenazgoB.getFechaNacimiento());
            pstmt.setString(6,fechaNacimientoStr);
            pstmt.setInt(7,serenazgoB.getIdTurnoSerenazgo());
            pstmt.setInt(8,serenazgoB.getIdTipoSerenazgo());

            pstmt.executeUpdate();


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
