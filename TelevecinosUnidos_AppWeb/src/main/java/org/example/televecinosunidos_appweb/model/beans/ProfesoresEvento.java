package org.example.televecinosunidos_appweb.model.beans;

public class ProfesoresEvento {
    private int idProfesoresEvento;
    private String nombre;
    private String apellido;
    private String curso;

    public int getIdProfesoresEvento() {
        return idProfesoresEvento;
    }

    public void setIdProfesoresEvento(int idProfesoresEvento) {
        this.idProfesoresEvento = idProfesoresEvento;
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

    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }
}
