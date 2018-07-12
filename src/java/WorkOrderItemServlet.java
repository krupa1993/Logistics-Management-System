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
@WebServlet(urlPatterns = {"/WorkOrderItemServlet"})
public class WorkOrderItemServlet extends HttpServlet {

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
        String path=null;
        PreparedStatement ps=null;
        Connection conn=logic.getConnection();
           // conn.createStatement();
             String workOrderNo=logic.checkNull(request,"hdn");
            System.out.println("workOrderNo::"+workOrderNo);
         

        try 
        {
            String itemno=logic.checkNull(request,"ItemNo");
            String workorderno=logic.checkNull(request,"hdnwrknum");
            System.out.println("workorderno::"+workorderno);
            String itemnm=logic.checkNull(request,"ItemName");
            String description=logic.checkNull(request,"Description");
            String quantity=logic.checkNull(request,"Quantity");
            String approximatecost=logic.checkNull(request,"ApproximateCost");
           
           ps=conn.prepareStatement("insert into workorderitem(ItemNo,WorkOrderNo,ItemName,Description,Quantity,ApproximateCost)values(?,?,?,?,?,?)");
           Enumeration en= request.getParameterNames();
            while(en.hasMoreElements())
            {
                String val=en.nextElement().toString();
                if(val.startsWith("chkbox"))
                {
                    String ind=val.substring("chkbox".length());
                    itemno=logic.checkNull(request,"ItemNo"+ind);
                    itemnm=logic.checkNull(request,"ItemName"+ind);
                    description=logic.checkNull(request,"Description"+ind);
                    quantity=logic.checkNull(request,"Quantity"+ind);
                    approximatecost=logic.checkNull(request,"ApproximateCost"+ind);
                    
                    ps.setString(1,itemno);
                    ps.setString(2,workOrderNo);
                    ps.setString(3,itemnm);
                    ps.setString(4,description);
                    ps.setString(5,quantity);
                    ps.setString(6,approximatecost);
                    ps.addBatch();
                }
            }
           int i[]= ps.executeBatch();
           // System.out.println("Array: "+i[0]);
            
            

                    if(i.length>=0)
                    {
                        out.println("Row inserted");
                        path="/Welocme_page.jsp";
                    }
                    else
                    {
                        path="/WorkOrderItem.jsp"; 
                        out.println("Sorry! Your data was not saved!");
                    }
           rd=request.getRequestDispatcher(path);
           rd.forward(request, response);
        }
        catch(Exception e)
        {
            System.out.println("in ex: "+e);
           
           try
           {
               Statement stmt=conn.createStatement();
               System.out.println("workOrderNo: "+workOrderNo);
               stmt.executeUpdate("delete from workorder where WorkOrderNo='"+workOrderNo.trim()+"'");
           }
           catch(Exception ex){System.out.println("in exception: "+ex);}
            
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
