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
@WebServlet(urlPatterns = {"/AssignRightsServlet"})
public class AssignRightsServlet extends HttpServlet {

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
        String path=null;
        ArrayList al = new ArrayList();
        Statement stmt=null;
        String unm=null;
        String typ=null;
        String q=null;
        try 
        {
             Connection con=logic.getConnection();
            String usernm=logic.checkNull(request, "username").trim();
            out.println("user name= "+usernm);
            String type=logic.checkNull(request,"type").trim();
            con.createStatement();
            //SELECT MenuID,MenuName FROM `menu` where MenuID in(select  MenuID from menu where ParentID="") and Type='4'
           //("select m.MenuID,m.MenuName,m.Type,m.Page,a.UserName,a.MenuID from menu m left outer join assign_rights a on m.MenuId=a.MenuID and a.UserName=? where m.Type=?");
            
            q="SELECT a.MenuID,a.MenuName,a.Page,a.Priority,a1.UserName ,a1.MenuID FROM "+
            "(SELECT * FROM menu WHERE MenuID NOT IN(SELECT DISTINCT ParentID FROM menu WHERE ParentID!=0)) a "+
            "LEFT OUTER JOIN assign_rights a1 ON a.MenuID = a1.MenuID AND a1.UserName =? "+
            "WHERE a.Type =?";

            ps=con.prepareStatement(q);
            ps.setString(1,usernm);
            ps.setString(2,type);
            rs=ps.executeQuery();
            
            while(rs.next())
            {
                al.add(rs.getString("a.MenuName")+"$"+rs.getString("a.MenuID")+"#"+rs.getString("a1.MenuID"));
            }
           
            out.println(al); 
            request.setAttribute("menuname", al);
            path="/AssignRights.jsp";
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
