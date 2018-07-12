<%-- 
    Document   : get_DataForGeneratePOD
    Created on : Apr 15, 2015, 2:01:54 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,java.sql.*,functions.logic "%>
<!DOCTYPE html>
<%
        Statement stmt=null;
        ResultSet rs=null;
            String id=null;
            String no=null;
            String query=null;
            ArrayList al=new ArrayList();
            String vendorname=request.getParameter("vendorname");
            System.out.println("vendorname::"+vendorname);
            String workorderno=request.getParameter("workorderno");
            System.out.println("workorderno"+workorderno);
            Connection conn=logic.getConnection();
            stmt=conn.createStatement();
            
            if(vendorname!=null)
            {
                System.out.println("In get_DataForGeneratePOD vendorname if");
                query="select v.WorkOrderNo,w.WorkOrderNo,w.WorkOrderID from vehicle_assignment v inner join workorder w on v.WorkOrderNo=w.WorkOrderNo where w.VendorName='"+vendorname+"' order by w.WorkOrderNo";
                rs=stmt.executeQuery(query);
                while(rs.next())
                {
                    id=rs.getString("WorkOrderID").toString();
                    no=rs.getString("WorkOrderNo").toString();
                    al.add(id+"$"+no);
                    System.out.println("WorkOrderNo al::"+al);
                }
            }
            else
            {
                System.out.println("No Data");
            }
            if(workorderno!=null)
            {
                System.out.println("In get_DataForGeneratePOD WorkOrderNo if");
                query="select GatePassID from generate_gatepass where WorkOrderNo='"+workorderno+"'";
                rs=stmt.executeQuery(query);
                while(rs.next())
                {
                    id=rs.getString("GatePassID").toString();
                    al.add(id);
                }
            }
            else
            {
                System.out.println("No Data");
            }
            
            System.out.println("@@@@"+al);
            out.println(al);
            
          
 %> 
