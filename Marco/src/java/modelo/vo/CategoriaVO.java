/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.vo;


public class CategoriaVO {
    
  private String idCategoria;
    private String nomCategoria;
  
    private String idEMCategoria;

    public CategoriaVO(String idCategoria, String nomCategoria, String idEMCategoria) {
        this.idCategoria = idCategoria;
        this.nomCategoria = nomCategoria;
        this.idEMCategoria = idEMCategoria;
    }

    public String getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(String idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getIdEMCategoria() {
        return idEMCategoria;
    }

    public void setIdEMCategoria(String idEMCategoria) {
        this.idEMCategoria = idEMCategoria;
    }
    

    public CategoriaVO() {
    }

    public CategoriaVO(String categoria) {
        this.nomCategoria = categoria;
    }

    public String getNomCategoria() {
        return nomCategoria;
    }

    public void setNomCategoria(String nomCategoria) {
        this.nomCategoria = nomCategoria;
    }
    
    
    

  
}

