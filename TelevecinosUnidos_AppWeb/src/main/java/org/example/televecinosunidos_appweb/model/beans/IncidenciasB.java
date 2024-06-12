package org.example.televecinosunidos_appweb.model.beans;

public class IncidenciasB {
    private int idIncidencias;
    private String nombreIncidencia;
    private String lugarExacto;
    private String referencia;
    private String foto;
    private int ambulancia;
    private String numeroContacto;
    private int criticidadIncidencia_idCriticidadIncidencia;
    private int estadosIncidencia_idEstadoIncidencia;
    private int serenazgo_idSerenazgo;
    private int usuario_idUsuario;
    private int incidenciaPersonal;
    private String fecha; // Corregido a camelCase
    private  String hora;
    private String tipoIncidencia;
    private String estadoIncidencia;

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public int getIdIncidencias() {
        return idIncidencias;
    }

    public void setIdIncidencias(int idIncidencias) {
        this.idIncidencias = idIncidencias;
    }

    public String getNombreIncidencia() {
        return nombreIncidencia;
    }

    public void setNombreIncidencia(String nombreIncidencia) {
        this.nombreIncidencia = nombreIncidencia;
    }

    public String getLugarExacto() {
        return lugarExacto;
    }

    public void setLugarExacto(String lugarExacto) {
        this.lugarExacto = lugarExacto;
    }

    public String getReferencia() {
        return referencia;
    }

    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public int getAmbulancia() {
        return ambulancia;
    }

    public void setAmbulancia(int ambulancia) {
        this.ambulancia = ambulancia;
    }

    public String getNumeroContacto() {
        return numeroContacto;
    }

    public void setNumeroContacto(String numeroContacto) {
        this.numeroContacto = numeroContacto;
    }

    public int getCriticidadIncidencia_idCriticidadIncidencia() {
        return criticidadIncidencia_idCriticidadIncidencia;
    }

    public void setCriticidadIncidencia_idCriticidadIncidencia(int criticidadIncidencia_idCriticidadIncidencia) {
        this.criticidadIncidencia_idCriticidadIncidencia = criticidadIncidencia_idCriticidadIncidencia;
    }

    public int getEstadosIncidencia_idEstadoIncidencia() {
        return estadosIncidencia_idEstadoIncidencia;
    }

    public void setEstadosIncidencia_idEstadoIncidencia(int estadosIncidencia_idEstadoIncidencia) {
        this.estadosIncidencia_idEstadoIncidencia = estadosIncidencia_idEstadoIncidencia;
    }

    public int getSerenazgo_idSerenazgo() {
        return serenazgo_idSerenazgo;
    }

    public void setSerenazgo_idSerenazgo(int serenazgo_idSerenazgo) {
        this.serenazgo_idSerenazgo = serenazgo_idSerenazgo;
    }

    public int getUsuario_idUsuario() {
        return usuario_idUsuario;
    }

    public void setUsuario_idUsuario(int usuario_idUsuario) {
        this.usuario_idUsuario = usuario_idUsuario;
    }

    public int getIncidenciaPersonal() {
        return incidenciaPersonal;
    }

    public void setIncidenciaPersonal(int incidenciaPersonal) {
        this.incidenciaPersonal = incidenciaPersonal;
    }


    public String getTipoIncidencia() {
        return tipoIncidencia;
    }

    public void setTipoIncidencia(String tipoIncidencia) {
        this.tipoIncidencia = tipoIncidencia;
    }

    public String getEstadoIncidencia() {
        return estadoIncidencia;
    }

    public void setEstadoIncidencia(String estadoIncidencia) {
        this.estadoIncidencia = estadoIncidencia;
    }
}