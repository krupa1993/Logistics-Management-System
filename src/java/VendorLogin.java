/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import functions.logic;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
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
@WebServlet(urlPatterns = {"/VendorLogin"})
public class VendorLogin extends HttpServlet {

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
        Statement stmt=null;
        Statement stmt1=null;
        ResultSet rs1=null;
        ArrayList al=new ArrayList();
           
       
        try
        {
            Connection con=logic.getConnection();
            String user=logic.checkNull(req, "uname").trim();
            System.out.println("USERNAME::"+user);
            String password=logic.checkNull(req, "pwd").trim();
            System.out.println("PASSWORD::"+password);
            String type=req.getParameter("type").trim();
            System.out.println("TYPE::"+type);
            HttpSession s=req.getSession(true);
            HttpSession s1=req.getSession(true);
            String path=null;  
            stmt=con.createStatement();
            stmt1=con.createStatement();
            Statement stmt2=con.createStatement();
            ArrayList mainmenuName=new ArrayList();
            ArrayList subMenu;
            ResultSet rs2=null;
            Map mn=new HashMap();
        
            rs=stmt.executeQuery("select UserName,Password from vendor_registration where UserName='"+user+"' and Password='"+password+"'");
            
            if(rs.next())
            {
                s.setAttribute("userName", user);
                s.setAttribute("userType",type );
                //s.setAttribute("oldpwd",password);
               // System.out.println("User"+user);
                path="/HomeServlet";
                //rs1=stmt1.executeQuery("select MenuName,Page from menu where Type='"+type+"'");
                /*rs1=stmt1.executeQuery("select m.MenuName,m.MenuID,m.Page,a.MenuID,a.UserName from menu m inner join assign_rights a on m.MenuID=a.MenuID where a.UserName='"+user+"' order by Priority");
                while(rs1.next())
                {
                    
                    al.add(rs1.getString("MenuName").toString().trim()+"$"+rs1.getString("Page").toString().trim());
                } 
                s1.setAttribute("menuname",al);
                System.out.println(al);*/
                //rs1= stmt.executeQuery("select * from menu where type='"+type+"' and parentId=0 order by priority");
                rs1= stmt.executeQuery("SELECT m.* FROM menu m INNER JOIN assign_rights a ON m.MenuID=a.MenuID AND m.ParentID=0 AND a.UserName='"+user+"'\n" 
                    +"UNION\n"
                    +"SELECT m.* FROM menu m WHERE m.MenuID IN (SELECT ParentID FROM menu WHERE MenuID IN (SELECT MenuID FROM assign_rights WHERE UserName='"+user+"'))\n" 
                    +"\n" 
                    +"ORDER BY Priority\n" 
                    +"");
                
                while(rs1.next())
                {
                   int mId= rs1.getInt("MenuID");
                   String mname=rs1.getString("MenuName");
                   String pg=rs1.getString("Page");
                   //if(pg==null)
                     //  pg="no";
                   mainmenuName.add(mname+"$"+pg);
                   //String q="select m.MenuName,m.MenuID,m.Page,a.MenuID,a.UserName from menu m inner join assign_rights a on m.MenuID=a.MenuID where a.UserName='"+user+"' and ParentID='"+mId+"' order by m.Priority";
                   String q="SELECT a.MenuID,m.MenuName,m.Page,a.UserName,m.Priority FROM assign_rights a INNER JOIN menu m ON m.MenuID=a.MenuID and m.ParentID='"+mId+"' WHERE a.UserName='"+user+"' ORDER BY m.Priority"; 
                    
                   rs2= stmt1.executeQuery(q);
                   subMenu=new ArrayList();
                   while(rs2.next())
                   {
                       subMenu.add(rs2.getString("menuName")+"$"+rs2.getString("page"));
                   }
                   mn.put(mname, subMenu);
                  s1.setAttribute("menu", mn);
                  System.out.println("main menu: "+mainmenuName);
                  System.out.println("Map>>>>>: "+mn);
                  s1.setAttribute("mainMenu", mainmenuName);
                } 
            }
            
            else
            {
                 path="/Home.jsp?err=1";
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
        System.out.println("ENDddd");
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
