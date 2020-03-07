/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.sql.*;
import java.util.ArrayList;
import modelo.vo.EmpresaVO;
import util.Conexion;
import static util.Conexion.openConStatic;
import util.ICrud;

/**
 *
 * @author APRENDIZ
 */
public class EmpresaDAO extends Conexion implements ICrud {

    private String nit;
    private String razonSocial;
    private String correoEmpresa;
    private String pass;
    String idUsuario;
    Connection conn = null;
    PreparedStatement pstm = null;
    ResultSet rs = null;

    private boolean operacion = false;
    private static boolean opr = false;

    public EmpresaDAO() {

    }

    public EmpresaDAO(EmpresaVO EmpVO) {
        conn = this.openConexion();
        nit = EmpVO.getNit();
        razonSocial = EmpVO.getRazonSocial();
        correoEmpresa = EmpVO.getCorreoEmpresa();
        pass = EmpVO.getPass();

    }

    public String iniciarSesion(String correo, String pass) {
        try {
            
            idUsuario = null;
            Connection conn = openConexion();
            PreparedStatement pstm = conn.prepareStatement("SELECT nit FROM "
                    + "EMPRESA WHERE correoEmpresa = ? AND pass = ?");
            pstm.setString(1, correo);
            pstm.setString(2, pass);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                operacion = true;
                idUsuario = rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
        }
        return idUsuario;
    }

    @Override
    public boolean insertar() {
        try {

            pstm = conn.prepareStatement("INSERT into EMPRESA(nit,razonSocial,correoEmpresa,ROL_idRol,estado,pass)"
                    + " values(?,?,?,2,'activo',?)");

            pstm.setString(1, nit);
            pstm.setString(2, razonSocial);
            pstm.setString(3, correoEmpresa);
            pstm.setString(4, pass);

            pstm.executeUpdate();
            operacion = true;
            conn = cerrarConexion();
        } catch (SQLException e) {
            System.out.println("error! La empresa NO se Registro" + e.toString());
        }
        return operacion;
    }

    
    public boolean Actualizar(String nit) {
        try {

           
            pstm = conn.prepareStatement("UPDATE EMPRESA SET correoEmpresa = ?, razonSocial = ? "
                    + "WHERE nit=?");
            pstm.setString(1, correoEmpresa);
            pstm.setString(2, razonSocial);
            pstm.setString(3, nit);
            pstm.executeUpdate();
            operacion = true;

        } catch (SQLException | NumberFormatException e) {
            System.out.print("Error al actualizar " + e.toString());
        }
        return operacion;
    }

    @Override
    public boolean borrar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public static boolean validaEmpresa(String nombre) {

        EmpresaVO empVO = null;

        try {

            Connection conn = openConStatic();
            PreparedStatement pstm = conn.prepareStatement("SELECT * FROM EMPRESA WHERE nit= ?");
            pstm.setString(1, nombre);
            ResultSet rs = pstm.executeQuery();

            if (rs.next()) {
                opr = true;
            } else {
                opr = false;
            }

            conn.close();
        } catch (Exception e) {
            System.out.println("error!" + e.toString());
        }
        return opr;
    }

    public static EmpresaVO ListarDatos(String nit) {

        //ArrayList<EmpresaVO> arrEmpVO = new ArrayList<>();
        EmpresaVO empresaVO = null;

        try {
            Connection conn = openConStatic();
            PreparedStatement pstm = conn.prepareStatement("SELECT nit,razonSocial,correoEmpresa FROM EMPRESA WHERE nit = ?");
            pstm.setString(1, nit);

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {

                empresaVO = new EmpresaVO(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(1));

                //arrEmpVO.add(empresaVO);
            }

            return empresaVO;

        } catch (Exception e) {
            System.out.println("Error  " + e.toString());
        }

        return null;
    }
    public static ArrayList<EmpresaVO> ListarDatos() {

        ArrayList<EmpresaVO> arrEmpVO = new ArrayList<>();
        EmpresaVO empresaVO = null;

        try {
            Connection conn = openConStatic();
            PreparedStatement pstm = conn.prepareStatement("SELECT nit,razonSocial,correoEmpresa FROM EMPRESA");
           

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {

                empresaVO = new EmpresaVO(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(1));

                arrEmpVO.add(empresaVO);
            }

            return arrEmpVO;

        } catch (Exception e) {
            System.out.println("Error  " + e.toString());
        }

        return null;
    }
    @Override
    public boolean actualizar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
