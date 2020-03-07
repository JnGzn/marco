/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.vo;


public class LugarVO {

    private String idLugar;
    private String direccionLugar;
    private String zonaLugar;
    private String aforoLugar;
    private String idEmp;

    public LugarVO(String idLugar, String direccionLugar, String zonaLugar, String aforoLugar) {
        this.idLugar = idLugar;
        this.direccionLugar = direccionLugar;
        this.zonaLugar = zonaLugar;
        this.aforoLugar = aforoLugar;
    }

    public LugarVO(String idLugar, String direccionLugar, String zonaLugar, String aforoLugar, String idEmp) {
        this.idLugar = idLugar;
        this.direccionLugar = direccionLugar;
        this.zonaLugar = zonaLugar;
        this.aforoLugar = aforoLugar;
        this.idEmp = idEmp;
    }

    public String getIdEmp() {
        return idEmp;
    }

    public void setIdEmp(String idEmp) {
        this.idEmp = idEmp;
    }
    
    
    
    
    public String getIdLugar() {
        return idLugar;
    }

    public void setIdLugar(String idLugar) {
        this.idLugar = idLugar;
    }

    public String getDireccionLugar() {
        return direccionLugar;
    }

    public void setDireccionLugar(String direccionLugar) {
        this.direccionLugar = direccionLugar;
    }

    public String getZonaLugar() {
        return zonaLugar;
    }

    public void setZonaLugar(String zonaLugar) {
        this.zonaLugar = zonaLugar;
    }

    public String getAforoLugar() {
        return aforoLugar;
    }

    public void setAforoLugar(String aforoLugar) {
        this.aforoLugar = aforoLugar;
    }

}
