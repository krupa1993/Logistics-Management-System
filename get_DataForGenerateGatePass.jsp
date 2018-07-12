<%-- 
    Document   : get_DataForGenerateGatePass
    Created on : Apr 15, 2015, 12:42:00 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,java.sql.*,functions.logic "%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <%
        Statement stmt=null;
        ResultSet rs=null;
            String id=null;
            String no=null;
            String name=null;
            String query=null;
            String qty=null;
            String vehicleregino=null;
            ArrayList al=new ArrayList();
            String vendorname=request.getParameter("vendorname");
            System.out.println("vendorname::"+vendorname);
            String workorderno=request.getParameter("workorderno");
            System.out.println("workorderno"+workorderno);
            String itemname=request.getParameter("ItemName");
            System.out.println("itemname"+itemname);
            String vehicletype=request.getParameter("VehicleType");
            System.out.println("vehicletype"+vehicletype);
            Connection conn=logic.getConnection();
            stmt=conn.createStatement();
            System.out.println("vendorname: "+vendorname);
            out.println("vendornameeee: "+vendorname);
            
            if(vendorname!=null)
            {
                System.out.println("In get_DataForGenerateGatePass vendorname if");
                query="select v.WorkOrderNo,w.WorkOrderNo,w.WorkOrderID from vehicle_assignment v inner join workorder w on v.WorkOrderNo=w.WorkOrderNo where w.VendorName='"+vendorname.trim()+"' order by w.WorkOrderNo";
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
                System.out.println("In get_DataForGenerateGatePass WorkOrderNo if");
                //query="select v.`WorkOrderNo`,w.`WorkOrderNo`,w.`VendorName` from vehicle_assignment v inner join workorder w on v.`WorkOrderNo`=w.`WorkOrderNo` and w.`VendorName`='foram'";
                query="select VehicleAssignmentID,ItemName from vehicle_assignment where WorkOrderNo='"+workorderno.trim()+"' order by ItemName";
                rs=stmt.executeQuery(query);
                while(rs.next())
                {
                    id=rs.getString("VehicleAssignmentID").toString();
                    name=rs.getString("ItemName").toString();
                    al.add(id+"$"+name);
                }
            }
            else
            {
                System.out.println("No Data");
            }
            if(itemname!=null)
            {
                System.out.println("In get_DataForGenerateGatePass ItemName if");
                query="select a.QuantityToDispatch,a.VehicleRegistrationNo,d.VehicleType,d.VehicleRegistrationNo from vehicle_assignment a inner join vehicle_detail d on a.VehicleRegistrationNo=d.VehicleRegistrationNo where a.ItemName='"+itemname.trim()+"'";
                //query="select VehicleID,VehicleType from vehicle_detail where ItemName='"+itemname+"' order by VehicleType";
                rs=stmt.executeQuery(query);
                while(rs.next())
                {
                    qty=rs.getString("QuantityToDispatch").toString();
                    vehicleregino=rs.getString("VehicleRegistrationNo").toString();
                    vehicletype=rs.getString("VehicleType").toString();
                    al.add(name+"$"+qty+"$"+vehicleregino+"$"+vehicletype);
                }
            }
            else
            {
                System.out.println("No Data");
            }
            System.out.println("@@@@"+al);
            out.println(al);
            
          
 %> 
