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
@WebServlet(urlPatterns = {"/DeleteLocationServlet"})
public class DeleteLocationServlet extends HttpServlet {

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
        String address1;
        RequestDispatcher rd=null;
        String path=null;
        
        try
        {
            Connection con=logic.getConnection();
            con.createStatement();
            HttpSession s=request.getSession(false);
            String type=s.getAttribute("userType").toString().trim();
            System.out.println("DeleteLocationServlet type::"+type);
            
            String usernm=s.getAttribute("userName").toString().trim();
            System.out.println("DeleteLocationServlet usernm::"+usernm);
             
            address1=logic.checkNull(request, "addr").toString().trim();
            System.out.println("DeleteLocationServlet addr::"+address1);
            
            if(type.equalsIgnoreCase("2"))
            {
              ps=con.prepareStatement("DELETE FROM location WHERE Address=? AND Type=? AND UserName=?");  
              path="/LocationGrid.jsp";
            }
            else if(type.equalsIgnoreCase("4"))
            {
              ps=con.prepareStatement("DELETE FROM location WHERE Address=? AND Type=? AND UserName=?");
              path="/LocationGrid.jsp";
            }
            else
            {
                System.out.println("No Data");
            }
            ps.setString(1,address1);
            ps.setString(2,type);
            ps.setString(3,usernm);
            ps.executeUpdate();
            
            path="/LocationGrid.jsp";
            rd=request.getRequestDispatcher(path);
            rd.forward(request,response);
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
