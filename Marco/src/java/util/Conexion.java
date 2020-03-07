/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author JNGZN
 */
public class Conexion {

    private final String URL = "jdbc:mysql://localhost:3306/MARCO";
    private final String USER = "root";
    private final String PASS = "";

    private Connection conn;

    private static final String URLSTC = "jdbc:mysql://localhost:3306/MARCO";
    private static final String USERSTC = "root";
    private static final String PASSSTC = "";
    private static Connection connstc;


    public Connection openConexion() {
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASS);
            System.out.println("Conexion exitosa");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error en la conexion " + e.toString());
        }
        return conn;
    }

    public static Connection openConStatic() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connstc = DriverManager.getConnection(URLSTC, USERSTC, PASSSTC);
            System.out.println("Conexion exitosa");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error en la conexion " + e.toString());
        }

        return connstc;
    }
    public Connection cerrarConexion()
    {
        try {
            conn.close();
            conn= null;
        } catch (Exception e) {
        }
        return conn;
        
    }
   

}
