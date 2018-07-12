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
@WebServlet(urlPatterns = {"/FetchLocationServlet"})
public class FetchLocationServlet extends HttpServlet {

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
        String usernm=null;
      
        //String operation=null;
        try 
        {
            HttpSession s1=req.getSession(false);
            HttpSession s=req.getSession(false);
            
            System.out.println("in FetchLocationServlet");
            
            String type_hidden=logic.checkNull(req, "type").toString().trim();
            System.out.println("FetchLocationServlet type_hidden"+type_hidden);
            
            String serviceprovidername=logic.checkNull(req,"serviceprovidername");
            System.out.println("Fetch location servlet serviceprovidername: "+serviceprovidername);
            
            Connection con=logic.getConnection();
            con.createStatement();
            
            String edit=logic.checkNull(req, "editprofile").trim();
            if(edit.equalsIgnoreCase("1"))
            {
              usernm=s.getAttribute("usernm").toString().trim();  
            }
            else
            {
            usernm=logic.checkNull(req, "username").trim();
            }
            System.out.println("FetchLocationServlet user name= "+usernm);
            
            String type=logic.checkNull(req,"type").trim();
            System.out.println("FetchLocationServlet type= "+type);
            
            if(type_hidden.equalsIgnoreCase("1")) 
            {
                System.out.println("FetchLocationServlet in if");
                ps=con.prepareStatement("select VehicleType,VehicleRegistrationNo,PermitNo,PermitState,ServiceProviderID,ServiceProviderName,Capacity from vehicle_detail where ServiceProviderName=?");
                ps.setString(1,serviceprovidername);
                path="/VehicleDetail.jsp?provider="+serviceprovidername;
            }
            else if(type_hidden.equalsIgnoreCase("2")) 
            {
                System.out.println("FetchLocationServlet in if");
                ps=con.prepareStatement("select Name,UserName,Address,City,State,Country,PhoneNo,MobileNo,Fax,ContactPerson,ContactPersonNo,Zipcode from location where UserName=?");
                ps.setString(1,usernm);
                path="/Location.jsp";
            }
            else if(type_hidden.equalsIgnoreCase("4"))
            {
                 ps=con.prepareStatement("select Name,UserName,Address,City,State,Country,PhoneNo,MobileNo,Fax,ContactPerson,ContactPersonNo,Zipcode from location where UserName=?");
                 ps.setString(1,usernm);
                 path="/Location.jsp";
            }
            else
            {
              //  ps=con.prepareStatement("");
            }
            
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
            req.setAttribute("data", al);
           
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
