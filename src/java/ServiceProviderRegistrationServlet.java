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
@WebServlet(urlPatterns = {"/ServiceProviderRegistrationServlet"})
public class ServiceProviderRegistrationServlet extends HttpServlet {

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
        String operation=null;
     
        try 
        {
            Connection conn=logic.getConnection();
            conn.createStatement();
            operation=logic.checkNull(req,"hdn").trim();
            System.out.println("operation: "+operation);
            String type=logic.checkNull(req,"type").trim();
            HttpSession s=req.getSession(false);
            HttpSession s1=req.getSession(false);
            
            String name=logic.checkNull(req,"nm");
            System.out.println("Service provider Name:"+name);
            String address=logic.checkNull(req,"add");
            String city=logic.checkNull(req,"city");
            String state=logic.checkNull(req,"state");
            String country=logic.checkNull(req,"country");
            String phnno=logic.checkNull(req,"phnno");
            String mobileno1=logic.checkNull(req,"mobileno1");
            String mobileno2=logic.checkNull(req,"mobileno2");
            String contactperson=logic.checkNull(req,"contactperson");
            String contactperson_no=logic.checkNull(req,"contactperson_no");
            String description=logic.checkNull(req,"description"); 
            
            if(operation!=null && operation.equalsIgnoreCase("edit"))
            {
                System.out.println("UserName::"+s.getAttribute("userName"));
                String username1=s.getAttribute("userName").toString().trim();
                ps=conn.prepareStatement("UPDATE serviceprovider_registration SET Address=?,City=?,State=?,Country=?,PhoneNo=?"
                        + ",MobileNo1=?,MobileNo2=?,ContactPerson=?,ContactPersonNo=?,Description=? WHERE Name=?");
                ps.setString(1,address);
                ps.setString(2,city);
                ps.setString(3,state);
                ps.setString(4,country);
                ps.setString(5,phnno);
                ps.setString(6,mobileno1);
                ps.setString(7,mobileno2);
                ps.setString(8,contactperson);
                ps.setString(9,contactperson_no);
                ps.setString(10,description);
                ps.setString(11,name);
                ps.executeUpdate();
                System.out.println("after update");
                path="/adminDisplay.jsp?typeforgrid=3";
            }
            else
            {
                ps=conn.prepareStatement("insert into serviceprovider_registration (Name,Address,City,State,Country,PhoneNo,MobileNo1,MobileNo2,ContactPerson,ContactPersonNo,Description,Type)values(?,?,?,?,?,?,?,?,?,?,?,'3')");
                ps.setString(1,name);
                ps.setString(2,address);
                ps.setString(3,city);
                ps.setString(4,state);
                ps.setString(5,country);
                ps.setString(6,phnno);
                ps.setString(7,mobileno1);
                ps.setString(8,mobileno2);
                ps.setString(9,contactperson);
                ps.setString(10,contactperson_no);
                ps.setString(11,description);
             
                int i=ps.executeUpdate();

                    if(i>0)
                    {
                        out.println("Row inserted");
                        path="/Home.jsp";
                    }
                    else
                    {
                        path="/ServiceProviderRegistration.jsp"; 
                        out.println("Sorry!");
                    }
                    path="/adminDisplay.jsp";
                    s1.setAttribute("typeforgrid","3");
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
