<%-- 
    Document   : get_VendorName
    Created on : Apr 10, 2015, 3:31:08 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,java.sql.*,functions.logic "%>
<!DOCTYPE html>
<%
        String url=null;
        Statement stmt=null;
        ResultSet rs=null;
        ArrayList al=new ArrayList();
        
            String name=null;
            String id=null;
            String query=null;
            Connection conn=logic.getConnection();
            stmt=conn.createStatement();
            String operation=logic.checkNull(request,"operation");
            
            if(operation.equalsIgnoreCase("1"))
            {
                query="select DealerID,UserName from dealer_registration order by UserName";
                rs=stmt.executeQuery(query);
                while(rs.next())
                {
                    id=rs.getString("DealerID").toString();
                    name=rs.getString("UserName").toString();
                    al.add(id+"$"+name);
                }
                out.println(al);
            }
            else if(operation.equalsIgnoreCase("2"))
            {
                query="select ServiceProviderID,Name from serviceprovider_registration order by Name";
                rs=stmt.executeQuery(query);
                while(rs.next())
                {
                    id=rs.getString("ServiceProviderID").toString();
                    name=rs.getString("Name").toString();
                    al.add(id+"$"+name);
                }
                out.println(al);
            }
            else if(operation.equalsIgnoreCase("3"))
            {
                query="select VendorID,UserName from vendor_registration order by UserName";
                rs=stmt.executeQuery(query);
                while(rs.next())
                {
                    id=rs.getString("VendorID").toString();
                    name=rs.getString("UserName").toString();
                    al.add(id+"$"+name);
                }
                out.println(al);
            }
            else
            {
                System.out.println("No Data");
            }
            
          
 %> 
