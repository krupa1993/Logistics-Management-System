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
@WebServlet(urlPatterns = {"/GeneratePODServlet"})
public class GeneratePODServlet extends HttpServlet {

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
        ResultSet rs=null;
        ArrayList al = new ArrayList();
        try 
        {
            System.out.println("in GeneratePODServlet");
            Connection con=logic.getConnection();
            con.createStatement();
            
            String POD_NO=logic.checkNull(req,"hdnpodnum");
            String VendorName=logic.checkNull(req,"vendorName");
            String WorkOrderNo=logic.checkNull(req,"WorkOrderNo");
            String GatePassId=logic.checkNull(req,"gatePassId");
            String Date=logic.checkNull(req,"date");
            /*String workorderno=req.getParameter("workorderno");
            System.out.println("workorderno::"+workorderno);*/
           
            ps=con.prepareStatement("insert into pod (POD_NO,VendorName,WorkOrderNo,GatePass,Date)values(?,?,?,?,?)");
            ps.setString(1,POD_NO);
            ps.setString(2,VendorName);
            ps.setString(3,WorkOrderNo);
            ps.setString(4,GatePassId);
            ps.setString(5,Date);
            int i=ps.executeUpdate();
            if(i>0)
            {
                ps=con.prepareStatement("update generate_gatepass set Status=? where GatePassID=?");
            ps.setString(1,"Goods Delivered");
            ps.setString(2,GatePassId);
            
            
            ps.executeUpdate();
            }
            int flag=0;
            if(i>0)
            {
                out.println("Row inserted");
                ps=con.prepareStatement("select p.POD_ID,p.WorkOrderNo,p.GatePass,g.GatePassID  from pod p right join generate_gatepass g on p.GatePass=g.GatePassID and p.WorkOrderNo=?");
                ps.setString(1,WorkOrderNo);
                rs=ps.executeQuery();
                while(rs.next())
                {
                    String s=rs.getString("p.POD_ID");
                    if(s==null)
                    {
                       flag=1;
                       break;
                    }
                }
               System.out.println("flag::"+flag);
                if(flag==0)
                {
                    System.out.println("In flag==0");
                    System.out.println("WorkOrderNo::"+WorkOrderNo);
                    Statement stmt=con.createStatement();
                    stmt.executeUpdate("UPDATE workorder SET Status='Goods Delivered' WHERE WorkOrderNo='"+WorkOrderNo+"'");
                }
            al.add(POD_NO);
            al.add(VendorName);
            al.add(WorkOrderNo);
            al.add(GatePassId);
            al.add(Date);
            System.out.println("AL" + al);
            path="/GenerateWorkOrderNoServlet?generateNo=2&WorkOrderNo="+WorkOrderNo;
            }
            else
            {
                //path="/GenerateGatePass.jsp"; 
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