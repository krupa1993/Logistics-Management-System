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
@WebServlet(urlPatterns = {"/StatusServlet"})
public class StatusServlet extends HttpServlet {

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
        RequestDispatcher rd=null;
        ResultSet rs=null;
        ResultSet rs1=null;
        PreparedStatement ps=null;
        PreparedStatement ps1=null;
        String path=null;
        String workorderno=null;
        ArrayList al = new ArrayList();
        ArrayList al1 = new ArrayList();
        System.out.println("In Status servlet");
        try 
        {
                Connection conn=logic.getConnection();
                conn.createStatement();
                
                String no=logic.checkNull(req,"no");
                System.out.println("No:"+no);
                
                ps=conn.prepareStatement("select WorkOrderNo,VendorName,DealerName,Status from workorder where wsno=?");
                ps.setString(1,no);
                rs=ps.executeQuery();
                while(rs.next())
                {
                    al.add(rs.getString("WorkOrderNo"));
                    al.add(rs.getString("VendorName"));
                    al.add(rs.getString("DealerName"));
                    al.add(rs.getString("Status"));
                    System.out.println("AL" + al);
                    workorderno=rs.getString("WorkOrderNo");
                }
              
                
                ps1=conn.prepareStatement("select ItemName,VehicleType,VehicleRegistrationNo,Quantity,Date,Status from generate_gatepass where WorkOrderNo=?");
                ps1.setString(1, workorderno);
                rs1=ps1.executeQuery();
                while(rs1.next())
                {
                    al1.add(rs1.getString("ItemName")+":"+rs1.getString("VehicleType")+":"+rs1.getString("VehicleRegistrationNo")+":"+rs1.getString("Quantity")+":"+rs1.getString("Date")+":"+rs1.getString("Status"));
                    System.out.println("AL" + al1);
                }
                out.println(al1); 
                path="/StatusInfo.jsp";
                req.setAttribute("data", al);
                req.setAttribute("data1", al1);
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
