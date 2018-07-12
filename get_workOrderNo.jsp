<%-- 
    Document   : get_workOrderNo
    Created on : Apr 15, 2015, 12:14:18 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,java.sql.*,functions.logic "%>
<!DOCTYPE html>
<%
        System.out.println("In get_workorderno page");
        Statement stmt=null;
        ResultSet rs=null;
        ArrayList al=new ArrayList();

            String query=null;
            String no=null;
            String id=null;
            String vendorname=request.getParameter("vendorname").trim();
            System.out.println("vendorname"+vendorname);
            Connection conn=logic.getConnection();
            stmt=conn.createStatement();
            if(vendorname!=null)
            {
                System.out.println("In get_workorderno if");
                query="select WorkOrderID,WorkOrderNo from workorder where VendorName='"+vendorname+"' order by WorkOrderNo";
                System.out.println(al);
            }
            else
            {
                System.out.println("In get_workorderno else");
                query="select WorkOrderID,WorkOrderNo from workorder order by WorkOrderNo";
            }
            rs=stmt.executeQuery(query);

            while(rs.next())
                {
                    id=rs.getString("WorkOrderID").toString();
                    no=rs.getString("WorkOrderNo").toString();
                    al.add(id+"$"+no);
                }
                out.println(al);            
 %> 
