/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import functions.logic;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ronakrana
 */
@WebServlet(urlPatterns = {"/reportVendor"})
public class reportVendor extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
          String uname=logic.checkNull(request, "txtvname");
          Connection con=logic.getConnection();
           HashMap parameterMap = new HashMap();
            //parameterMap.put("rtitle", "Report Title Here");//sending the report title as a parameter.
            parameterMap.put("vendorname","nisha");
            Report rpt = new Report(parameterMap, con);
            rpt.setReportName("VendorReport"); //productlist is the name of my jasper file.
                      String wrkorderno="w2";
          /*  parameterMap.put("username","foram");
            parameterMap.put("mobileno","2314");
            parameterMap.put("address","gngr");
            parameterMap.put("city","hj");
            parameterMap.put("state","jg");
            parameterMap.put("invoiceno","7686");
            parameterMap.put("wrkorderno",wrkorderno);
            parameterMap.put("currency","86");
            parameterMap.put("km","575");
            parameterMap.put("days","3");
            parameterMap.put("dieselcharges","388");
            parameterMap.put("extracharges","456");
            parameterMap.put("subtotal","886");
            parameterMap.put("salestax","578");
            parameterMap.put("total","4777");
            parameterMap.put("wno",wrkorderno);
          */
            //Report rpt = new Report(parameterMap, con);
            rpt.setReportName("report2"); //productlist is the name of my jasper file.
          
           rpt.callReport();
            //rpt.fl();
          
        } 
        catch(Exception e){out.println(e);}
        finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
