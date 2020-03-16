/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.sql.*;

import java.util.*;
import modelo.vo.CategoriaVO;
import util.Conexion;
import static util.Conexion.openConStatic;
import util.ICrud;

/**
 *
 * @author JNGZN
 */
public class CategoriaDAO extends Conexion implements ICrud {

    private String nombreCategoria;

    Connection conn = null;
    PreparedStatement pstm = null;
    ResultSet ts = null;

    private boolean operacion = false;

    private static boolean opr = false;

    public CategoriaDAO() {
    }

    public CategoriaDAO(CategoriaVO clientesVO) {
        conn = this.openConexion();

        nombreCategoria = clientesVO.getNomCategoria();

    }

    public static ArrayList<CategoriaVO> ListarDatos() {

        ArrayList<CategoriaVO> arrEmpVO = new ArrayList<>();
        CategoriaVO empresaVO = null;

        try {
            Connection conn = openConStatic();
            PreparedStatement pstm = conn.prepareStatement("SELECT "
                    + "idCategoria,tipoCategoria,razonSociAL "
                    + "FROM CATEGORIA INNER JOIN EMPRESA "
                    + "ON CATEGORIA.EMPRESA_nit=EMPRESA.nit "
                    + "order by idCategoria");

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {

                empresaVO = new CategoriaVO(rs.getString(1), rs.getString(2),
                        rs.getString(3));

                arrEmpVO.add(empresaVO);
            }

                if(conn!=null) conn.close();
                if(pstm!=null) pstm.close();
                if(rs!=null) rs.close();
           
            return arrEmpVO;

        } catch (Exception e) {
            System.out.println("Error  " + e.toString());
        }

        return null;
    }

    @Override
    public boolean insertar() {
        return false;
    }

    public boolean insertarCategoria(String nit) {
        try {
            pstm = conn.prepareStatement("INSERT INTO "
                    + "CATEGORIA(tipoCategoria,EMPRESA_nit) VALUES(?,?)");
            pstm.setString(1, nombreCategoria);
            pstm.setString(2, nit);
            pstm.executeUpdate();

            operacion = true;
//"INSERT INTO `MARCO`.`CATEGORIA` (`idCategoria`, `tipoCategoria`) VALUES ('1', '00');"
        } catch (SQLException | NumberFormatException e) {
            System.out.print("Error al insertar cliente " + e.toString());
        }finally{
            try {
                if(conn!=null) conn.close();
                if(pstm!=null) pstm.close();
                if(ts!=null) ts.close();
            } catch (Exception e) {
            }
        }
        return operacion;
    }

    @Override
    public boolean actualizar() {

        return operacion;
    }

    @Override
    public boolean borrar() {

        return operacion;
    }

}
