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
@WebServlet(urlPatterns = {"/AdminRegistrationServlet"})
public class AdminRegistrationServlet extends HttpServlet {

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
        String url=null;
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
            
            String firstname=logic.checkNull(req,"nm1");
            String lastname=logic.checkNull(req,"nm2");
            String usernm=logic.checkNull(req,"nm3");
            String password=logic.checkNull(req,"pwd");
            String emailid=logic.checkNull(req,"emailid");
            String address=logic.checkNull(req,"add");
            String city=logic.checkNull(req,"city");
            String state=logic.checkNull(req,"state");
            String country=logic.checkNull(req,"country");
            String mobileno1=logic.checkNull(req,"mobileno1");
            String mobileno2=logic.checkNull(req,"mobileno2");
            String gender=logic.checkNull(req,"gender");
            String description=logic.checkNull(req,"description"); 
            
            if(operation!=null && operation.equalsIgnoreCase("edit"))
            {
                
                
                System.out.println("UserName::"+s.getAttribute("userName"));
                String username1=s.getAttribute("userName").toString().trim();
                ps=conn.prepareStatement("UPDATE admin_registration SET FirstName=?,LastName=?,Address=?,City=?,State=?,Country=?,MobileNo1=?,MobileNo2=?,Gender=?,EmailID=?,Description=? WHERE Username=?");
                ps.setString(1,firstname);
                ps.setString(2,lastname);
                ps.setString(3,address);
                ps.setString(4,city);
                ps.setString(5,state);
                ps.setString(6,country);
                ps.setString(7,mobileno1);
                ps.setString(8,mobileno2);
                ps.setString(9,gender);
                ps.setString(10,emailid);
                ps.setString(11,description);
                ps.setString(12,usernm);
                ps.executeUpdate();
                System.out.println("after update");
                path="/adminDisplay.jsp?typeforgrid=1";
            }
            else
            {
                ps=conn.prepareStatement("insert into admin_registration (FirstName,LastName,UserName,Password,Address,City,State,Country,MobileNo1,MobileNo2,Gender,EmailID,Description,Type)values(?,?,?,?,?,?,?,?,?,?,?,?,?,'1')");
                //address.replace(",", ";");
                ps.setString(1,firstname);
                ps.setString(2,lastname);
                ps.setString(3,usernm);
                ps.setString(4,password);
                ps.setString(5,address);
                ps.setString(6,city);
                ps.setString(7,state);
                ps.setString(8,country);
                ps.setString(9,mobileno1);
                ps.setString(10,mobileno2);
                ps.setString(11,gender);
                ps.setString(12,emailid);
                ps.setString(13,description);
                int i=ps.executeUpdate();

                    if(i>0)
                    {
                        out.println("Row inserted");
                        path="/Home.jsp";
                    }
                    else
                    {
                        path="/AdminRegistration.jsp"; 
                        out.println("Sorry!");
                    }
                    path="/adminDisplay.jsp";
                    s1.setAttribute("typeforgrid","1");
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
