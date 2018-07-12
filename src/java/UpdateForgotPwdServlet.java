/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import functions.logic;

/**
 *
 * @author admin
 */
public class UpdateForgotPwdServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();PreparedStatement ps=null;
        ResultSet rs=null;
        RequestDispatcher rd=null;
        String path=null;
        try 
        {
            Connection conn=logic.getConnection();
            conn.createStatement();
            System.out.println("In UpdateForgotPwdServlet");
            
            String type=logic.checkNull(request,"hdntype").trim();
            System.out.println("UpdateForgotPwdServlet type"+type);
            
            System.out.println("In UpdateForgotPwdServlet Mail if");
            
            String newpassword=logic.checkNull(request,"newpassword").trim();
            System.out.println("UpdateForgotPwdServlet Newpwd::"+newpassword);

            String user=logic.checkNull(request,"hdnunm").trim();
            System.out.println("UpdateForgotPwdServlet user::"+user);
            
                if(type.equalsIgnoreCase("1"))
                {
                    ps=conn.prepareStatement("UPDATE admin_registration SET Password=? WHERE UserName=?");
                }
                else if(type.equalsIgnoreCase("2"))
                {
                    ps=conn.prepareStatement("UPDATE vendor_registration SET Password=? WHERE UserName=?");
                }
                else if(type.equalsIgnoreCase("4"))
                {
                    ps=conn.prepareStatement("UPDATE dealer_registration SET Password=? WHERE UserName=?");
                }
                else
                {
                    System.out.println("No Data");
                }
                    ps.setString(1,newpassword);
                    ps.setString(2,user);
                    ps.executeUpdate();
                    path="/Home.jsp";
                    rd=getServletContext().getRequestDispatcher(path);
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
