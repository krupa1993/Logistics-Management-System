<%-- 
    Document   : dynamicWorkOrderDetailGrid
    Created on : Apr 13, 2015, 12:18:28 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,functions.logic,java.sql.*,javax.servlet.http.HttpSession "%>
<!DOCTYPE html>
<%
try
{
    HttpSession s=request.getSession(false);
    String vendorname=request.getParameter("vendorname").trim();
    System.out.println("vendorname"+vendorname);
    Connection conn=logic.getConnection();
    ResultSet rs=null;
    Statement stmt=null;
    stmt=conn.createStatement();
    String query=null;
    ArrayList colName=new ArrayList();
    
    query="select t.WorkOrderNo,t.VehicleRegistrationNo,v.WorkOrderNo,v.ItemName from transport_expenses t inner join vehicle_assignment v on t.WorkOrderNo=v.WorkOrderNo where t.VendorName='"+vendorname+"'";
    rs=stmt.executeQuery(query);
    ArrayList al=new ArrayList();
    ResultSetMetaData rsmd = rs.getMetaData();
    int columnsNumber = rsmd.getColumnCount();    
    String str=new String();
    out.println("columnsNumber: "+columnsNumber);
    if(rs!=null)
    {
        for(int k=1;k<=columnsNumber;k++) {   
        colName.add(rsmd.getColumnLabel(k));
       // out.println(nm);
        }
            while(rs.next())
            {
    //         out.println("in while");
            str=new String();    
            for(int i=1;i<=columnsNumber;i++)
            {
    //out.println("in for");

                    if(i==columnsNumber) 
                        str=str+rs.getString(i);
                    else
                        str=str+rs.getString(i)+"$";
            }
            al.add(str);
            }
             out.println(colName+"#"+al);
          }
    else
    {
               out.println("no Dta");
    }
        System.out.println(al);
   
}
catch(Exception e)
{
    out.println(e);
}
%>