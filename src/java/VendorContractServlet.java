/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import functions.logic;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ronakrana
 */
@WebServlet(urlPatterns = {"/VendorContractServlet"})
public class VendorContractServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        String path=null;
        RequestDispatcher rd=null;
        ResultSet rs=null;
        ArrayList vendorName = new ArrayList();
        ArrayList dispatchCharge = new ArrayList();
        ArrayList warehouseCharge = new ArrayList();
        ArrayList extraCharge = new ArrayList();
        String query=null;
        Statement stmt=null;
        String id=null;
        String name=null;
        String unit=null;
        
        System.out.println("in VendorContractServlet");
        
        try 
        {
            System.out.println("in VendorContractServlet try");
            Connection con=logic.getConnection();
            con.createStatement();
            stmt=con.createStatement();
            query="select VendorID,UserName from vendor_registration order by UserName";
            rs=stmt.executeQuery(query);
            while(rs.next())
            {
                    id=rs.getString("VendorID").toString();
                    name=rs.getString("UserName").toString();
                    vendorName.add(id+":"+name);
            }
                out.println(vendorName);
                
            query="select RuleID,RuleName,Unit from rule where Type='2' and RuleType='DC'";
            stmt=con.createStatement();
            rs=stmt.executeQuery(query);
            while(rs.next())
            {
                    id=rs.getString("RuleID").toString();
                    name=rs.getString("RuleName").toString();
                    unit=rs.getString("Unit").toString();
                    dispatchCharge.add(name+":"+unit+":"+id);
            }
                out.println(dispatchCharge);
                
            query="select RuleID,RuleName,Unit from rule where Type='2' and RuleType='WC'";
            stmt=con.createStatement();
            rs=stmt.executeQuery(query);
            while(rs.next())
            {
                    id=rs.getString("RuleID").toString();
                    name=rs.getString("RuleName").toString();
                    unit=rs.getString("Unit").toString();
                    warehouseCharge.add(name+":"+unit+":"+id);
            }
                out.println(warehouseCharge);
                
            query="select RuleID,RuleName,Unit from rule where Type='2' and RuleType='EC'";
            stmt=con.createStatement();
            rs=stmt.executeQuery(query);
            while(rs.next())
            {
                    id=rs.getString("RuleID").toString();
                    name=rs.getString("RuleName").toString();
                    unit=rs.getString("Unit").toString();
                    extraCharge.add(name+":"+unit+":"+id);
            }
                out.println(extraCharge);
                
            req.setAttribute("vendorNamedata", vendorName);
            req.setAttribute("dispatchChargedata", dispatchCharge);
            req.setAttribute("warehouseChargedata", warehouseCharge);
            req.setAttribute("extraChargedata", extraCharge);
            path="/VendorContract.jsp";
            rd=req.getRequestDispatcher(path);
            rd.forward(req, res);    
        }
        catch(Exception e)
        {
            out.println(e);
        }
        finally
        {            
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
