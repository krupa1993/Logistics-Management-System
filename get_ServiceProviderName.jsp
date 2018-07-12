<%-- 
    Document   : get_ServiceProviderName
    Created on : Apr 13, 2015, 2:18:45 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,java.sql.*,functions.logic "%>
<!DOCTYPE html>
<%
        Statement stmt=null;
        ResultSet rs=null;
        
            String name=null;
            String id=null;
            String wrkorderNo=logic.checkNull(request,"wrkorderNo");
            Connection conn=logic.getConnection();
            stmt=conn.createStatement();
            String query="select VehicleAssignmentID,ServiceProviderName from vehicle_assignment where WorkOrderNo='"+wrkorderNo+"' order by ServiceProviderName";
            rs=stmt.executeQuery(query);
            ArrayList al=new ArrayList();
           
            while(rs.next())
            {
                id=rs.getString("VehicleAssignmentID").toString();
                name=rs.getString("ServiceProviderName").toString();
                al.add(id+"$"+name);
            }
            out.println(al);
          
 %> 
