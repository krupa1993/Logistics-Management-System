<%-- 
    Document   : get_VendorLocation
    Created on : Apr 14, 2015, 7:56:52 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,java.sql.*,functions.logic "%>
<!DOCTYPE html>
<%      System.out.println("get_vendorLocation");
        Statement stmt=null;
        ResultSet rs=null;
        
            String name=logic.checkNull(request,"vendorname");
            System.out.println("vendorname::"+name);
            String name1=logic.checkNull(request,"dealername");
            System.out.println("dealername::"+name1);
            String address=null;
            String userid=null;
            String query=null;
            Connection conn=logic.getConnection();
            stmt=conn.createStatement();
            String operation=logic.checkNull(request,"operation");
            if(operation.equalsIgnoreCase("1"))
            {
                query="select UserID,Address from location where UserName='"+name1+"' order by Name";
            }
            else
            {
                query="select UserID,Address from location where UserName='"+name+"' order by Name";
            }      
            rs=stmt.executeQuery(query);
            ArrayList al=new ArrayList();
           
            while(rs.next())
            {
                userid=rs.getString("UserID").toString();
                address=rs.getString("Address").toString();
                al.add(userid+"$"+address);
            }
            out.println(al);
            System.out.println(al);
          
 %> 
