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
@WebServlet(urlPatterns = {"/LocationServlet"})
public class LocationServlet extends HttpServlet {

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
        ArrayList al=new ArrayList();
        System.out.println("InLocationservlet");
        try 
        {
            System.out.println("InLocationservlet try");
            HttpSession s=req.getSession(false);
            HttpSession s1=req.getSession(false);
            Connection conn=logic.getConnection();
            conn.createStatement();
            
            operation=logic.checkNull(req,"hdn").trim();
            System.out.println("locationservlet operation: "+operation);
            
            System.out.println("locationservlet type::"+s.getAttribute("userType"));
            String type=s.getAttribute("userType").toString().trim();
            
            System.out.println("LocationServlet Type:"+type);
            
            System.out.println("locationservlet username::"+s.getAttribute("userName"));
            
            String username1=s.getAttribute("userName").toString().trim();
            System.out.println("locationservlet UserName::"+s.getAttribute("userName"));
            
           /* String type_hidden=logic.checkNull(req, "type").toString().trim();
            System.out.println("LocationServlet type_hidden"+type_hidden);*/
            
                 
            String name=logic.checkNull(req,"nm");
            String address=logic.checkNull(req,"add");
            String city=logic.checkNull(req,"city");
            String state=logic.checkNull(req,"state");
            String country=logic.checkNull(req,"country");
            String phnno=logic.checkNull(req,"phnno");
            String mobileno=logic.checkNull(req,"mobileno");
            String fax=logic.checkNull(req,"fax");
            String contactperson=logic.checkNull(req,"contactperson");
            String contactperson_no=logic.checkNull(req,"contactperson_no");
            String zipcode=logic.checkNull(req,"zipcode");
           
            if(operation!=null && operation.equalsIgnoreCase("edit"))
            {
                System.out.println("In locationservlet if");
                ps=conn.prepareStatement("UPDATE location SET Name=?,UserName=?,Address=?,City=?,State=?,Country=?,PhoneNo=?,MobileNo=?,Fax=?,ContactPerson=?,ContactPersonNo=?,Zipcode=? WHERE UserName=?");
                ps.setString(1,name);
                ps.setString(2,username1);
                ps.setString(3,address);
                ps.setString(4,city);
                ps.setString(5,state);
                ps.setString(6,country);
                ps.setString(7,phnno);
                ps.setString(8,mobileno);
                ps.setString(9,fax);
                ps.setString(10,contactperson);
                ps.setString(11,contactperson_no);
                ps.setString(12,zipcode);
                ps.setString(13,username1);
                ps.executeUpdate();
                System.out.println("after update");
                path="/LocationGrid.jsp";
                
            }
            else
            {
                System.out.println("In locationsevlet else");
                if(type.equalsIgnoreCase("2"))
                {
                    System.out.println("locationsevlet in sub if");
                    ps=conn.prepareStatement("insert into location(Name,UserName,Address,City,State,Country,PhoneNo,MobileNo,Fax,ContactPerson,ContactPersonNo,Zipcode,Type)values(?,?,?,?,?,?,?,?,?,?,?,?,'2')");
                }
                else if(type.equalsIgnoreCase("4"))
                {
                    System.out.println("locationsevlet in sub elseif");
                    ps=conn.prepareStatement("insert into location(Name,UserName,Address,City,State,Country,PhoneNo,MobileNo,Fax,ContactPerson,ContactPersonNo,Zipcode,Type)values(?,?,?,?,?,?,?,?,?,?,?,?,'4')");
                }
                ps.setString(1,name);
                ps.setString(2,username1);
                ps.setString(3,address);
                ps.setString(4,city);
                ps.setString(5,state);
                ps.setString(6,country);
                ps.setString(7,phnno);
                ps.setString(8,mobileno);
                ps.setString(9,fax);
                ps.setString(10,contactperson);
                ps.setString(11,contactperson_no);
                ps.setString(12,zipcode);
                int i=ps.executeUpdate();

                    if(i>0)
                    {
                        System.out.println("Row inserted");
                        path="/LocationGrid.jsp";
                    }
                    else
                    {
                        path="/Location.jsp"; 
                        System.out.println("Sorry!");
                    }
            }
            //s1.setAttribute("typeforgrid","2");
            //s1.setAttribute("data",al);
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
