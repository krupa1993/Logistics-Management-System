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
import java.sql.ResultSetMetaData;
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
@WebServlet(urlPatterns = {"/FetchVehicleAssignmentServlet"})
public class FetchVehicleAssignmentServlet extends HttpServlet {

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
        PreparedStatement ps=null;
        String path=null;
        String usernm=null;
        String query=null;
      
        //String operation=null;
        try 
        {
            System.out.println("in vehicleassignmentServlet");
            
            String workorderno=logic.checkNull(req,"wrkOrderNumber").trim();
            System.out.println("Fetch vehicleassignment servlet wrkOrderNumber: "+workorderno);
            
            String vehicleregino=logic.checkNull(req,"vehicleRegiNo");
            System.out.println("Fetch vehicleassignment servlet vehicleRegiNo: "+vehicleregino);
            
            Connection con=logic.getConnection();
            con.createStatement();
            
                ps=con.prepareStatement("select a.WorkOrderNo,a.ItemName,a.QuantityToDispatch,a.ServiceProviderName,a.VehicleRegistrationNo,d.VehicleType,d.VehicleRegistrationNo from vehicle_assignment a inner join vehicle_detail d on a.VehicleRegistrationNo=d.VehicleRegistrationNo where a.WorkOrderNo=? and a.VehicleRegistrationNo=?");
                ps.setString(1,workorderno);
                ps.setString(2,vehicleregino);
                rs=ps.executeQuery();
                ArrayList al = new ArrayList();
                ResultSetMetaData rsmd = rs.getMetaData();
                int columnsNumber = rsmd.getColumnCount();    
                String wno="";
                System.out.println("OUT");
                    while(rs.next())
                    {
                        System.out.println("In While");
                        for(int i=1;i<=columnsNumber;i++)
                        {
                            System.out.println("In For");
                           if(i==1)wno=rs.getString(i).trim();
                            al.add(rs.getString(i));
                        }
                        System.out.println("AL" + al);
                    }  
                    req.setAttribute("data", al);
             path="/ViewEditData_ForVehicleAssignmentGrid.jsp";
             
             String q="select VehicleAssignmentID,ServiceProviderName from vehicle_assignment where WorkOrderNo=? order by ServiceProviderName";
             ps=con.prepareStatement(q);
             ps.setString(1,wno.trim());
             rs=ps.executeQuery();
             ArrayList sp=new ArrayList();
              while(rs.next())
              {
                  sp.add(rs.getString(2));
              }
              req.setAttribute("sp", sp);
             path="/ViewEditData_ForVehicleAssignmentGrid.jsp";
            
             query="select * from serviceprovider_registration";
             ps=con.prepareStatement(query);
             rs=ps.executeQuery();
             ArrayList allSP=new ArrayList();
              while(rs.next())
              {
                  allSP.add(rs.getString(1));
              }
             req.setAttribute("allSP", allSP);
             path="/ViewEditData_ForVehicleAssignmentGrid.jsp";
             
            rd=req.getRequestDispatcher(path);
            out.println("sp: "+sp);
            out.println("allSP: "+allSP);
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
