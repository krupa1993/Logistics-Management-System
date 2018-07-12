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
@WebServlet(urlPatterns = {"/ChangePasswordServlet"})
public class ChangePasswordServlet extends HttpServlet {

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
        PreparedStatement ps=null;
        Statement stmt=null;
        String path=null;
        String pass=null;
        int i=0;
        
        System.out.println("In changepwd servlet");
        try 
        {
            Connection conn=logic.getConnection();
            conn.createStatement();
            HttpSession s=request.getSession(false);
            
            String type=s.getAttribute("userType").toString().trim();
            System.out.println("Changepassword type:"+type);
            
            String oldpassword=logic.checkNull(request,"oldpwd").trim();
            System.out.println("oldpassword:"+oldpassword);
            
            String newpassword=logic.checkNull(request,"newpwd").trim();
            System.out.println("newpassword:"+newpassword);
            
            String confirmpassword=logic.checkNull(request,"cnfmpwd").trim();
            System.out.println("confirmpassword:"+confirmpassword);
            
            String user=s.getAttribute("userName").toString().trim();
            System.out.println("changepwd user"+user);
            
            if(type.equalsIgnoreCase("1"))
            {
               System.out.println("In main if");
               ps=conn.prepareStatement("select Password from admin_registration where UserName=? and Password=?");
               ps.setString(1,user);
               ps.setString(2,oldpassword);
               rs=ps.executeQuery();
               if(rs.next())
               {
                   ps=conn.prepareStatement("UPDATE admin_registration SET Password=? WHERE UserName=?");
                   ps.setString(1,newpassword);
                   ps.setString(2,user);
                   i=ps.executeUpdate();
                   path="/UpdatePassword.jsp";
                   out.println("Old Password right");
                }
                else
                {
                    System.out.println("In sub if");
                    path="/ChangePassword.jsp?err=1";
                   
                }
             }
             else if(type.equalsIgnoreCase("2"))
             {
               System.out.println("In main if");
               ps=conn.prepareStatement("select Password from vendor_registration where UserName=? and Password=?");
               ps.setString(1,user);
               ps.setString(2,oldpassword);
               rs=ps.executeQuery();
               if(rs.next())
               {
                   ps=conn.prepareStatement("UPDATE vendor_registration SET Password=? WHERE UserName=?");
                   ps.setString(1,newpassword);
                   ps.setString(2,user);
                   i=ps.executeUpdate();
                   path="/UpdatePassword.jsp";
                }
                else
                {
                    System.out.println("In sub if");
                    path="/ChangePassword.jsp?err=1";
                }
                
             }
             else if(type.equalsIgnoreCase("4"))
             {
                System.out.println("In main if");
                ps=conn.prepareStatement("select Password from dealer_registration where UserName=? and Password=?");
                ps.setString(1,user);
                ps.setString(2, oldpassword);
                rs=ps.executeQuery();
                if(rs.next())
                {
                    ps=conn.prepareStatement("UPDATE dealer_registration SET Password=? WHERE UserName=?");
                    ps.setString(1,newpassword);
                    ps.setString(2,user);
                    i=ps.executeUpdate();
                    path="/UpdatePassword.jsp";
                    }
                    else
                    {
                        System.out.println("In sub if");
                        path="/ChangePassword.jsp?err=1";
                    }
             }
             else
             {
                 out.println("No Data");
             }
            
            rd=request.getRequestDispatcher(path);
            rd.forward(request, response);
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
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
