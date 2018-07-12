<%-- 
    Document   : dynamicVehicleAssignmentTable
    Created on : Apr 13, 2015, 7:31:32 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,functions.logic,java.sql.*,javax.servlet.http.HttpSession "%>
<!DOCTYPE html>
<%
try
{
    String query=null;
    Connection conn=logic.getConnection();
    ResultSet rs=null;
    Statement stmt=null;
    stmt=conn.createStatement();
    String serviceprovidername=logic.checkNull(request, "serviceprovidername");
    ArrayList colName=new ArrayList();
    
    query="select WorkOrderNo,ItemName,QuantityToDispatch,ServiceProviderName,VehicleRegistrationNo from vehicle_assignment";
    rs=stmt.executeQuery(query);
    ArrayList al=new ArrayList();
    ResultSetMetaData rsmd = rs.getMetaData();
    int columnsNumber = rsmd.getColumnCount();    
    String str=new String();
    out.println("columnsNumber: "+columnsNumber);
    if(rs!=null)
    {
        for(int k=1;k<=columnsNumber;k++)
        {   
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