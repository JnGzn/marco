/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.sql.*;
import java.util.ArrayList;
import modelo.vo.CategoriaVO;
import modelo.vo.LugarVO;

import util.Conexion;
import static util.Conexion.openConStatic;
import util.ICrud;

/**
 *
 * @author USER
 */
public class LugarDAO extends Conexion implements ICrud {
    
    private Connection conexion = null;
    private PreparedStatement puente = null;
    private ResultSet mensajero = null;
    private boolean operacion = false;
    private String idLugar = "";
    private String direccionLugar = "";
    private String zonaLugar = "";
    private String aforoLugar = "";
    
    public LugarDAO(LugarVO sitioVO) {
        
        super();
        
        try {
            
            conexion = this.openConexion();
            //puente = conexion.createStatement();

            idLugar = sitioVO.getIdLugar();
            direccionLugar = sitioVO.getDireccionLugar();
            zonaLugar = sitioVO.getZonaLugar();
            aforoLugar = sitioVO.getAforoLugar();
            
        } catch (Exception e) {
            System.out.println("error!" + e.toString());
        }
        
    }
    
    public LugarDAO() {
    }
    
    public boolean AgregarRegistro(String id) {
        
        try {
            puente = conexion.prepareStatement("INSERT into LUGAR"
                    + "(direccionLugar,zonaLugar,aforoLugar,EMPRESA_nit)"
                    + "values(?,?,?,?)");
            puente.setString(1, direccionLugar);
            puente.setString(2, zonaLugar);
            puente.setString(3, aforoLugar);
            puente.setString(4, id);
            puente.executeUpdate();
            
            operacion = true;
            
        } catch (Exception e) {
            System.out.println("error!" + e.toString());
        } finally {
            try {
                if (conexion != null) {
                    conexion.close();
                }
                if (puente != null) {
                    puente.close();
                }
                if (mensajero != null) {
                    mensajero.close();
                }
            } catch (Exception e) {
            }
        }
        return operacion;
    }
    
    public boolean ActualizarRegistro() {
        try {
            
            puente.executeUpdate("UPDATE lugar set direccionLugar = '" + direccionLugar + "','" + zonaLugar + "'"
                    + "'" + aforoLugar + "' where idLugar = '" + idLugar + "'");
            
            operacion = true;
        } catch (Exception e) {
            System.out.println("error!" + e.toString());
        } finally {
            try {
                if (conexion != null) {
                    conexion.close();
                }
                if (puente != null) {
                    puente.close();
                }
                if (mensajero != null) {
                    mensajero.close();
                }
            } catch (Exception e) {
            }
        }
        return operacion;
    }
    
    public boolean EliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
    public boolean insertar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
    public boolean actualizar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
    public boolean borrar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public static ArrayList<LugarVO> ListarDatos() {
        
        ArrayList<LugarVO> arrEmpVO = new ArrayList<>();
        LugarVO LugarVO = null;
        
        try {
            Connection conn = openConStatic();
            PreparedStatement pstm = conn.prepareStatement("SELECT "
                    + "idLugar,direccionLugar,zonaLugar,aforoLugar,razonSocial "
                    + "FROM LUGAR INNER JOIN EMPRESA "
                    + "ON LUGAR.EMPRESA_nit=EMPRESA.nit "
                    + "order by idLugar");
            
            ResultSet rs = pstm.executeQuery();
            
            while (rs.next()) {
                
                LugarVO = new LugarVO(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5));
                
                arrEmpVO.add(LugarVO);
            }
            
            if (conn != null) {
                conn.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (rs != null) {
                rs.close();
            }
            
            return arrEmpVO;
            
        } catch (Exception e) {
            System.out.println("Error  " + e.toString());
        }
        
        return null;
    }
    
    public static ArrayList<LugarVO> ListarDatos(String nit) {
        
        ArrayList<LugarVO> arrEmpVO = new ArrayList<>();
        LugarVO LugarVO = null;
        
        try {
            Connection conn = openConStatic();
            PreparedStatement pstm = conn.prepareStatement("SELECT "
                    + "idLugar,direccionLugar,zonaLugar,aforoLugar,razonSocial "
                    + "FROM LUGAR INNER JOIN EMPRESA "
                    + "ON LUGAR.EMPRESA_nit=EMPRESA.nit "
                    + "where LUGAR.EMPRESA_nit = ?"
                    + "order by idLugar");
            pstm.setString(1, nit);
            ResultSet rs = pstm.executeQuery();
            
            while (rs.next()) {
                
                LugarVO = new LugarVO(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5));
                
                arrEmpVO.add(LugarVO);
            }
            
            if (conn != null) {
                conn.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (rs != null) {
                rs.close();
            }
            
            return arrEmpVO;
            
        } catch (Exception e) {
            System.out.println("Error  " + e.toString());
        }
        
        return null;
    }
}
