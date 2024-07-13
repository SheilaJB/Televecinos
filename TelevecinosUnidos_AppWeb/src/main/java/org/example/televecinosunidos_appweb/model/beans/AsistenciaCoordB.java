package org.example.televecinosunidos_appweb.model.beans;

import java.io.InputStream;

public class AsistenciaCoordB {
    private int idAsistenciaCoordinadora;
    private int idEvento;
    private String fechaEvento;
    private String hora_inicio;
    private String hora_fin;
    private InputStream foto;
    private String nombreFoto;
    private boolean asistencia;
    private String hora_entrada;
    private String hora_salida;
    private String nombreEvento;

    public int getIdAsistenciaCoordinadora() {
        return idAsistenciaCoordinadora;
    }

    public void setIdAsistenciaCoordinadora(int idAsistenciaCoordinadora) {
        this.idAsistenciaCoordinadora = idAsistenciaCoordinadora;
    }

    public int getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(int idEvento) {
        this.idEvento = idEvento;
    }

    public String getFechaEvento() {
        return fechaEvento;
    }

    public void setFechaEvento(String fechaEvento) {
        this.fechaEvento = fechaEvento;
    }

    public String getHora_inicio() {
        return hora_inicio;
    }

    public void setHora_inicio(String hora_inicio) {
        this.hora_inicio = hora_inicio;
    }

    public String getHora_fin() {
        return hora_fin;
    }

    public void setHora_fin(String hora_fin) {
        this.hora_fin = hora_fin;
    }

    public InputStream getFoto() {
        return foto;
    }

    public void setFoto(InputStream foto) {
        this.foto = foto;
    }

    public String getNombreFoto() {
        return nombreFoto;
    }

    public void setNombreFoto(String nombreFoto) {
        this.nombreFoto = nombreFoto;
    }

    public boolean isAsistencia() {
        return asistencia;
    }

    public void setAsistencia(boolean asistencia) {
        this.asistencia = asistencia;
    }

    public String getHora_entrada() {
        return hora_entrada;
    }

    public void setHora_entrada(String hora_entrada) {
        this.hora_entrada = hora_entrada;
    }

    public String getHora_salida() {
        return hora_salida;
    }

    public void setHora_salida(String hora_salida) {
        this.hora_salida = hora_salida;
    }

    public String getNombreEvento() {
        return nombreEvento;
    }

    public void setNombreEvento(String nombreEvento) {
        this.nombreEvento = nombreEvento;
    }
}
