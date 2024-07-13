package org.example.televecinosunidos_appweb.model.beans;

import java.io.InputStream;
import java.time.LocalDate;
import java.time.LocalTime;

public class EventoB {
    private int idEvento;
    private  int idPag;
    private String nombre;
    private String apellido;
    private String descripcion;
    private String lugar;
    private int Coordinador_idUsuario;
    private String nombreCoordinador;
    private String apellidoCoordinador;
    private String fecha_inicio;
    private String fecha_fin;
    private String nombreEvento;
    private String hora_inicio;
    private String hora_fin;
    private int cantidadVacantes;
    private int cantDisponibles;
    private InputStream foto;
    private String listaMateriales;
    private int EventEstados_idEventEstados;
    private int EventFrecuencia_idEventFrecuencia;
    private int TipoEvento_idTipoEvento;
    private int ProfesoresEvento_idProfesoresEvento;
    private String diaEvento;
    private String nombreFoto;

    private String tipoEvento;

    private String yaInscrito;

    public String getYaInscrito() {
        return yaInscrito;
    }

    public void setYaInscrito(String yaInscrito) {
        this.yaInscrito = yaInscrito;
    }

    public String getTipoEvento() {
        return tipoEvento;
    }

    public void setTipoEvento(String tipoEvento) {
        this.tipoEvento = tipoEvento;
    }

    public int getIdPag() {
        return idPag;
    }

    public void setIdPag(int idPag) {
        this.idPag = idPag;
    }

    public String getNombreFoto() {
        return nombreFoto;
    }

    public void setNombreFoto(String nombreFoto) {
        this.nombreFoto = nombreFoto;
    }

    public String getDiaEvento() {
        return diaEvento;
    }

    public void setDiaEvento(String diaEvento) {
        this.diaEvento = diaEvento;
    }

    private String estadoString;
    private String frecuenciaString;

    private String nombreProfesor;
    private String apellidoProfesor;

    public String getNombreCoordinador() {
        return nombreCoordinador;
    }

    public void setNombreCoordinador(String nombreCoordinador) {
        this.nombreCoordinador = nombreCoordinador;
    }

    public String getApellidoCoordinador() {
        return apellidoCoordinador;
    }

    public void setApellidoCoordinador(String apellidoCoordinador) {
        this.apellidoCoordinador = apellidoCoordinador;
    }

    public String getNombreEvento() {
        return nombreEvento;
    }

    public void setNombreEvento(String nombreEvento) {
        this.nombreEvento = nombreEvento;
    }

    public String getFrecuenciaString() {
        return frecuenciaString;
    }

    public void setFrecuenciaString(String frecuenciaString) {
        this.frecuenciaString = frecuenciaString;
    }

    public String getEstadoString() {
        return estadoString;
    }

    public void setEstadoString(String estadoString) {
        this.estadoString = estadoString;
    }

    public int getidEvento() {
        return idEvento;
    }

    public void setidEvento(int idEventos) {
        this.idEvento = idEventos;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public int getCoordinador_idUsuario() {
        return Coordinador_idUsuario;
    }

    public void setCoordinador_idUsuario(int coordinador_idUsuario) {
        Coordinador_idUsuario = coordinador_idUsuario;
    }

    public String getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(String fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public String getFecha_fin() {
        return fecha_fin;
    }

    public void setFecha_fin(String fecha_fin) {
        this.fecha_fin = fecha_fin;
    }

    public int getCantidadVacantes() {
        return cantidadVacantes;
    }

    public void setCantidadVacantes(int cantidadVacantes) {
        this.cantidadVacantes = cantidadVacantes;
    }

    public int getCantDisponibles() {
        return cantDisponibles;
    }

    public void setCantDisponibles(int cantDisponibles) {
        this.cantDisponibles = cantDisponibles;
    }

    public InputStream getFoto() {
        return foto;
    }

    public void setFoto(InputStream foto) {
        this.foto = foto;
    }

    public String getListaMateriales() {
        return listaMateriales;
    }

    public void setListaMateriales(String listaMateriales) {
        this.listaMateriales = listaMateriales;
    }

    public int getEventEstados_idEventEstados() {
        return EventEstados_idEventEstados;
    }

    public void setEventEstados_idEventEstados(int eventEstados_idEventEstados) {
        EventEstados_idEventEstados = eventEstados_idEventEstados;
    }

    public int getEventFrecuencia_idEventFrecuencia() {
        return EventFrecuencia_idEventFrecuencia;
    }

    public void setEventFrecuencia_idEventFrecuencia(int eventFrecuencia_idEventFrecuencia) {
        EventFrecuencia_idEventFrecuencia = eventFrecuencia_idEventFrecuencia;
    }

    public int getTipoEvento_idTipoEvento() {
        return TipoEvento_idTipoEvento;
    }

    public void setTipoEvento_idTipoEvento(int tipoEvento_idTipoEvento) {
        TipoEvento_idTipoEvento = tipoEvento_idTipoEvento;
    }

    public int getProfesoresEvento_idProfesoresEvento() {
        return ProfesoresEvento_idProfesoresEvento;
    }

    public void setProfesoresEvento_idProfesoresEvento(int profesoresEvento_idProfesoresEvento) {
        ProfesoresEvento_idProfesoresEvento = profesoresEvento_idProfesoresEvento;
    }

    public int getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(int idEvento) {
        this.idEvento = idEvento;
    }

    public String getNombreProfesor() {
        return nombreProfesor;
    }

    public void setNombreProfesor(String nombreProfesor) {
        this.nombreProfesor = nombreProfesor;
    }

    public String getApellidoProfesor() {
        return apellidoProfesor;
    }

    public void setApellidoProfesor(String apellidoProfesor) {
        this.apellidoProfesor = apellidoProfesor;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
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
}
