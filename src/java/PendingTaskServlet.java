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
@WebServlet(urlPatterns = {"/PendingTaskServlet"})
public class PendingTaskServlet extends HttpServlet {

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
        
        try 
        {
            Connection conn=logic.getConnection();
            conn.createStatement();
            HttpSession s=req.getSession(false);
            
            System.out.println("UserName::"+s.getAttribute("userName"));
            String username1=s.getAttribute("userName").toString().trim();
            
            String date=logic.checkNull(req,"date");
            String description=logic.checkNull(req,"desc"); 
            
                ps=conn.prepareStatement("insert into pendingtask (PendingTaskDescription,Date,UserName)values(?,?,?)");
                ps.setString(1,description);
                ps.setString(2,date);
                ps.setString(3,username1);
                int i=ps.executeUpdate();

                    if(i>0)
                    {
                        out.println("Row inserted");
                        path="/HomeServlet";
                    }
                    else
                    {
                        path="/PendingTask.jsp"; 
                        out.println("Sorry!");
                    }
         
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
