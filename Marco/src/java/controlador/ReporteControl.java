/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.ReporteDAO;
import modelo.vo.ActividadVO;

/**
 *
 * @author USER
 */
@WebServlet(name = "pdf", urlPatterns = {"/pdf"})
public class ReporteControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf");
        OutputStream out = response.getOutputStream();
     
        String inicio = request.getParameter("txtFechaIncio");
        String fin = request.getParameter("txtFechaFin");
        String emp = request.getParameter("idEmp");
        System.out.println("xxxxxxxxx" +emp);
        try {

            try {
                Document documento = new Document();
                PdfWriter.getInstance(documento, out);

                documento.open();

                Image img = Image.getInstance("C:/Users/Usuario/Desktop/marco/Marco/web/img/logo.png");
                img.setAlignment(Element.HEADER);
                img.scaleToFit(200, 200);
                documento.add(img);

                Paragraph par1 = new Paragraph();
                par1.add(new Phrase(Chunk.NEWLINE));
                Font fonttitulo = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD, BaseColor.BLUE);
                par1.add(new Phrase("Reporte de Actividades", fonttitulo));
                par1.setAlignment(Element.ALIGN_CENTER);
                par1.add(new Phrase(Chunk.NEWLINE));
                par1.add(new Phrase(Chunk.NEWLINE));
                documento.add(par1);

                Paragraph par2 = new Paragraph();
                Font fontdesc = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
                par2.add(new Phrase("Actividades generadas durante el mes correspondiente para las fechas: " + inicio +" - " + fin, fontdesc));
                par2.setAlignment(Element.ALIGN_JUSTIFIED);
                par2.add(new Phrase(Chunk.NEWLINE));
                par2.add(new Phrase(Chunk.NEWLINE));
                documento.add(par2);

                PdfPTable tabla = new PdfPTable(4);
                PdfPCell c1 = new PdfPCell(new Paragraph("Codigo", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.RED)));
                PdfPCell c2 = new PdfPCell(new Paragraph("titulo", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.RED)));
                PdfPCell c3 = new PdfPCell(new Paragraph("numero ventas", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.RED)));

                tabla.addCell(c1);
                tabla.addCell(c2);
                tabla.addCell(c3);
               
                System.out.println("empres "+ emp);
                for (ActividadVO report : ReporteDAO.obtenerVentasPorActivdad(inicio, fin, emp)) {
                    tabla.addCell(report.getId());
                    tabla.addCell(report.getTitulo());
                    tabla.addCell(report.getNoVentas());
                   
                }

                documento.add(tabla);

                documento.close();

            } catch (Exception e) {
                System.out.println("error " +e.toString());
            }

        } catch (Exception e) {
             System.out.println("error " +e.toString());
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
