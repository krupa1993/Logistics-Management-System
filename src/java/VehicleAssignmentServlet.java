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
@WebServlet(urlPatterns = {"/VehicleAssignmentServlet"})
public class VehicleAssignmentServlet extends HttpServlet {

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
        String path=null;
        PreparedStatement ps=null;
        String operation=null;
        ArrayList al=new ArrayList();
        System.out.println("In VehicleAssignmentservlet");
        try 
        {
            System.out.println("In VehicleAssignmentservlet try");
            Connection conn=logic.getConnection();
            conn.createStatement();
            
            operation=logic.checkNull(req,"hdn").trim();
            System.out.println("VehicleAssignmentservlet operation: "+operation);
            String workorderno=logic.checkNull(req,"workOrderNo");
            String itemname=logic.checkNull(req,"ItemName");
            String quantitytodispatch=logic.checkNull(req,"QuantityToDispatch");
            String serviceprovidername=logic.checkNull(req,"ServiceProviderName");
            String vehicleregistrationno=logic.checkNull(req,"VehicleRegistrationNo");
            if(operation!=null && operation.equalsIgnoreCase("edit"))
            {
                System.out.println("In VehicleAssignmentservlet if");
                ps=conn.prepareStatement("UPDATE vehicle_assignment SET QuantityToDispatch=?,ServiceProviderName=?,VehicleRegistrationNo=? WHERE WorkOrderNo=? AND VehicleRegistrationNo=?");
                ps.setString(1,quantitytodispatch);
                ps.setString(2,serviceprovidername);
                ps.setString(3,vehicleregistrationno);
                ps.setString(4,workorderno);
                ps.setString(5,vehicleregistrationno);
                ps.executeUpdate();
                System.out.println("after update");
                path="/VehicleAssignmentGrid.jsp";
            }
            else
            {
                System.out.println("In VehicleAssignmentservlet else");
                ps=conn.prepareStatement("insert into vehicle_assignment(WorkOrderNo,ItemName,QuantityToDispatch,ServiceProviderName,VehicleRegistrationNo)values(?,?,?,?,?)");
                ps.setString(1,workorderno);
                ps.setString(2,itemname);
                ps.setString(3,quantitytodispatch);
                ps.setString(4,serviceprovidername);
                ps.setString(5,vehicleregistrationno);
                int i=ps.executeUpdate();

                    if(i>0)
                    {
                        System.out.println("Row inserted");
                        if (req.getParameter("save")!=null)
                        {
                            path="/VehicleAssignment.jsp";
                        }
                    }
                    else
                    {
                        //path="/VehicleAssignmentGrid.jsp"; 
                        //System.out.println("Sorry!");
                    }
            
                    if(req.getParameter("cancel")!=null)
                    {
                        path="/VehicleAssignmentGrid.jsp";
                    }
                    /*else if (logic.checkNull(req,"save")!=null)
                    {
                        path="/VehicleAssignment.jsp";
                    }*/
                    else
                    {
                        System.out.println("No data");
                    }
            }
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
