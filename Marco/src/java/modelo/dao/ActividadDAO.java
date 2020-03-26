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
    private String descuento;

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

    public boolean AgregarActividad(String[] images) {
        try {

            pstm = conn.prepareStatement("INSERT INTO ACTIVIDAD"
                    + "(tituloActividad,fechaActividad,horaActividad,duracionActividad,"
                    + "cuposActividad,precioActividad,fk_empresa,EMPRESA_nit,"
                    + "fk_lugar,estadoActividad,fk_categoria,descripcion, descuento,"
                    + "img1,img2,img3,img4,img5)"
                    + " value(?,?,?,?,?,?,?,?,?,?,?,?,?"
                    + ",?,?,?,?,?)");

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
            pstm.setString(13, descuento);
            for (int i = 0; i < images.length; i++) {
                pstm.setString((i + 14), images[i]);
            }

            pstm.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            System.err.println("ERROR al agreagar actividad \n " + e.toString());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (pstm != null) {
                    pstm.close();
                }
                if (ts != null) {
                    ts.close();
                }
            } catch (Exception e) {
            }
        }
        return operacion;
    }

    public static ArrayList<ActividadVO> ListarDatos() {

        ArrayList<ActividadVO> arrEmpVO = new ArrayList<>();
        ActividadVO actVO = new ActividadVO();

        try {
            Connection conn = openConStatic();
            PreparedStatement pstm = conn.prepareStatement("SELECT "
                    + "idActividad"
                    + " FROM ACTIVIDAD");

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                actVO = new ActividadVO();

                actVO.setId(rs.getString(1));

                arrEmpVO.add(actVO);
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

    public boolean actualizarCupos(String id, int cant) {
        try {
            pstm = conn.prepareStatement("UPDATE ACTIVIDAD SET cuposActividad=? where idActividad=?");
            pstm.setInt(1, cant);
            pstm.setString(2, id);
            pstm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.err.println(e.toString());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (pstm != null) {
                    pstm.close();
                }
                if (ts != null) {
                    ts.close();
                }
            } catch (Exception e) {
            }
        }
        return false;
    }

    public boolean realizaReserva(ActividadVO actividad, String nom, String apll, String email,
            String doc, int cant, String user, String cal) {
        try {
            String idActiv = actividad.getId();
            pstm = conn.prepareStatement("INSERT INTO RESERVA("
                    + "nombreComprador, apellidoComprador,documentoComprador,"
                    + "correoComprador, calificacion, fk_usuario, fk_actividad,"
                    + "cantidadReservas, precioTotal)"
                    + " value(?,?,?,?,?,?,?,?,?)");
            pstm.setString(1, nom);
            pstm.setString(2, apll);
            pstm.setString(3, doc);
            pstm.setString(4, email);
            pstm.setString(5, cal);
            pstm.setString(6, user);
            pstm.setString(7, idActiv);
            pstm.setInt(8, cant);
            pstm.setDouble(9, cant * 3);
            pstm.executeUpdate();
            pstm.close();
            pstm = conn.prepareStatement("select cuposActividad from ACTIVIDAD where idActividad = ?");

            pstm.setString(1, idActiv);
            ts = pstm.executeQuery();
            if (ts.next()) {
                cant = Integer.parseInt(ts.getString(1)) - cant;
                if (this.actualizarCupos(idActiv, cant)) {
                    return true;
                }

            }

        } catch (Exception error) {
            System.out.println("error " + error.toString());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (pstm != null) {
                    pstm.close();
                }
                if (ts != null) {
                    ts.close();
                }
            } catch (Exception e) {
            }
        }
        return false;
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

                actVO.setEstado(rs.getString(9));
                actVO.setDescripcion(rs.getString(10));
                actVO.setDescuento(rs.getString(11));
                actVO.setIdEmpresa(rs.getString(12));
                actVO.setLugar(rs.getString(13));
                actVO.setCategoria(rs.getString(14));

                actVO.setImage1(rs.getString(15));
                actVO.setImage2(rs.getString(16));
                actVO.setImage3(rs.getString(17));
                actVO.setImage4(rs.getString(18));
            }
            String query
                    = "SELECT  cat.tipoCategoria, lug.direccionLugar, lug.zonaLugar "
                    + "FROM ACTIVIDAD as act "
                    + "INNER JOIN CATEGORIA as cat on act.fk_categoria = cat.idCategoria "
                    + "INNER JOIN LUGAR as lug on act.fk_lugar = lug.idLugar "
                    + "WHERE idActividad=?";
            pstm = conn.prepareStatement(query);
            pstm.setString(1, id);

            rs = pstm.executeQuery();
            if (rs.next()) {
                actVO.setCategoria(rs.getString(1));
                actVO.setDireccion(rs.getString(2));
                actVO.setZona(rs.getString(3));

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

            return actVO;

        } catch (Exception e) {
            System.out.println("Error  " + e.toString());
        }

        return null;
    }

    public static ArrayList<ActividadVO> ListarDatosNit(String id) {
        ArrayList<ActividadVO> array = new ArrayList<>();
        ActividadVO actVO = new ActividadVO();

        try {

            Connection conn = openConStatic();
            PreparedStatement pstm = conn.prepareStatement("SELECT "
                    + "idActividad"
                    + " FROM ACTIVIDAD where fk_empresa = ? ");
            pstm.setString(1, id);

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                actVO = new ActividadVO();

                actVO.setId(rs.getString(1));

                array.add(actVO);
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

            return array;

        } catch (Exception e) {
            System.out.println("Error  " + e.toString());
        }

        return null;
    }

    public static ArrayList<ActividadVO> ListarDatosID(String id) {
        ArrayList<ActividadVO> array = new ArrayList<>();
        ActividadVO actVO = new ActividadVO();

        try {

            Connection conn = openConStatic();
            PreparedStatement pstm = conn.prepareStatement("SELECT "
                    + "*"
                    + " FROM ACTIVIDAD where idActividad = ? ");
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

                actVO.setEstado(rs.getString(9));
                actVO.setDescripcion(rs.getString(10));
                actVO.setDescuento(rs.getString(11));
                actVO.setIdEmpresa(rs.getString(12));
                actVO.setLugar(rs.getString(13));
                actVO.setCategoria(rs.getString(14));

                actVO.setImage1(rs.getString(15));
                actVO.setImage2(rs.getString(16));
                actVO.setImage3(rs.getString(17));
                actVO.setImage4(rs.getString(18));

                array.add(actVO);
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

            return array;

        } catch (Exception e) {
            System.out.println("Error  " + e.toString());
        }

        return null;
    }

    public static ArrayList<ActividadVO> Filtar(String palabra) {
        if (palabra != null) {
            System.out.println("palabra " + palabra);
        } else {

            palabra = "a";
        }
        ArrayList<ActividadVO> array = new ArrayList<>();
        ActividadVO actVO = new ActividadVO();

        try {

            Connection conn = openConStatic();
            PreparedStatement pstm = conn.prepareStatement("SELECT "
                    + "idActividad"
                    + " FROM ACTIVIDAD "
                    + "where UPPER(tituloActividad) LIKE UPPER('%" + palabra + "%') "
                    + "or UPPER(descripcion) LIKE UPPER('%" + palabra + "%')");

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                
                actVO = new ActividadVO();

                actVO.setId(rs.getString(1));

                array.add(actVO);
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
            System.out.println("a "+array.size());
            return array;

        } catch (Exception e) {
            System.out.println("ErrorPuto  " + e.toString());
        }

        return null;
    }
}
