<%-- 
    Document   : get_DataForTransportExpenses
    Created on : Apr 15, 2015, 1:02:45 PM
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
                System.out.println("In get_DataForTransportExpenses vendorname if");
                query="select GatePassID,WorkOrderNo from generate_gatepass where VendorName='"+vendorname+"' order by WorkOrderNo";
                rs=stmt.executeQuery(query);
                while(rs.next())
                {
                    id=rs.getString("GatePassID").toString();
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
                System.out.println("In get_DataForTransportExpenses WorkOrderNo if");
                query="select GatePassID,VehicleRegistrationNo from generate_gatepass where WorkOrderNo='"+workorderno+"' order by VehicleRegistrationNo";
                rs=stmt.executeQuery(query);
                while(rs.next())
                {
                    id=rs.getString("GatePassID").toString();
                    no=rs.getString("VehicleRegistrationNo").toString();
                    al.add(id+"$"+no);
                }
            }
            else
            {
                System.out.println("No Data");
            }
            
            out.println(al);
            
          
 %> 
