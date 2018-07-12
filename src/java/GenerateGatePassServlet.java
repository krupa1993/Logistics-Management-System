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
@WebServlet(urlPatterns = {"/GenerateGatePassServlet"})
public class GenerateGatePassServlet extends HttpServlet {

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
        PreparedStatement ps=null;
        String path=null;
        RequestDispatcher rd=null;
        ArrayList al = new ArrayList();
        try 
        {
            System.out.println("in GenerateGatePassServlet");
            Connection con=logic.getConnection();
            con.createStatement();
            
            String VendorName=logic.checkNull(req,"vendorName");
            String WorkOrderNo=logic.checkNull(req,"WorkOrderNo");
            String ItemName=logic.checkNull(req,"ItemName");
            String VehicleType=logic.checkNull(req,"vehicletype");
            String VehicleRegistrationNo=logic.checkNull(req,"vehicleregino");
            String Quantity=logic.checkNull(req,"quantity");
            String Date=logic.checkNull(req,"date");
           
            
            
            //ps=con.prepareStatement("select VendorName,WorkOrderNo,ItemName,VehicleType,VehicleRegistrationNo,Quantity,Date from generate_gatepass where UserName=?");
            ps=con.prepareStatement("insert into generate_gatepass (VendorName,WorkOrderNo,ItemName,VehicleType,VehicleRegistrationNo,Quantity,Date,Status)values(?,?,?,?,?,?,?,?)");
            ps.setString(1,VendorName);
            ps.setString(2,WorkOrderNo);
            ps.setString(3,ItemName);
            ps.setString(4,VehicleType);
            ps.setString(5,VehicleRegistrationNo);
            ps.setString(6,Quantity);
            ps.setString(7,Date);
            ps.setString(8,"Delivery In Process");
            
            Statement stmt=con.createStatement();
            stmt.executeUpdate("UPDATE workorder SET Status='Delivery In Process' WHERE WorkOrderNo='"+WorkOrderNo+"'");
            
            int i=ps.executeUpdate();

            if(i>0)
            {
                out.println("Row inserted");
                al.add(VendorName);
                al.add(WorkOrderNo);
                al.add(ItemName);
                al.add(VehicleType);
                al.add(VehicleRegistrationNo);
                al.add(Quantity);
                al.add(Date);
                System.out.println("AL" + al);
                path="/ViewData_GatePass.jsp";
            }
            else
            {
                path="/GenerateGatePass.jsp"; 
                out.println("Sorry!");
            }
            req.setAttribute("data", al);
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
