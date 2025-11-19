package Modelo;

import Enum.tipoUsuario;

/**
 *
 * @author ErnestoLpz_252663
 */
public class Usuario {
    private int idUsuario;
    private String nombre;
    private String correo;
    private String password;
    private String direccion;
    private String telefono;
    private tipoUsuario rol;
    
    //Constructores
    public Usuario() {    
    }

    public Usuario(int idUsuario, String nombre, String correo, String password, String direccion, String telefono, tipoUsuario rol) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.correo = correo;
        this.password = password;
        this.direccion = direccion;
        this.telefono = telefono;
        this.rol = rol;
    }

    // Getters
    public int getIdUsuario() {
        return idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public String getPassword() {
        return password;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public tipoUsuario getRol() {
        return rol;
    }

    //Setters
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setRol(tipoUsuario rol) {
        this.rol = rol;
    }
    
    //toString
    @Override
    public String toString() {
        return "Usuario{" + "idUsuario=" + idUsuario + ", nombre=" + nombre + ", correo=" + correo + ", password=" + password + ", direccion=" + direccion + ", telefono=" + telefono + ", rol=" + rol + '}';
    }
    
}
