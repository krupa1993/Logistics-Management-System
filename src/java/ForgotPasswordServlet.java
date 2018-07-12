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
@WebServlet(urlPatterns = {"/ForgotPasswordServlet"})
public class ForgotPasswordServlet extends HttpServlet {

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
        PreparedStatement ps=null;
        PreparedStatement ps1=null;
        ResultSet rs=null;
        ResultSet rs1=null;
        String email="",path="";
        RequestDispatcher rd=null;
       try 
        {
            Connection conn=logic.getConnection();
            conn.createStatement();
            System.out.println("In ForgotPasswordServlet");
            String uname=logic.checkNull(request,"uname").trim();
            System.out.println("uname::"+uname);
            String type=logic.checkNull(request,"type").trim();
            System.out.println("type"+type);
            if(type.equalsIgnoreCase("1"))
            {
                System.out.println("In ForgotPasswordServlet In If");
                ps=conn.prepareStatement("select UserName,Type from admin_registration where UserName=? and Type=?");
                ps.setString(1,uname);
                ps.setString(2,type);
                rs=ps.executeQuery();
                if(rs.next())
                {
                ps1=conn.prepareStatement("select EmailID from admin_registration where UserName=?");
                ps1.setString(1,uname);
                rs1=ps1.executeQuery();
                if(rs1.next())
                {
                    if(rs1.getString("EmailID")!=null)
                    {
                    email=rs1.getString("EmailID");
                    System.out.println("In servlet Emailllllllllllll::"+email);
                    logic.mymail(email,uname,type);
                    }
                }
                path="/ForgotPassword.jsp";
                 rd=getServletContext().getRequestDispatcher(path);
            rd.forward(request, response);
                }
                else
                {
                    path="/ForgotPassword.jsp?err=1";
                     rd=getServletContext().getRequestDispatcher(path);
            rd.forward(request, response);
                }
               
            }
            else if(type.equalsIgnoreCase("2"))
            {
                System.out.println("In ForgotPasswordServlet type 2");
                ps=conn.prepareStatement("select UserName,Type from vendor_registration where UserName=? and Type=?");
                ps.setString(1,uname);
                ps.setString(2,type);
                rs=ps.executeQuery();
                if(rs.next())
                {
                ps1=conn.prepareStatement("select EmailID from vendor_registration where UserName=?");
                ps1.setString(1,uname);
                rs1=ps1.executeQuery();
                if(rs1.next())
                {
                    if(rs1.getString("EmailID")!=null)
                    {
                    email=rs1.getString("EmailID");
                    System.out.println("In servlet Emailllllllllllll::"+email);
                    logic.mymail(email,uname,type);
                    }
                }
                path="/ForgotPassword.jsp";
                 rd=getServletContext().getRequestDispatcher(path);
            rd.forward(request, response);
                }
                else
                {
                    path="/ForgotPassword.jsp?err=1";
                     rd=getServletContext().getRequestDispatcher(path);
            rd.forward(request, response);
                }
            }
            else if(type.equalsIgnoreCase("4"))
            {
                System.out.println("In ForgotPasswordServlet type 4");
                ps=conn.prepareStatement("select UserName,Type from dealer_registration where UserName=? and Type=?");
                ps.setString(1,uname);
                ps.setString(2,type);
                rs=ps.executeQuery();
                if(rs.next())
                {
                ps1=conn.prepareStatement("select EmailID from dealer_registration where UserName=?");
                ps1.setString(1,uname);
                rs1=ps1.executeQuery();
                if(rs1.next())
                {
                    if(rs1.getString("EmailID")!=null)
                    {
                    email=rs1.getString("EmailID");
                    System.out.println("In servlet Emailllllllllllll::"+email);
                    logic.mymail(email,uname,type);
                    }
                }
                System.out.println("rrrrrrrrr");
                path="/ForgotPassword.jsp";
                 rd=getServletContext().getRequestDispatcher(path);
            rd.forward(request, response);
                }
                else
                {
                    System.out.println("kkkkkkkkkk");
                    path="/ForgotPassword.jsp?err=1";
                     rd=getServletContext().getRequestDispatcher(path);
            rd.forward(request, response);
                }
            }
            else
            {
                   out.println("Sorry! Type didnt matched!");
            }
       
            System.out.println("rs1");
            
            System.out.println("Mail::"+logic.checkNull(request,"mail"));
            /*path="/ForgotPassword.jsp";
            rd=getServletContext().getRequestDispatcher(path);
            rd.forward(request, response);*/
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
