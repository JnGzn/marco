/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.sql.*;
import java.text.DecimalFormat;
import java.util.ArrayList;
import modelo.vo.ActividadVO;
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

    public static ArrayList<String[]> consultaTOP(String opc, String nit) {
        ArrayList<String[]> arr = new ArrayList<>();
       
        String query = "";
        if (opc.equals("1")) {
            query = "SELECT categoria.tipoCategoria,fORMAT(noVentas/(SELECT SUM(noVentas) "
                    + "FROM actividad),2) * 100 AS PORCENTAJE FROM `actividad` INNER JOIN "
                    + "categoria ON categoria.idCategoria = actividad.fk_categoria WHERE "
                    + "actividad.EMPRESA_nit = ? ORDER BY noVentas DESC LIMIT 5";
        } else {
            query = "SELECT SUM(noVentas*precioActividad) FROM `actividad` where fk_empresa = ?";
        }
        try {
            Connection con = openConStatic();
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setString(1, nit);

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                 String[] devolucion = new  String[2];
                devolucion[0] = rs.getString(1);
                devolucion[1] = rs.getString(2);
                arr.add(devolucion);
            }
        } catch (Exception e) {
            System.out.println("err "+e.toString());
        }
        
        return arr;
    }

    public static String reportVerntas(String opc, String nit) {
        String query = "";
        if (opc.equals("1")) {
            query = "SELECT COUNT(*) FROM `actividad`WHERE noVentas>0 AND fk_empresa = ?";
        } else {
            query = "SELECT SUM(noVentas*precioActividad) FROM `actividad` where fk_empresa = ?";
        }
        try {
            Connection con = openConStatic();
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setString(1, nit);

            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                if (opc.equals("2")) {
                    DecimalFormat formateador = new DecimalFormat("###,###.##");
                    return formateador.format(Integer.parseInt(rs.getString(1)));
                }
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return "";
    }

    public boolean cargarImagen(String nit, String image) {
        try {
            System.out.println("fsdfdfsdf");
            conn = openConexion();
            pstm = conn.prepareStatement("UPDATE `empresa` SET logo = ? where nit = ?");
            pstm.setString(1, image);
            pstm.setString(2, nit);
            pstm.executeUpdate();

            if (conn != null) {
                conn.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (rs != null) {
                rs.close();
            }
            return true;
        } catch (Exception e) {
            System.out.println("error: " + e.toString());
        }
        return false;
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
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (pstm != null) {
                    pstm.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
            }
        }
        return idUsuario;
    }

    public boolean insertar(String logo) {
        try {
            pstm = conn.prepareStatement("INSERT into EMPRESA(nit,razonSocial,correoEmpresa,ROL_idRol,estado,pass,logo, noVentas)"
                    + " values(?,?,?,2,'activo',?,?,0)");

            pstm.setString(1, nit);
            pstm.setString(2, razonSocial);
            pstm.setString(3, correoEmpresa);
            pstm.setString(4, pass);
            pstm.setString(5, logo);

            pstm.executeUpdate();
            operacion = true;
            conn = cerrarConexion();
        } catch (SQLException e) {
            System.out.println("error! La empresa NO se Registro" + e.toString());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (pstm != null) {
                    pstm.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
            }
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
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (pstm != null) {
                    pstm.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
            }
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

            if (conn != null) {
                conn.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (rs != null) {
                rs.close();
            }

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
            PreparedStatement pstm = conn.prepareStatement("SELECT nit,razonSocial,correoEmpresa,logo FROM EMPRESA WHERE nit = ?");
            pstm.setString(1, nit);

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {

                empresaVO = new EmpresaVO(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(1));
                empresaVO.setLogo(rs.getString(4));
                //arrEmpVO.add(empresaVO);
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
            PreparedStatement pstm = conn.prepareStatement("SELECT nit,razonSocial,correoEmpresa,logo FROM EMPRESA");

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {

                empresaVO = new EmpresaVO(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(1));
                empresaVO.setLogo(rs.getString(4));
                arrEmpVO.add(empresaVO);
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

    @Override
    public boolean actualizar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean insertar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
