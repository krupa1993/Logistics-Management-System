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
@WebServlet(urlPatterns = {"/FetchTransportExpenseServlet"})
public class FetchTransportExpenseServlet extends HttpServlet {

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
        PreparedStatement ps=null;
        ArrayList al = new ArrayList();
        ArrayList vr=new ArrayList();
        String query=null;
        Statement stmt=null;
        String wno=null;
        
        System.out.println("in FetchTrasnportExpenseServlet");
        
        try 
        {
            System.out.println("in FetchTrasnportExpenseServlet try");
            Connection con=logic.getConnection();
            con.createStatement();
            stmt=con.createStatement();
            query="select VendorName,WorkOrderNo,VehicleRegistrationNo,KiloMeter,Day from transport_expenses";
            rs=stmt.executeQuery(query);
                    while(rs.next())
                    {
                            al.add(rs.getString("VendorName"));
                            al.add(rs.getString("WorkOrderNo"));
                            al.add(rs.getString("VehicleRegistrationNo"));
                            al.add(rs.getString("KiloMeter"));
                            al.add(rs.getString("Day"));
                        }
                        out.println("AL" + al);
            req.setAttribute("data", al);
            path="/ViewEditData_ForTransportExpenses.jsp";
           
            /*String q="select TransportExpensesID,VehicleRegistrationNo from transport_expenses where WorkOrderNo=? order by VehicleRegistrationNo";
            ps=con.prepareStatement(q);
            ps.setString(1,wno);
            rs=ps.executeQuery();
             ArrayList sp=new ArrayList();
              while(rs.next())
              {
                  vr.add(rs.getString(2));
              }
              req.setAttribute("vr", vr);
            path="/ViewEditData_ForTransportExpenses.jsp";*/
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
