/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import modelo.vo.ActividadVO;
import util.Conexion;

/**
 *
 * @author Usuario
 */
public class ReporteDAO extends Conexion {

    public static ArrayList<ActividadVO> obtenerVentasPorActivdad(String inicio, String fin, String nit) {
        ArrayList<ActividadVO> arrVentas = new ArrayList<>();
        try {
            Connection con = openConStatic();
            PreparedStatement st;
            ResultSet rs;

            st = con.prepareStatement("call proc_reportVentasActividad(?,?,?)");
            st.setString(1, inicio);
            st.setString(2, fin);
            st.setString(3, nit);
            rs = st.executeQuery();
            while (rs.next()) {
                ActividadVO activo = new ActividadVO();
                activo.setId(rs.getString(1));
                activo.setTitulo(rs.getString(2));
                activo.setNoVentas(rs.getString(3));
                arrVentas.add(activo);

            }
            if (con!=null) con.close();
            if (rs!=null) rs.close();
            if (st!=null) st.close();
            
        } catch (Exception e) {
            System.out.println("error en reporte \n" + e.toString());
        }

        return arrVentas;
    }
}