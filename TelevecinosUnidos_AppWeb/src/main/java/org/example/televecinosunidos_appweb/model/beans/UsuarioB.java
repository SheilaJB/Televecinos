package org.example.televecinosunidos_appweb.model.beans;

public class UsuarioB {
    private int idUsuario;
    private String nombre;
    private String apellido;
    private String dni;
    private String direccion;
    private String correo;
    private String contrasenia;
    private int urbanizacion_idUrbanizacion;
    private String urbanizacionString;//para tablas pequeñas !
    private int tipoCoordinador_idTipoCoordinador;
    private int asistencia;
    private int PreguntasFrecuentes_idTable2;
    private int idRol;
    private String rolStr;
    private int isBan;
    private int primerIngreso;

    public int getPrimerIngreso() {
        return primerIngreso;
    }

    public void setPrimerIngreso(int primerIngreso) {
        this.primerIngreso = primerIngreso;
    }

    public String getRolStr() {
        return rolStr;
    }

    public void setRolStr(String rolStr) {
        this.rolStr = rolStr;
    }

    public String getUrbanizacionString() {
        return urbanizacionString;
    }

    public void setUrbanizacionString(String urbanizacionString) {
        this.urbanizacionString = urbanizacionString;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getAsistencia() {
        return asistencia;
    }

    public void setAsistencia(int asistencia) {
        this.asistencia = asistencia;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIsBan() {
        return isBan;
    }

    public void setIsBan(int isBan) {
        this.isBan = isBan;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getPreguntasFrecuentes_idTable2() {
        return PreguntasFrecuentes_idTable2;
    }

    public void setPreguntasFrecuentes_idTable2(int preguntasFrecuentes_idTable2) {
        PreguntasFrecuentes_idTable2 = preguntasFrecuentes_idTable2;
    }

    public int getTipoCoordinador_idTipoCoordinador() {
        return tipoCoordinador_idTipoCoordinador;
    }

    public void setTipoCoordinador_idTipoCoordinador(int tipoCoordinador_idTipoCoordinador) {
        this.tipoCoordinador_idTipoCoordinador = tipoCoordinador_idTipoCoordinador;
    }

    public int getUrbanizacion_idUrbanizacion() {
        return urbanizacion_idUrbanizacion;
    }

    public void setUrbanizacion_idUrbanizacion(int urbanizacion_idUrbanizacion) {
        this.urbanizacion_idUrbanizacion = urbanizacion_idUrbanizacion;
    }
}
