<%-- 
    Document   : get_AssignedVehicle
    Created on : Apr 13, 2015, 2:24:01 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,java.sql.*,functions.logic "%>
<!DOCTYPE html>
<%
        Statement stmt=null;
        ResultSet rs=null;
        String id=null;
        String no=null;
        ArrayList al=new ArrayList();
        
            String workOrderNo=logic.checkNull(request,"workOrderNo");
            System.out.println("workOrderNo::"+workOrderNo);
            Connection conn=logic.getConnection();
            stmt=conn.createStatement();
            String query="select TransportExpensesID,VehicleRegistrationNo from transport_expenses where WorkOrderNo='"+workOrderNo+"' order by VehicleRegistrationNo";
            rs=stmt.executeQuery(query);
            
            while(rs.next())
            {
                id=rs.getString("TransportExpensesID").toString();
                no=rs.getString("VehicleRegistrationNo").toString();
                al.add(id+"$"+no);
            }
            out.println(al);
            
 %> 
