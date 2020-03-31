/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.sql.Connection;

import java.sql.*;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import modelo.vo.CategoriaVO;
import modelo.vo.UsuarioVO;
import util.Conexion;
import static util.Conexion.openConStatic;
import util.ICrud;

/**
 *
 * @author JNGZN
 */
public class UsuarioDAO extends Conexion implements ICrud {

    private String idUsuario;
    private String nombres;
    private String apellidos;
    private String fechaNacimiento;
    private String correo;
    private String pass;
    private String cel;
    private String direccion;
    private String documento;

    Connection conn = null;
    PreparedStatement pstm = null;
    ResultSet rs = null;

    private boolean operacion = false;

    private static boolean opr = false;

    public UsuarioDAO() {
    }

    public UsuarioDAO(UsuarioVO UsuarioVO) {
        conn = this.openConexion();
        nombres = UsuarioVO.getNombres();
        apellidos = UsuarioVO.getApellidos();
        fechaNacimiento = UsuarioVO.getFecha();
        correo = UsuarioVO.getCorreo();
        pass = UsuarioVO.getPass();
        cel = UsuarioVO.getCel();
        direccion = UsuarioVO.getDireccion();
    }

    @Override
    public boolean insertar() {
        try {

            pstm = conn.prepareStatement("INSERT INTO USUARIO(nombres,"
                    + "apellidos,fechaNacimiento,correoUsuario,"
                    + "contraseñaUsuario,ROL_idRol,estado) VALUES(?,?,date(?),?,?,1,'activo')");

            pstm.setString(1, nombres);
            pstm.setString(2, apellidos);
            pstm.setString(3, fechaNacimiento);

            pstm.setString(4, correo);
            pstm.setString(5, pass);
            pstm.executeUpdate();
            conn = cerrarConexion();
            return true;

        } catch (Exception e) {
            System.out.print("Error al insertar cliente " + e.toString());
        }finally{
            try {
                if(conn!=null) conn.close();
                if(pstm!=null) pstm.close();
                if(rs!=null) rs.close();
            } catch (Exception e) {
            }
        }
        return false;
    }

    public boolean actualizar(String id) {
        try {
            pstm = conn.prepareStatement("UPDATE USUARIO SET nombres = ?,apellidos = ?, "
                    + "fechaNacimiento = ?,celular = ?,direccion = ? WHERE idUsuario= ?");
            pstm.setString(1, nombres);
            
           // pstm.setString(1, nombres);
            pstm.setString(2, apellidos);
            pstm.setString(3, fechaNacimiento);
            pstm.setString(4, cel);
            pstm.setString(5, direccion);
            //pstm.setString(6, pass);
            pstm.setString(6, id);

            pstm.executeUpdate();
            operacion = true;
            conn = cerrarConexion();

        } catch (SQLException | NumberFormatException e) {
            System.out.print("Error al actualizar " + e.toString());
        }finally{
            try {
                if(conn!=null) conn.close();
                if(pstm!=null) pstm.close();
                if(rs!=null) rs.close();
            } catch (Exception e) {
            }
        }
        return operacion;
    }

    @Override
    public boolean borrar() {
        try {
            pstm = conn.prepareStatement("DELETE FROM tabla WHERE sentencia = ?");

            pstm.executeUpdate();
            operacion = true;

        } catch (SQLException | NumberFormatException e) {
            System.out.print("Error al borrar el cliente " + e.toString());
        }
        return operacion;
    }

    public String ObtenerID() {
        idUsuario = null;
        try {
            conn = openConexion();
            pstm = conn.prepareStatement("selct idUsuario,ROL_idRol from usuario");
            rs = pstm.executeQuery();
            if (operacion) {
                idUsuario = rs.getString(1);
            }

        } catch (Exception e) {
            System.out.println("Error :" + e.toString());
        }finally{
            try {
                if(conn!=null) conn.close();
                if(pstm!=null) pstm.close();
                if(rs!=null) rs.close();
            } catch (Exception e) {
            }
        }
        return idUsuario;
    }

    public static UsuarioVO listarDatos(String id) {

        ArrayList<UsuarioVO> arrClienteVO = new ArrayList<>();
        UsuarioVO UsuarioVO = null;

        try {
            Connection conn = openConStatic();
            PreparedStatement pstm = conn.prepareStatement("SELECT nombres,"
                    + "apellidos,fechaNacimiento,correoUSUARIO,celular,direccion,"
                    + "DOCUMENTO_idDocumento FROM USUARIO where idUsuario = ?");
            pstm.setString(1, id);
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {

                UsuarioVO = new UsuarioVO(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7));

                       
                arrClienteVO.add(UsuarioVO);
            }

                if(conn!=null) conn.close();
                if(pstm!=null) pstm.close();
                if(rs!=null) rs.close();
          
            return UsuarioVO;

        } catch (Exception e) {
            System.out.println("Error  " + e.toString());
        }

        return null;
    }
    public static ArrayList<UsuarioVO> listarDatos() {

        ArrayList<UsuarioVO> arrClienteVO = new ArrayList<>();
        UsuarioVO UsuarioVO = null;

        try {
            Connection conn = openConStatic();
            PreparedStatement pstm = conn.prepareStatement("SELECT nombres,"
                    + "apellidos,fechaNacimiento,correoUSUARIO,celular,direccion,"
                    + "DOCUMENTO_idDocumento FROM USUARIO");
            
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {

               UsuarioVO = new UsuarioVO(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6),rs.getString(7));

                arrClienteVO.add(UsuarioVO);
            }

            
            
                if(conn!=null) conn.close();
                if(pstm!=null) pstm.close();
                if(rs!=null) rs.close();
            
        
            return arrClienteVO;

        } catch (Exception e) {
            System.out.println("Error  " + e.toString());
        }

        return null;
    }

    
    public  String privilegios(String id){
        String rol = "1";
        try {
            conn = openConexion();
            pstm = conn.prepareStatement("SELECT ROL_idRol FROM "
                    + "USUARIO WHERE idUsuario = ?");
            pstm.setString(1, id);
            rs = pstm.executeQuery();
            if (rs.next()) {
                rol= rs.getString(1);
            }
            if(conn!= null) conn.close();
            if(pstm!= null) pstm.close();
            if(rs!= null) rs.close();
        } catch (Exception e) {
            System.err.println("error: "+e.toString());
        }
        return rol;
    }
    
    
    
    public String iniciarSesion(String correo, String pass) {
        try {
            idUsuario = null;
            Connection conn = openConexion();
            PreparedStatement pstm = conn.prepareCall("call proc_loginUSU(?,?)");
            pstm.setString(1, correo);
            pstm.setString(2, pass);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                idUsuario = rs.getString(1) ;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
        }finally{
            try {
                if(conn!=null) conn.close();
                if(pstm!=null) pstm.close();
                if(rs!=null) rs.close();
            } catch (Exception e) {
            }
        }
        return idUsuario;
    }

    public static boolean validaUsuario(String correo) {

        CategoriaVO clientesVO = null;

        try {
            Connection conn = openConStatic();
            PreparedStatement pstm = conn.prepareStatement("SELECT * FROM USUARIO WHERE correoUsuario= ?");
            pstm.setString(1, correo);
            ResultSet rs = pstm.executeQuery();

            if (rs.next()) {
                opr = true;
            } else {
                opr = false;
            }
            
            
                if(conn!=null) conn.close();
                if(pstm!=null) pstm.close();
                if(rs!=null) rs.close();
            
        
        } catch (Exception e) {
            System.out.println("Error al validar cliente " + e.toString());
        }

        return opr;
    }

    @Override
    public boolean actualizar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
