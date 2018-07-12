/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import functions.logic;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.*;
/**
 *
 * @author ronakrana
 */
@WebServlet(urlPatterns = {"/AdminLogin"})
public class AdminLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     * 
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
        ResultSet rs1=null;
        ArrayList al=new ArrayList();
        Statement stmt=null;
        Statement stmt1=null;
    
        
      try
        {
            
            Connection con=logic.getConnection();
            String username=logic.checkNull(request,"uname").trim();
            System.out.println("Username in servlet:"+username);
            String password=logic.checkNull(request,"pwd").trim();
            System.out.println("Password in servlet:"+password);
            String type=logic.checkNull(request,"type").trim();
            System.out.println("Type in servlet:"+type);
            HttpSession s=request.getSession(true);
            HttpSession s1=request.getSession(true);
            String path=null;
            stmt=con.createStatement();
            stmt1=con.createStatement();
            Statement stmt2=con.createStatement();
            ArrayList mainmenuName=new ArrayList();
            ArrayList subMenu;
            ResultSet rs2=null;
            Map mn=new HashMap();
            rs=stmt.executeQuery("select UserName,Password from admin_registration where UserName='"+username+"' and Password='"+password+"'");
            if(rs.next())
            {
              s.setAttribute("userName", username);
              s.setAttribute("userType", type);
              path="/HomeServlet";
                System.out.println("##########");
              rs1= stmt.executeQuery("SELECT m.* FROM menu m INNER JOIN assign_rights a ON m.MenuID=a.MenuID AND m.ParentID=0 AND a.UserName='"+username+"'\n" 
                    +"UNION\n"
                    +"SELECT m.* FROM menu m WHERE m.MenuID IN (SELECT ParentID FROM menu WHERE MenuID IN (SELECT MenuID FROM assign_rights WHERE UserName='"+username+"'))\n" 
                    +"\n" 
                    +"ORDER BY Priority\n" 
                    +"");
              while(rs1.next())
                {
                  
                   int mId= rs1.getInt("MenuID");
                   System.out.println("MID::"+mId);
                   String mname=rs1.getString("MenuName");
                   System.out.println("1111111111");
                   String pg=rs1.getString("Page");
                   System.out.println("Page:"+pg);
                    mainmenuName.add(mname+"$"+pg);
                   System.out.println("33333");
                  
                   String q="SELECT a.MenuID,m.MenuName,m.Page,a.UserName,m.Priority FROM assign_rights a INNER JOIN menu m ON m.MenuID=a.MenuID and m.ParentID='"+mId+"' WHERE a.UserName='"+username+"' ORDER BY m.Priority";
                   
                   rs2= stmt1.executeQuery(q);

                   subMenu=new ArrayList();
                   while(rs2.next())
                   {
                        
                       subMenu.add(rs2.getString("menuName")+"$"+rs2.getString("page"));
                   }
                  mn.put(mname, subMenu);
                  s1.setAttribute("menu", mn);
                  System.out.println("main menu: "+mainmenuName);
                  System.out.println("Map: "+mn);
                  s1.setAttribute("mainMenu", mainmenuName);
                   
                }
             System.out.println("iiiiiii");
            }
            else
            {
                 path="/Home.jsp?err=1";
            }
            System.out.println("rrrrrr");
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
         System.out.println("ENDDDD");
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
