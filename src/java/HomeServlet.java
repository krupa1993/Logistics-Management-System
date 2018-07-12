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
import javax.servlet.http.HttpSession;

/**
 *
 * @author ronakrana
 */
@WebServlet(urlPatterns = {"/HomeServlet"})
public class HomeServlet extends HttpServlet {

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
        PreparedStatement ps=null;
        Statement stmt=null;
        String path=null;
        ArrayList Reminder = new ArrayList();
        ArrayList PendingTask = new ArrayList();
        int i=0;
        HttpSession s=request.getSession(false);
        
        System.out.println("In Home servlet");
        try 
             {
                 System.out.println("kkkkkkk");
            Connection conn=logic.getConnection();
            conn.createStatement();
            System.out.println("hhhhhhh");
            String username=s.getAttribute("userName").toString().trim();
            System.out.println("Username::"+username);
            ps=conn.prepareStatement("select ReminderSubject,ReminderDescription from reminder where UserName=?");
            
            ps.setString(1,username);
            System.out.println("lllllll");
             rs=ps.executeQuery();
             System.out.println("uuurrr");
             
             while(rs.next())
                {
                    
                    Reminder.add(rs.getString("ReminderSubject")+":"+rs.getString("ReminderDescription"));
                    System.out.println("AL" + Reminder);
                }
             
            ps=conn.prepareStatement("select PendingTaskDescription,Date from pendingtask where UserName=?");
            ps.setString(1,username);
            rs=ps.executeQuery();
             while(rs.next())
                {
                    PendingTask.add(rs.getString("PendingTaskDescription")+":"+rs.getString("Date"));
                    System.out.println("AL" + PendingTask);
                }
            ArrayList a1=new ArrayList();
            ps=conn.prepareStatement("select workorderno,vendorname,Date,status from workorder");
           // ps.setString(1,username);
            rs=ps.executeQuery();
             while(rs.next())
                {
                    System.out.println("ZZZZZZZZ");
                    a1.add(rs.getString("workorderno")+":"+rs.getString("Vendorname")+":"+rs.getString("date")+":"+rs.getString("status"));
                    System.out.println("AL" + PendingTask);
                }
            
             System.out.println("MMMMMMM");
             
            request.setAttribute("reminder",Reminder);
            request.setAttribute("pendingTask",PendingTask);
             request.setAttribute("workorder",a1);
            rd=request.getRequestDispatcher("/Welocme_page.jsp");
            rd.forward(request, response);
            System.out.println("The End");
        } 
        catch(Exception e)
        {
            out.println(e);
        }
        finally {            
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
