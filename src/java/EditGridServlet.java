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
import java.sql.ResultSetMetaData;
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
@WebServlet(urlPatterns = {"/EditGridServlet"})
public class EditGridServlet extends HttpServlet {

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
        String usernm=null;
        ArrayList al1=new ArrayList();
        String name=null;
        try 
        {
             HttpSession s1=request.getSession(false);
            HttpSession s=request.getSession(false);
            
            System.out.println("in EditGridServlet");
            
            String type_hidden=logic.checkNull(request, "type").toString().trim();//s1.getAttribute("typeforgrid").toString().trim();
            System.out.println("EditGridServlet type_hidden"+type_hidden);
            
            String option=logic.checkNull(request, "optn").toString().trim();
            System.out.println("EditGridServlet option::"+option);
            
            Connection con=logic.getConnection();
            con.createStatement();
            
            String edit=logic.checkNull(request, "editprofile").trim();
            if(edit.equalsIgnoreCase("1"))
            {
              usernm=s.getAttribute("userName").toString().trim();  
            }
            else
            {
            usernm=logic.checkNull(request, "username").trim();
            }
            System.out.println("EditGridServlet user name= "+usernm);
            String type=logic.checkNull(request,"type").trim();
            System.out.println("EditGridServlet type= "+type);
            
            
            if(type_hidden.equalsIgnoreCase("1"))
            {
                ps=con.prepareStatement("select FirstName,LastName,UserName,Password,Address,City,State,Country,MobileNo1,MobileNo2,Gender,EmailID,Description from admin_registration where UserName=?");
                if(option.equalsIgnoreCase("a"))
                {
                    System.out.println("in if");
                    path="/ViewData_AdminGrid.jsp";
                }
                else
                {
                    System.out.println("in else");
                    path="/AdminRegistration.jsp";
                }
            }
            else if(type_hidden.equalsIgnoreCase("2")) 
            {
                System.out.println("editgridservlet in if");
                 ps=con.prepareStatement("select Name,UserName,Password,Address,City,State,Country,PhoneNo,MobileNo,Fax,ContactPerson,ContactPersonNo,EmailID,Website,Description from vendor_registration where UserName=?");
                 if(option.equalsIgnoreCase("a"))
                {
                    System.out.println("in if");
                    path="/ViewData_VendorGrid.jsp";
                }
                else
                {
                    System.out.println("in else");
                    path="/VendorRegistration.jsp";
                }
            }
            else if(type_hidden.equalsIgnoreCase("3")) 
            {
                System.out.println("editgridservlet in if");
                 ps=con.prepareStatement("select Name,Address,City,State,Country,PhoneNo,MobileNo1,MobileNo2,ContactPerson,ContactPersonNo,Description from serviceprovider_registration where Name=?");
                 ps.setString(1,name);
                 rs=ps.executeQuery();
                 while(rs.next())
                    {
                        name=rs.getString("Name").toString();
                        al1.add(name);
                    }
                 //out.println(al1);
                 if(option.equalsIgnoreCase("a"))
                {
                    System.out.println("in if");
                    path="/ViewData_ServiceProviderGrid.jsp";
                }
                else
                {
                    System.out.println("in else");
                    path="/ServiceProviderRegistration.jsp";
                }
            }
            else if(type_hidden.equalsIgnoreCase("4"))
            {
                 ps=con.prepareStatement("select Name,UserName,Password,Address,PhoneNo,MobileNo,Fax,ContactPerson,ContactPersonNo,EmailID,Website,Description from dealer_registration where UserName=?");
                 if(option.equalsIgnoreCase("a"))
                {
                    System.out.println("in if");
                    path="/ViewData_DealerGrid.jsp";
                }
                else
                {
                    System.out.println("in else");
                    path="/DealerRegistration.jsp";
                }
            }
            else
            {
              //  ps=con.prepareStatement("");
            }
            ps.setString(1,usernm);
            rs=ps.executeQuery();
            ArrayList al = new ArrayList();
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnsNumber = rsmd.getColumnCount();    
    
             while(rs.next())
             {
                for(int i=1;i<=columnsNumber;i++)
                {
                    al.add(rs.getString(i));
                }
                System.out.println("AL" + al);
            }  
            request.setAttribute("data", al);
           
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
