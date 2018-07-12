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
@WebServlet(urlPatterns = {"/GenerateWorkOrderNoServlet"})
public class GenerateWorkOrderNoServlet extends HttpServlet {

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
        Statement stmt=null;
        ResultSet rs=null;
        String query=null;
        String workordernum=null;
        String podnum=null;
        String WorkOrderNo=logic.checkNull(request,"WorkOrderNo");
        int wrkorderno=0;
        int podno=0;
        String workordernum_W=null;
        String podnum_POD=null;
        String val=null;
        String generateno=logic.checkNull(request,"generateNo");
        int num=0;
        try 
        {
            Connection conn=logic.getConnection();
            stmt=conn.createStatement();
            if(generateno.equalsIgnoreCase("1"))
            {
                query=("SELECT MAX(WorkOrderID) w FROM workorder");
                rs=stmt.executeQuery(query);
                if(rs.next())
                {
                            if(rs.getString("w")!=null)
                            {
                                System.out.println("in GenerateWorkOrderNoServlet iffff");
                                workordernum=rs.getString("w");
                                val=workordernum;//.substring(workordernum.indexOf("W")+1);
                                System.out.println("val::"+val);
                                num=Integer.parseInt(val);
                                num=num+1;
                                workordernum_W="W"+num;
                            }
                            else
                            {

                                System.out.println("in GenerateWorkOrderNoServlet else");
                                wrkorderno=1;
                                workordernum_W="W"+wrkorderno;
                            }
                            System.out.println("wrkno"+num);
                            path="/WorkOrder.jsp?generateNo=1&workorderno="+workordernum_W;
                    }

               }
               else if(generateno.equalsIgnoreCase("2"))
               {
                        query=("SELECT MAX(POD_ID) POD FROM POD");
                        rs=stmt.executeQuery(query);
                        if(rs.next())
                        {
                            if(rs.getString("POD")!=null)
                            {
                                System.out.println("in GenerateWorkOrderNoServlet  For POD iffff");
                                podnum=rs.getString("POD");
                                System.out.println("podnum::"+podnum);
                                if(podnum.length()>0)
                                {
                                val=podnum;//podnum.substring("pod".length());
                                System.out.println("val::"+val);
                                num=Integer.parseInt(val);
                                num=num+1;
                                podnum_POD="POD"+num;
                                }
                                else
                                {
                                    podno=1;
                                    podnum_POD="POD"+podno;
                                }
                                
                             }
                                else
                                {

                                    System.out.println("in GeneratePODServlet else");
                                    podno=1;
                                    podnum_POD="POD"+podno;
                                }
                            System.out.println("podno"+podno);
                            path="/ProofOfDelivery.jsp?generateNo=2&podno="+podnum_POD+"&WorkOrderNo="+WorkOrderNo;
                        }
                }
            else
               {
                   System.out.println("No dataaaaaaaaaaaaaaaaaaaaaaaa");
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
