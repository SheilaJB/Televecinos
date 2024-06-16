package org.example.televecinosunidos_appweb.model.beans;

import java.util.Date;

public class SerenazgoB {

    private int idSerenazgo;
    private String numTelefono;
    private String fechaNacimiento;
    private int idTurnoSerenazgo;
    private int idTipoSerenazgo;
    private String turnoSerenazgoStr;
    private String tipoSerenazgoStr;
    private UsuarioB usuario;



    public SerenazgoB() {

    }


    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public int getIdSerenazgo() {
        return idSerenazgo;
    }

    public void setIdSerenazgo(int idSerenazgo) {
        this.idSerenazgo = idSerenazgo;
    }

    public int getIdTipoSerenazgo() {
        return idTipoSerenazgo;
    }

    public void setIdTipoSerenazgo(int idTipoSerenazgo) {
        this.idTipoSerenazgo = idTipoSerenazgo;
    }

    public int getIdTurnoSerenazgo() {
        return idTurnoSerenazgo;
    }

    public void setIdTurnoSerenazgo(int idTurnoSerenazgo) {
        this.idTurnoSerenazgo = idTurnoSerenazgo;
    }

    public String getNumTelefono() {
        return numTelefono;
    }

    public void setNumTelefono(String numTelefono) {
        this.numTelefono = numTelefono;
    }

    public String getTipoSerenazgoStr() {
        return tipoSerenazgoStr;
    }

    public void setTipoSerenazgoStr(String tipoSerenazgoStr) {
        this.tipoSerenazgoStr = tipoSerenazgoStr;
    }

    public String getTurnoSerenazgoStr() {
        return turnoSerenazgoStr;
    }

    public void setTurnoSerenazgoStr(String turnoSerenazgoStr) {
        this.turnoSerenazgoStr = turnoSerenazgoStr;
    }

    public UsuarioB getUsuario() {
        return usuario;
    }

    public void setUsuario(UsuarioB usuario) {
        this.usuario = usuario;
    }
}
