package org.example.televecinosunidos_appweb.model.beans;

import java.util.Date;

public class SerenazgoB {

    private int idSerenazgo;
    private String nombre;

    private String apellido;
    private String dni;
    private String dirección;
    private String numTelefono;
    private Date fechaNacimiento;
    private int idTurnoSerenazgo;
    private String turnoSerenazgoStr;
    private String tipoSerenazgoStr;

    public String getTurnoSerenazgoStr() {
        return turnoSerenazgoStr;
    }

    public void setTurnoSerenazgoStr(String turnoSerenazgoStr) {
        this.turnoSerenazgoStr = turnoSerenazgoStr;
    }

    public String getTipoSerenazgoStr() {
        return tipoSerenazgoStr;
    }

    public void setTipoSerenazgoStr(String tipoSerenazgoStr) {
        this.tipoSerenazgoStr = tipoSerenazgoStr;
    }

    private int idTipoSerenazgo;

    public int getIdSerenazgo() {
        return idSerenazgo;
    }

    public void setIdSerenazgo(int idSerenazgo) {
        this.idSerenazgo = idSerenazgo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getDirección() {
        return dirección;
    }

    public void setDirección(String dirección) {
        this.dirección = dirección;
    }

    public String getNumTelefono() {
        return numTelefono;
    }

    public void setNumTelefono(String numTelefono) {
        this.numTelefono = numTelefono;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public int getIdTurnoSerenazgo() {
        return idTurnoSerenazgo;
    }

    public void setIdTurnoSerenazgo(int idTurnoSerenazgo) {
        this.idTurnoSerenazgo = idTurnoSerenazgo;
    }

    public int getIdTipoSerenazgo() {
        return idTipoSerenazgo;
    }

    public void setIdTipoSerenazgo(int idTipoSerenazgo) {
        this.idTipoSerenazgo = idTipoSerenazgo;
    }
}
