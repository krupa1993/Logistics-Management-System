/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import functions.logic;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Enumeration;
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
@WebServlet(urlPatterns = {"/SaveVendorContractServlet"})
public class SaveVendorContractServlet extends HttpServlet {

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
        String path=null;
        PreparedStatement ps=null;
        RequestDispatcher rd=null;
        ResultSet rs=null;
        String query=null;
        Statement stmt=null;
        try 
        {
            Connection conn=logic.getConnection();
            //String RuleID=logic.checkNull(request, "type").trim();
            //String RuleValue=logic.checkNull(request, "name").trim();
            ps=conn.prepareStatement("INSERT INTO assign_rule(RuleID,RuleValue,ContractID) VALUES(?,?,?)");
            Enumeration e=request.getParameterNames();
            String element=null;
            String elementvalue=null;
            String ruleValue=null;
            String index=null;
            String contractId=null;
            String vendorId=null;
            
            while(e.hasMoreElements())
            {
                element=e.nextElement().toString().trim();
                
                if(element.contains("chk"))
                {
                    elementvalue=logic.checkNull(request, element);
                    System.out.println("elementvalue "+elementvalue);
                    if(elementvalue.equalsIgnoreCase("on"))
                    {
                       index=element.substring("chk".length());
                       out.println("ruleid= "+index);
                       
                       ruleValue=logic.checkNull(request,"txt"+index);
                       out.println("ruleValue= "+ruleValue);
                       
                       contractId=logic.checkNull(request,"hdn"+index);
                       out.println("contractId= "+contractId);
                       
                       vendorId=logic.checkNull(request, "vendornm");
                       out.println("vendorId::"+vendorId);
                       
                       ps.setString(1, contractId);
                       ps.setString(2, ruleValue);
                       ps.setString(3, vendorId);
                       ps.addBatch();
                    }
                    ps.executeBatch();
                }
            }
            
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
