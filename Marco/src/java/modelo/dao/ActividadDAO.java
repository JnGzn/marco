/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import modelo.vo.ActividadVO;
import modelo.vo.EmpresaVO;
import util.Conexion;

/**
 *
 * @author jngzn
 */
public class ActividadDAO extends Conexion {

    Connection conn = null;
    PreparedStatement pstm = null;
    ResultSet ts = null;

    private boolean operacion = false;
    private String id;
    private String titulo;
    private String descripcion;
    private String fecha;
    private String hora;
    private String duracion;
    private String cupos;
    private String precio;

    private String estado;
    private String idEmpresa;
    private String lugar;
    private String categoria;

    public ActividadDAO() {
    }

    public ActividadDAO(ActividadVO actividad) {
        conn = this.openConexion();

        id = actividad.getId();
        titulo = actividad.getTitulo();
        descripcion = actividad.getDescripcion();
        fecha = actividad.getFecha();

        hora = actividad.getHora();
        duracion = actividad.getDuracion();
        cupos = actividad.getCupos();
        precio = actividad.getPrecio();

        estado = actividad.getEstado();
        idEmpresa = actividad.getIdEmpresa();
        lugar = actividad.getLugar();
        categoria = actividad.getCategoria();
    }

    public boolean AgregarActividad() {
        try {

            pstm = conn.prepareStatement("INSERT INTO ACTIVIDAD"
                    + "(tituloActividad,fechaActividad,horaActividad,duracionActividad,"
                    + "cuposActividad,precioActividad,EMPRESA_idEmpresa,EMPRESA_nit,"
                    + "LUGAR_idLugar,estadoActividad,CATEGORIA_idCategoria,descripcion)"
                    + " value(?,?,?,?,?,?,?,?,?,?,?,?)");

            pstm.setString(1, titulo);
            pstm.setString(2, fecha);
            pstm.setString(3, hora);
            pstm.setString(4, duracion);
            pstm.setString(5, cupos);
            pstm.setString(6, precio);
            pstm.setString(7, idEmpresa);
            pstm.setString(8, idEmpresa);
            pstm.setString(9, lugar);
            pstm.setString(10, estado);
            pstm.setString(11, categoria);
            pstm.setString(12, descripcion);
            
            
            pstm.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            System.out.println("ERROR al agreagar actividad \n " + e.toString());
        }
        return operacion;
    }

    public static ArrayList<ActividadVO> ListarDatos() {

        ArrayList<ActividadVO> arrEmpVO = new ArrayList<>();
        ActividadVO actVO = new ActividadVO();

        try {
            Connection conn = openConStatic();
            PreparedStatement pstm = conn.prepareStatement("SELECT "
                    + "*"
                    + " FROM ACTIVIDAD");

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                actVO = new ActividadVO();
                actVO.setId(rs.getString(1));
                actVO.setTitulo(rs.getString(2));
                actVO.setFecha(rs.getString(3));
                actVO.setHora(rs.getString(4));
                actVO.setDuracion(rs.getString(5));
                actVO.setCupos(rs.getString(6));
                actVO.setPrecio(rs.getString(7));
                actVO.setIdEmpresa(rs.getString(9));
                actVO.setLugar(rs.getString(10));
                actVO.setEstado(rs.getString(11));
                actVO.setCategoria(rs.getString(12));
                 actVO.setDescripcion(rs.getString(13));

                arrEmpVO.add(actVO);
            }

            return arrEmpVO;

        } catch (Exception e) {
            System.out.println("Error  " + e.toString());
        }

        return null;
    }
    
    
    public static ActividadVO ListarDatos(String id) {

        
        ActividadVO actVO = new ActividadVO();

        try {
            Connection conn = openConStatic();
            PreparedStatement pstm = conn.prepareStatement("SELECT "
                    + "*"
                    + " FROM ACTIVIDAD where idActividad = ?");
            pstm.setString(1, id);

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                actVO = new ActividadVO();
                actVO.setId(rs.getString(1));
                actVO.setTitulo(rs.getString(2));
                actVO.setFecha(rs.getString(3));
                actVO.setHora(rs.getString(4));
                actVO.setDuracion(rs.getString(5));
                actVO.setCupos(rs.getString(6));
                actVO.setPrecio(rs.getString(7));
                actVO.setIdEmpresa(rs.getString(9));
                actVO.setLugar(rs.getString(10));
                actVO.setEstado(rs.getString(11));
                actVO.setCategoria(rs.getString(12));
                 actVO.setDescripcion(rs.getString(13));

                
            }

            return actVO;

        } catch (Exception e) {
            System.out.println("Error  " + e.toString());
        }

        return null;
    }

}
