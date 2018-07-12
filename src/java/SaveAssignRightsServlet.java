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
@WebServlet(urlPatterns = {"/SaveAssignRightsServlet"})
public class SaveAssignRightsServlet extends HttpServlet {

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
        ArrayList al = new ArrayList();
        
        try 
        {
            Connection conn=logic.getConnection();
            conn.createStatement();
            Enumeration e=req.getParameterNames();
            String unm=logic.checkNull(req,"hdnuname").toString().trim();
            String typ=logic.checkNull(req,"hdnType").toString().trim();
            System.out.println("Username in servlet: "+unm);
            System.out.println("Type"+typ);
            Statement stmt=conn.createStatement();
            stmt.executeUpdate("delete from assign_rights where UserName='"+unm+"'");
            ps=conn.prepareStatement("insert into assign_rights(UserName,MenuID,TypeID) values(?,?,?)");
           while(e.hasMoreElements())
           {
                String element=e.nextElement().toString().trim();
                out.println("element: "+element+"<br>");
                if(element.contains("chk"))
                {
                    String ind=element.substring("chk".length()).toString().trim();
                    String mName=logic.checkNull(req,"txt"+ind);
                    String menuid=logic.checkNull(req,"hdn"+ind);
                    System.out.println("unm: "+unm);
                    System.out.println("menuid: "+menuid);
                    System.out.println("typ: "+typ);
                    
                    ps.setString(1,unm);
                    ps.setString(2,menuid);
                    ps.setString(3,typ);
                    ps.addBatch();
                    
                   // ps.executeUpdate();
                }
           }
           ps.executeBatch();
           path="/adminDisplay.jsp?typeforgrid="+typ;
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
