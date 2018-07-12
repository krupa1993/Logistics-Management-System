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
import javax.servlet.http.HttpSession;

/**
 *
 * @author ronakrana
 */
@WebServlet(urlPatterns = {"/VendorRegistrationServlet"})
public class VendorRegistrationServlet extends HttpServlet {

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
        PreparedStatement ps1=null;
        ResultSet rs1=null;
        String operation=null;

        try 
        {
            Connection conn=logic.getConnection();
            conn.createStatement();
            operation=logic.checkNull(req,"hdn").trim();
            System.out.println("operation: "+operation);
            String type=logic.checkNull(req,"type").trim();
            
            String name=logic.checkNull(req,"nm");
            String usernm=logic.checkNull(req,"hdn1");
            String password=logic.checkNull(req,"pwd");
            String address=logic.checkNull(req,"add");
            String city=logic.checkNull(req,"city");
            String state=logic.checkNull(req,"state");
            String country=logic.checkNull(req,"country");
            String phnno=logic.checkNull(req,"phnno");
            String mobileno=logic.checkNull(req,"mobileno");
            String fax=logic.checkNull(req,"fax");
            String contactperson=logic.checkNull(req,"contactperson");
            String contactperson_no=logic.checkNull(req,"contactperson_no");
            String emailid=logic.checkNull(req,"emailid");
            String website=logic.checkNull(req,"website");
            String description=logic.checkNull(req,"description"); 
           
            HttpSession s=req.getSession(false);
            HttpSession s1=req.getSession(false);
              
            if(operation!=null && operation.equalsIgnoreCase("edit"))
            {
                System.out.println("UserName::"+s.getAttribute("userName"));
                String username1=s.getAttribute("userName").toString().trim();
                ps=conn.prepareStatement("UPDATE vendor_registration SET Name=?,Address=?,City=?,State=?,Country=?,PhoneNo=?,MobileNo=?,Fax=?,ContactPerson=?,ContactPersonNo=?,EmailID=?,Website=?,Description=? WHERE Username=?");
                ps.setString(1,name);
                ps.setString(2,address);
                ps.setString(3,city);
                ps.setString(4,state);
                ps.setString(5,country);
                ps.setString(6,phnno);
                ps.setString(7,mobileno);
                ps.setString(8,fax);
                ps.setString(9,contactperson);
                ps.setString(10,contactperson_no);
                ps.setString(11,emailid);
                ps.setString(12,website);
                ps.setString(13,description);
                ps.setString(14,usernm);
                ps.executeUpdate();
                System.out.println("after update");
                //below parameter set in url (from table)
               String utype=s.getAttribute("userType").toString().trim();
              System.out.println("in vendorRegistrationServlet: "+utype);
               if(utype.equalsIgnoreCase("1"))
                    path="/adminDisplay.jsp?typeforgrid=2";                                   
               //below path is set when link comes from admin side
               else
                    path="EditGridServlet?username="+usernm+"&optn=a&type=2";


            }
            else
            {
                ps=conn.prepareStatement("insert into vendor_registration (Name,UserName,Password,Address,City,State,Country,PhoneNo,MobileNo,Fax,ContactPerson,ContactPersonNo,EmailID,Website,Description,Type)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'2')");
                ps.setString(1,name);
                ps.setString(2,usernm);
                ps.setString(3,password);
                ps.setString(4,address);
                ps.setString(5,city);
                ps.setString(6,state);
                ps.setString(7,country);
                ps.setString(8,phnno);
                ps.setString(9,mobileno);
                ps.setString(10,fax);
                ps.setString(11,contactperson);
                ps.setString(12,contactperson_no);
                ps.setString(13,emailid);
                ps.setString(14,website);
                ps.setString(15,description);
                int i=ps.executeUpdate();

                    if(i>0)
                    {
                        out.println("Row inserted");
                        ps1=conn.prepareStatement("select EmailID,UserName,Password from vendor_registration where UserName=?");
                        ps1.setString(1,usernm);
                        rs1=ps1.executeQuery();
                        if(rs1.next())
                        {
                            if(rs1.getString("EmailID")!=null)
                            {
                            emailid=rs1.getString("EmailID");
                            usernm=rs1.getString("UserName");
                            password=rs1.getString("Password");
                            System.out.println("In servlet Emailllllllllllll::"+emailid);
                            logic.mymail1(emailid,usernm,password);
                            }
                        }
                        path="/Home.jsp";
                    }
                    else
                    {
                        path="/VendorRegistration.jsp"; 
                        out.println("Sorry!");
                    }
                    path="/adminDisplay.jsp";
                    s1.setAttribute("typeforgrid","2");
            }
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
