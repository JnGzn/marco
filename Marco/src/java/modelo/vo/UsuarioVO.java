/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.vo;

//import java.sql.Date;
import java.util.Date;

public class UsuarioVO {

    public UsuarioVO() {

    }
    private String idUsuario;
    private String nombres;
    private String apellidos;
    private String fecha;
    private String correo;
    private String pass;
    private String cel;
    private String direccion;
    private String documento;

    public UsuarioVO(String nombres, String idUsuario) {
        this.nombres = nombres;
        this.idUsuario = idUsuario;
    }

    public UsuarioVO(String pass) {
        this.pass = pass;
    }
//constructor completo
    public UsuarioVO(String nombres, String apellidos, String fecha, String correo, String pass, String cel, String direccion,String documento) {
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.fecha = fecha;
        this.correo = correo;
        this.pass = pass;
        this.cel = cel;
        this.direccion = direccion;
        this.documento = documento;
    }

    public UsuarioVO(String nombres, String apellidos, String fecha, String correo, String cel, String direccion, String documento) {
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.fecha = fecha;
        this.correo = correo;
        this.cel = cel;
        this.direccion = direccion;
        this.documento = documento;
    }


    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getPass() {
        return pass;
    }

    public String getCel() {
        return cel;
    }

    public void setCel(String cel) {
        this.cel = cel;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

}
