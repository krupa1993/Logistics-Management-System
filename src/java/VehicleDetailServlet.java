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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ronakrana
 */
@WebServlet(urlPatterns = {"/VehicleDetailServlet"})
public class VehicleDetailServlet extends HttpServlet {

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
     
        try 
        {
            System.out.println("InVehicleDetailservlet try");
            HttpSession s=req.getSession(false);
            HttpSession s1=req.getSession(false);
            Connection conn=logic.getConnection();
            conn.createStatement();
            
            operation=logic.checkNull(req,"hdn").trim();
            System.out.println("VehicleDetailservlet operation: "+operation);
            
            System.out.println("VehicleDetailservlet type::"+s.getAttribute("userType"));
            String type=s.getAttribute("userType").toString().trim();
            
            System.out.println("VehicleDetailservlet Type:"+type);
            
                 
            String vehicletype=logic.checkNull(req,"nm1");
            String vehicleregi_no=logic.checkNull(req,"nm2");
            String permitno=logic.checkNull(req,"nm3");
            String permitstate=logic.checkNull(req,"nm4");
            String serviceproviderid=logic.checkNull(req,"nm5");
            String serviceprovidername=logic.checkNull(req,"ServiceProviderName");
            String capacity=logic.checkNull(req,"nm6");
           
            if(operation!=null && operation.equalsIgnoreCase("edit"))
            {
                System.out.println("In VehicleDetailservlet if");
                ps=conn.prepareStatement("UPDATE vehicle_detail SET VehicleType=?,VehicleRegistrationNo=?,PermitNo=?,PermitState=?,ServiceProviderID=?,ServiceProviderName=?,Capacity=? WHERE ServiceProviderName=?");
                ps.setString(1,vehicletype);
                ps.setString(2,vehicleregi_no);
                ps.setString(3,permitno);
                ps.setString(4,permitstate);
                ps.setString(5,serviceproviderid);
                ps.setString(6,serviceprovidername);
                ps.setString(7,capacity);
                ps.setString(8,serviceprovidername);
                ps.executeUpdate();
                System.out.println("after update");
                path="/LocationGrid.jsp";
            }
            else
            {
                System.out.println("In VehicleDetailservlet else");
                ps=conn.prepareStatement("insert into vehicle_detail (VehicleType,VehicleRegistrationNo,PermitNo,PermitState,ServiceProviderID,ServiceProviderName,Capacity)values(?,?,?,?,?,?,?)");
                ps.setString(1,vehicletype);
                ps.setString(2,vehicleregi_no);
                ps.setString(3,permitno);
                ps.setString(4,permitstate);
                ps.setString(5,serviceproviderid);
                ps.setString(6,serviceprovidername);
                ps.setString(7,capacity);
                int i=ps.executeUpdate();

                    if(i>0)
                    {
                        System.out.println("Row inserted");
                        path="/LocationGrid.jsp";
                    }
                    else
                    {
                        path="/Location.jsp"; 
                        System.out.println("Sorry!");
                    }
            }
            //s1.setAttribute("typeforgrid","2");
            //s1.setAttribute("data",al);
            rd=req.getRequestDispatcher(path);
            rd.forward(req, res);
        } 
        catch(Exception e)
        {
            System.out.println(e);
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
