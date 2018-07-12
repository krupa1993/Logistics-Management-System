<%-- 
    Document   : get_ItemName
    Created on : Apr 15, 2015, 12:16:38 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,java.sql.*,functions.logic "%>
<!DOCTYPE html>
<%
        Statement stmt=null;
        ResultSet rs=null;
            String id=null;
            String name=null;
            String query=null;
            String qty=null;
            String vehicleregino=null;
            ArrayList al=new ArrayList();
            String workorderno=request.getParameter("workorderno");
            System.out.println("workorderno"+workorderno);
            String itemname=request.getParameter("ItemName");
            System.out.println("itemname"+itemname);
            String serviceprovidername=request.getParameter("ServiceProviderName");
            System.out.println("serviceprovidername"+serviceprovidername);
            String vehicletype=request.getParameter("VehicleType");
            System.out.println("vehicletype"+vehicletype);
            Connection conn=logic.getConnection();
            stmt=conn.createStatement();
            if(workorderno!=null)
            {
                al=new ArrayList();
                System.out.println("In get_itemname if");
                query="select ItemID,ItemName from workorderitem where WorkOrderNo='"+workorderno+"' order by ItemName";
                rs=stmt.executeQuery(query);
                while(rs.next())
                {
                    id=rs.getString("ItemID").toString();
                    name=rs.getString("ItemName").toString();
                    al.add(id+"$"+name);
                }
                workorderno=null;
            }
            else
            {
                System.out.println("No Data");
            }
            if(itemname!=null)
            {
                al=new ArrayList();
                System.out.println("In get_itemname else if");
                query="select ItemID,Quantity from workorderitem where ItemName='"+itemname+"' order by Quantity";
                rs=stmt.executeQuery(query);
                while(rs.next())
                {
                    id=rs.getString("ItemID").toString();
                    qty=rs.getString("Quantity").toString();
                    al.add(id+"$"+qty);
                    System.out.println(al);
                }
                itemname=null;
            }
            else
            {
                System.out.println("No Data");
            }
            if(serviceprovidername!=null)
            {
                al=new ArrayList();
                System.out.println("In serviceprovidername if");
                query="select VehicleID,VehicleType from vehicle_detail where ServiceProviderName='"+serviceprovidername+"' order by VehicleType";
                rs=stmt.executeQuery(query);
                while(rs.next())
                {
                    id=rs.getString("VehicleID").toString();
                    vehicletype=rs.getString("VehicleType").toString();
                    al.add(id+"$"+vehicletype);
                }
                serviceprovidername=null;
                vehicletype=null;
                System.out.println("ArrayList a1= "+al);
            }
            else
            {
                System.out.println("No Data");
            }
            if(vehicletype!=null && (vehicletype.trim().length()>0))
            {
                al=new ArrayList();
                System.out.println("In get_vehicletype if: " + vehicletype);
                query="select VehicleID,VehicleRegistrationNo from vehicle_detail where VehicleType='"+vehicletype+"' order by VehicleRegistrationNo";
                rs=stmt.executeQuery(query);
                while(rs.next())
                {
                    id=rs.getString("VehicleID").toString();
                    vehicleregino=rs.getString("VehicleRegistrationNo").toString();
                    al.add(id+"$"+vehicleregino);
                    
                }
                vehicletype=null;
            }
            else
            {
                System.out.println("No Data");
            }
            out.println(al);
            
          
 %> 
