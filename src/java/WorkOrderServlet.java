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
import java.util.Random;
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
@WebServlet(urlPatterns = {"/WorkOrderServlet"})
public class WorkOrderServlet extends HttpServlet {

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
        RequestDispatcher rd=null;
        ResultSet rs=null;
        ResultSet rs1=null;
        String path=null;
        String d=null;
        String v=null;
        String workordernum=logic.checkNull(request,"workorderno").trim();
        PreparedStatement ps=null;
        try 
        {
            Connection conn=logic.getConnection();
            conn.createStatement();
            //String workorderid=logic.checkNull(request,"workorderid");
            String workorderno=logic.checkNull(request,"hdnwrknum");
            String vendornm=logic.checkNull(request,"VendorName");
            String vendorloc=logic.checkNull(request,"vendorLocation");
            String dealernm=logic.checkNull(request,"DealerName");
            String dealerloc=logic.checkNull(request,"dealerLocation");
            String date=logic.checkNull(request,"date");
            
            Random r =new Random();
            int wsNo=r.nextInt(10000);
            
            ps=conn.prepareStatement("insert into workorder (WorkOrderNo,VendorName,VendorLocation,DealerName,DealerLocation,Date,Status,wsno)values(?,?,?,?,?,?,?,?)");
            ps.setString(1,workorderno);
            ps.setString(2,vendornm);
            ps.setString(3,vendorloc);
            ps.setString(4,dealernm);
            ps.setString(5,dealerloc);
            ps.setString(6,date);
            ps.setString(7,"In WareHouse");
            ps.setInt(8, wsNo);
            int i=ps.executeUpdate();
          //  String email[];
                    if(i>0)
                    {
                        out.println("Row inserted");
                        System.out.println("workorderno"+workorderno);
                        path="/WorkOrderItem.jsp?workorderno="+workorderno;
                        //fetch email id of dealer and vender store them in array 
                        ps=conn.prepareStatement("select EmailID from dealer_registration where UserName=?");
                        ps.setString(1,dealernm);
                        rs=ps.executeQuery();
                        while(rs.next())
                        {
                            d=rs.getString("EmailID");
                        }
                        ps=conn.prepareStatement("select EmailID from vendor_registration where UserName=?");
                        ps.setString(1,vendornm);
                        rs1=ps.executeQuery();
                        while(rs1.next())
                        {
                            v=rs1.getString("EmailID");
                        }
                        String email[]={d,v};
                        logic.mymail(email,wsNo);
                    }
                    else
                    {
                        path="/WorkOrder.jsp"; 
                        out.println("Sorry! Your data was not saved!");
                    }
           rd=request.getRequestDispatcher(path);
           rd.forward(request, response);
            
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
